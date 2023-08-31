package io.igorv404.flightradar.repositories;

import io.igorv404.flightradar.models.Airport;
import io.igorv404.flightradar.models.Flight;
import io.igorv404.flightradar.models.enums.Status;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FlightRepository extends JpaRepository<Flight, UUID> {
  List<Flight> findAllByStatus(Status status);

  List<Flight> findAllByStartAirportId(Airport airport);

  List<Flight> findAllByEndAirportId(Airport airport);

  List<Flight> findAllByStartDate(LocalDate date);

  List<Flight> findAllByEndDate(LocalDate date);
}
