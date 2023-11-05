package io.igorv404.flightradar.repositories;

import io.igorv404.flightradar.models.Model;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ModelRepository extends JpaRepository<Model, String> {}
