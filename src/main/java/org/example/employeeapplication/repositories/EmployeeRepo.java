package org.example.employeeapplication.repositories;

import org.example.employeeapplication.entities.Employee;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface EmployeeRepo extends CrudRepository<Employee, Long>{
}
