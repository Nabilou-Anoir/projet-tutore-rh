package isis.projet.backend.config;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseAuth;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Configuration
public class FirebaseConfig {

    @Value("${firebase.credentials-file:}")
    private String credentialsFile;

    @Value("${firebase.project-id:}")
    private String projectId;

    @Bean
    public FirebaseApp firebaseApp() throws IOException {
        if (!FirebaseApp.getApps().isEmpty()) {
            return FirebaseApp.getInstance();
        }

        GoogleCredentials credentials;
        if (StringUtils.hasText(credentialsFile)) {
            Path path = Paths.get(credentialsFile);
            try (InputStream serviceAccount = Files.newInputStream(path)) {
                credentials = GoogleCredentials.fromStream(serviceAccount);
            }
        } else {
            try {
                credentials = GoogleCredentials.getApplicationDefault();
            } catch (IOException exception) {
                throw new IllegalStateException("Firebase credentials are not configured. Set firebase.credentials-file or GOOGLE_APPLICATION_CREDENTIALS.", exception);
            }
        }

        FirebaseOptions.Builder builder = FirebaseOptions.builder().setCredentials(credentials);
        if (StringUtils.hasText(projectId)) {
            builder.setProjectId(projectId);
        }
        return FirebaseApp.initializeApp(builder.build());
    }

    @Bean
    public FirebaseAuth firebaseAuth(FirebaseApp firebaseApp) {
        return FirebaseAuth.getInstance(firebaseApp);
    }
}
