package io.igorv404.flightradar.repositories;

import io.igorv404.flightradar.models.Company;
import io.igorv404.flightradar.models.Country;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CompanyRepository extends JpaRepository<Company, String> {
  List<Company> findAllByCountryName(Country country);
}
