package org.example.employeeapplication.services;



import org.example.employeeapplication.entities.Employee;
import org.example.employeeapplication.repositories.EmployeeRepo;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepo employeeRepo;

    public void addEmployee(Employee employee) {
        employeeRepo.save(employee);
    }

    public List<Employee> getAllEmployees() {
        List<Employee> employees = new ArrayList<>();
        employeeRepo.findAll().forEach(employees::add);
        return employees;
    }

    public Employee login(String email, String password) {
        Employee employee = employeeRepo.findByEmail(email);
        if (employee != null && employee.getPassword().equals(password)) {
            return employee;
        }
        return null;
    }
    public Employee findEmployeeById(Long id) {
        return employeeRepo.findById(id).orElse(null);
    }

    public Employee updateEmployee(Employee employee) {
        // Assuming the employee with the given ID already exists
        return employeeRepo.save(employee);
    }
    public void deleteEmployeeById(Long id) {
        employeeRepo.deleteById(id);
    }
}