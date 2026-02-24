package isis.projet.backend.controller;

import isis.projet.backend.service.OllamaService;
import isis.projet.backend.service.OllamaService.OllamaStatusResponse;
import jakarta.validation.constraints.NotBlank;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/rest/ollama")
@RequiredArgsConstructor
public class OllamaController {

    private final OllamaService ollamaService;

    @GetMapping(value = "/status", produces = MediaType.APPLICATION_JSON_VALUE)
    public OllamaStatusResponse getStatus(@RequestParam(defaultValue = "mistral") String model) {
        return ollamaService.checkStatus(model);
    }

    @PostMapping(value = "/warmup", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public OllamaStatusResponse warmup(@RequestBody WarmupRequest request) {
        return ollamaService.warmupModel(request.model());
    }

    @PostMapping(value = "/launch", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public OllamaStatusResponse launch(@RequestBody WarmupRequest request) {
        return ollamaService.launchAndWarmup(request.model());
    }

    public record WarmupRequest(@NotBlank String model) {}
}
