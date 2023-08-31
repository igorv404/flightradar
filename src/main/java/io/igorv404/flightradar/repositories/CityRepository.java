package io.igorv404.flightradar.repositories;

import io.igorv404.flightradar.models.City;
import io.igorv404.flightradar.models.Country;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CityRepository extends JpaRepository<City, UUID> {
  List<City> findAllByCountryName(Country country);
}
