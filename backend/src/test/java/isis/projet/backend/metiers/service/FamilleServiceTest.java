package isis.projet.backend.metiers.service;

import isis.projet.backend.metiers.dto.FamilleDTO;
import isis.projet.backend.metiers.entity.Famille;
import isis.projet.backend.metiers.repository.FamilleRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class FamilleServiceTest {

    @Mock
    private FamilleRepository repo;

    @InjectMocks
    private FamilleService service;

    private Famille famille;

    @BeforeEach
    void setUp() {
        famille = new Famille();
        famille.setId(1L);
        famille.setNom("Management de projet");
        famille.setDescription("Famille orientée gestion de projet SI");
        famille.setOrdre(2);
    }

    @Test
    void findAll_returnsMappedDTOs() {
        when(repo.findAllByOrderByOrdreAsc()).thenReturn(List.of(famille));
        List<FamilleDTO> result = service.findAll();
        assertThat(result).hasSize(1);
        assertThat(result.get(0).nom()).isEqualTo("Management de projet");
    }

    @Test
    void findById_existingId_returnsDTO() {
        when(repo.findById(1L)).thenReturn(Optional.of(famille));
        FamilleDTO dto = service.findById(1L);
        assertThat(dto.id()).isEqualTo(1L);
        assertThat(dto.nom()).isEqualTo("Management de projet");
    }

    @Test
    void findById_unknownId_throws404() {
        when(repo.findById(99L)).thenReturn(Optional.empty());
        assertThatThrownBy(() -> service.findById(99L))
                .isInstanceOf(ResponseStatusException.class)
                .hasMessageContaining("99");
    }

    @Test
    void create_savesAndReturnsMappedDTO() {
        when(repo.save(any(Famille.class))).thenReturn(famille);
        FamilleDTO dto = new FamilleDTO(null, "Management de projet", "Desc", 2, null);
        FamilleDTO result = service.create(dto);
        assertThat(result.nom()).isEqualTo("Management de projet");
        verify(repo).save(any(Famille.class));
    }

    @Test
    void delete_unknownId_throws404() {
        when(repo.existsById(99L)).thenReturn(false);
        assertThatThrownBy(() -> service.delete(99L))
                .isInstanceOf(ResponseStatusException.class);
    }

    @Test
    void delete_existingId_callsDeleteById() {
        when(repo.existsById(1L)).thenReturn(true);
        service.delete(1L);
        verify(repo).deleteById(1L);
    }
}
