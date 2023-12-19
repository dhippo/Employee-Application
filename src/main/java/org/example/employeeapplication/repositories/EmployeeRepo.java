package org.example.employeeapplication.repositories;

import org.example.employeeapplication.entities.Employee;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface EmployeeRepo extends CrudRepository<Employee, Long>{


    List<Employee> findByFirstNameContainingIgnoreCase(String term);

    boolean existsByEmail(String email);

    boolean existsByEmployeePhone(Long employeePhone);


    List<Employee> findAllByOrderByFirstNameAsc();
    List<Employee> findAllByOrderByFirstNameDesc();

    Object findAll(Sort ascending);

    List<Employee> findByPoleOrderByFirstNameAsc(String filterPole);
}
