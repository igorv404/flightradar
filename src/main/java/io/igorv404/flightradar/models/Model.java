package io.igorv404.flightradar.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Model {
  @Id
  private String name;

  @Column(nullable = false)
  private Double length;

  @Column(nullable = false)
  private Double wingspan;
}
