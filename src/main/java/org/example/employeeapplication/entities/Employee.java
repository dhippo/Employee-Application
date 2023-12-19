package org.example.employeeapplication.entities;
import jakarta.persistence.Table;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.management.relation.Role;
import java.sql.Date;


@Entity
@Data
@Table(name = "employees")
@NoArgsConstructor
@AllArgsConstructor
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "employee_id")
    private Long id;

    @Column(name = "employee_phone", unique = true, nullable = false)
    private Long employeePhone;

    @Column(name = "first_name", nullable = false)
    private String firstName;

    @Column(name = "last_name", nullable = false)
    private String lastName;

    @Column(name = "email", unique = true, nullable = false)
    private String email;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "hire_date", nullable = false)
    private Date hireDate;

    @Column(name = "pole", nullable = false)
    private String pole;

    @Column(name = "role", nullable = false)
    private String role;

    @Column(name = "admin", nullable = false)
    private boolean admin;


}
