package io.igorv404.flightradar.repositories;

import io.igorv404.flightradar.models.Airport;
import io.igorv404.flightradar.models.City;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AirportRepository extends JpaRepository<Airport, UUID> {
  List<Airport> findAllByCityId(City city);
}
