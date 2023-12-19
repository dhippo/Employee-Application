package org.example.employeeapplication.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Optional;

@Entity
@Data
@Table(name = "roles")
@NoArgsConstructor
@AllArgsConstructor
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "role_id")
    private Long id;

    @Column(name = "role_name", unique = true, nullable = false)
    private String roleName;

    @Column(name = "role_title", nullable = false)
    private String roleTitle;

    @Column(name = "role_domain", nullable = false)
    private String roleDomain;

    @Column(name = "employees_list_visibility", nullable = false)
    private String employeesListVisibility;

}
