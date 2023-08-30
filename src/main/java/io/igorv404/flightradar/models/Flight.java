package io.igorv404.flightradar.models;

import io.igorv404.flightradar.models.enums.Status;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.UUID;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Flight {
  @Id
  @GeneratedValue(strategy = GenerationType.UUID)
  private UUID id;

  @ManyToOne
  @JoinColumn(referencedColumnName = "id")
  private Pilot pilotId;

  @ManyToOne
  @JoinColumn(referencedColumnName = "id")
  private Plane planeId;

  @ManyToOne
  @JoinColumn(referencedColumnName = "id")
  private Airport startAirportId;

  @ManyToOne
  @JoinColumn(referencedColumnName = "id")
  private Airport endAirportId;

  @Column(nullable = false)
  private LocalDate startDate;

  @Column(nullable = false)
  private LocalTime startTime;

  @Column(nullable = false)
  private LocalDate endDate;

  @Column(nullable = false)
  private LocalTime endTime;

  @Column(nullable = false)
  @Enumerated(EnumType.STRING)
  private Status status;
}
