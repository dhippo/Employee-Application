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

    public List<Employee> searchByName(String term) {
        return employeeRepo.findByFirstNameContainingIgnoreCase(term);
    }

    public boolean isEmailUnique(String email) {
        return !employeeRepo.existsByEmail(email);
    }

    public boolean isPhoneUnique(Long phone) {
        return !employeeRepo.existsByEmployeePhone(phone);
    }

    public List<Employee> getfilterPoleAndSortedEmployees(String filterPole, String sort) {
        if ("".equals(filterPole) && "".equals(sort)){
            return null;
        }

        if ("".equals(filterPole)){
            if ("asc".equals(sort)) {
                return employeeRepo.findAllByOrderByFirstNameAsc();
            } else if ("desc".equals(sort)) {
                return employeeRepo.findAllByOrderByFirstNameDesc();
            }
        }
        if ("".equals(sort)){
            return employeeRepo.findByPoleOrderByFirstNameAsc(filterPole);
        }

        return null;
    }
}