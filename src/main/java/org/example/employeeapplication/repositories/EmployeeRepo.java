package org.example.employeeapplication.repositories;

import org.example.employeeapplication.entities.Employee;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;


@Repository
public interface EmployeeRepo extends CrudRepository<Employee, Long>{

    Employee findByEmail(String email);

    List<Employee> findByFirstNameContainingIgnoreCase(String term);

    boolean existsByEmail(String email);

    boolean existsByEmployeePhone(Long employeePhone);


    List<Employee> findAllByOrderByFirstNameAsc();
    List<Employee> findAllByOrderByFirstNameDesc();

    Object findAll(Sort ascending);

    List<Employee> findByPoleOrderByFirstNameAsc(String filterPole);


    @Query("SELECT COUNT(e) FROM Employee e WHERE e.hireDate >= :startOfMonth AND e.hireDate <= :endOfMonth")
    long countEmployeesThisMonth(@Param("startOfMonth") LocalDate startOfMonth, @Param("endOfMonth") LocalDate endOfMonth);

    long countByAdmin(boolean admin);
}
