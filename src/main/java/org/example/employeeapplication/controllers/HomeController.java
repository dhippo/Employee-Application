package org.example.employeeapplication.controllers;

import org.example.employeeapplication.entities.Employee;
import org.example.employeeapplication.services.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private EmployeeService employeeService;


    @PostMapping("/addEmployee")
    public String addEmployee(@RequestParam String employeeNumber,
                              @RequestParam String firstName,
                              @RequestParam String lastName,
                              @RequestParam String email,
                              @RequestParam String password,
                              @RequestParam String hireDate,
                              @RequestParam String role) throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date parsedDate = formatter.parse(hireDate);
        java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());

        Employee newEmployee = new Employee(null, employeeNumber, firstName, lastName, email, password, sqlDate, role);
        employeeService.addEmployee(newEmployee);
        return "redirect:/";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showEmployees(Model model) {
        List<Employee> employees = employeeService.getAllEmployees();
        model.addAttribute("employees", employees);
        return "home";
    }

    @GetMapping("/search")
    public ResponseEntity<List<Employee>> search(@RequestParam String term) {
        List<Employee> employees = employeeService.searchByName(term);

        return ResponseEntity.ok(employees);
    }

}