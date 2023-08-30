package io.igorv404.flightradar.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Company {
  @Id
  private String name;

  @ManyToOne
  @JoinColumn(name = "country_name", referencedColumnName = "name")
  private Country countryName;
}
