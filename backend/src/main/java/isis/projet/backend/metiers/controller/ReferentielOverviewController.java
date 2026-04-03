package isis.projet.backend.metiers.controller;

import isis.projet.backend.metiers.dto.FamilleOverviewDTO;
import isis.projet.backend.metiers.service.ReferentielOverviewService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/referentiel")
public class ReferentielOverviewController {

    private final ReferentielOverviewService service;

    public ReferentielOverviewController(ReferentielOverviewService service) {
        this.service = service;
    }

    @GetMapping("/overview")
    public List<FamilleOverviewDTO> getOverview() {
        return service.buildOverview();
    }
}
