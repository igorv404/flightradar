package io.igorv404.flightradar.repositories;

import io.igorv404.flightradar.models.Model;
import io.igorv404.flightradar.models.Plane;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PlaneRepository extends JpaRepository<Plane, UUID> {
  List<Plane> findAllByModelName(Model model);
}
