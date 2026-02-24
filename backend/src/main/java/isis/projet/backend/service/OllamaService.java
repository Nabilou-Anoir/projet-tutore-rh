package isis.projet.backend.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.time.Duration;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

@Service
@RequiredArgsConstructor
@Slf4j
public class OllamaService {

    private final RestTemplate restTemplate;

    @Value("${ollama.base-url:http://localhost:11434}")
    private String baseUrl;
    @Value("${ollama.cli-path:ollama}")
    private String ollamaCli;

    public OllamaStatusResponse checkStatus(String model) {
        final String url = buildUrl("/api/tags");
        try {
            ResponseEntity<Map> response = restTemplate.getForEntity(url, Map.class);
            List<String> models = extractModelNames(response.getBody());
            boolean modelReady = models.stream().anyMatch(name -> name.toLowerCase().contains(model.toLowerCase()));
            String message = modelReady
                ? String.format("Le modèle %s est disponible.", model)
                : String.format("Service actif mais le modèle %s n'est pas chargé.", model);
            return new OllamaStatusResponse(true, modelReady, message, models, model);
        } catch (RestClientException ex) {
            log.warn("Impossible de joindre Ollama : {}", ex.getMessage());
            return new OllamaStatusResponse(false, false, "Ollama injoignable. Lancez `ollama serve`.", List.of(), model);
        }
    }

    public OllamaStatusResponse warmupModel(String model) {
        final String url = buildUrl("/api/generate");
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            Map<String, Object> payload = Map.of(
                "model", model,
                "prompt", "Ping de demarrage RH",
                "stream", false,
                "keep_alive", "10m"
            );
            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(payload, headers);
            restTemplate.postForEntity(url, entity, Map.class);
            return new OllamaStatusResponse(true, true, String.format("Modèle %s initialisé.", model), List.of(model), model);
        } catch (RestClientException ex) {
            log.warn("Echec de l'initialisation du modèle {} : {}", model, ex.getMessage());
            return new OllamaStatusResponse(false, false, "Impossible de charger le modèle : " + ex.getMessage(), List.of(), model);
        }
    }

    public OllamaStatusResponse launchAndWarmup(String model) {
        OllamaStatusResponse status = checkStatus(model);
        if (status.online && status.modelReady) {
            return status;
        }
        boolean launched = runLaunchCommand(model);
        if (!launched) {
            return new OllamaStatusResponse(false, false, "Impossible de démarrer Ollama via la CLI.", List.of(), model);
        }
        try {
            Thread.sleep(Duration.ofSeconds(2));
        } catch (InterruptedException ex) {
            Thread.currentThread().interrupt();
        }
        return warmupModel(model);
    }

    private String buildUrl(String path) {
        if (baseUrl.endsWith("/")) {
            return baseUrl.substring(0, baseUrl.length() - 1) + path;
        }
        return baseUrl + path;
    }

    private List<String> extractModelNames(Map body) {
        if (body == null) {
            return Collections.emptyList();
        }
        Object models = body.get("models");
        if (models instanceof List<?> list) {
            return list.stream()
                .map(item -> {
                    if (item instanceof Map<?, ?> map) {
                        Object name = map.get("name");
                        if (name instanceof String s) {
                            return s;
                        }
                    }
                    return null;
                })
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
        }
        return Collections.emptyList();
    }

    public record OllamaStatusResponse(
        boolean online,
        boolean modelReady,
        String message,
        List<String> models,
        String targetModel
    ) {}

    private boolean runLaunchCommand(String model) {
        ProcessBuilder processBuilder = new ProcessBuilder(
            ollamaCli,
            "run",
            "--keepalive=10m",
            model,
            "Ping de démarrage RH"
        );
        processBuilder.redirectErrorStream(true);
        try {
            Process process = processBuilder.start();
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    log.info("ollama> {}", line);
                }
            }
            boolean finished = process.waitFor(120, TimeUnit.SECONDS);
            if (!finished) {
                process.destroyForcibly();
                log.warn("Le processus Ollama n'a pas terminé dans les temps.");
                return false;
            }
            if (process.exitValue() != 0) {
                log.warn("La commande Ollama s'est terminée avec le code {}", process.exitValue());
                return false;
            }
            return true;
        } catch (IOException | InterruptedException ex) {
            if (ex instanceof InterruptedException interruptedException) {
                Thread.currentThread().interrupt();
                log.warn("Lancement Ollama interrompu : {}", interruptedException.getMessage());
                return false;
            }
            log.warn("Impossible d'exécuter la commande Ollama : {}", ex.getMessage());
            return false;
        }
    }
}
