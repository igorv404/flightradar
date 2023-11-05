package io.igorv404.flightradar.repositories;

import io.igorv404.flightradar.models.Pilot;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PilotRepository extends JpaRepository<Pilot, UUID> {
  List<Pilot> findAllByFlightExperienceGreaterThanEqual(Integer flightExperience);
}
