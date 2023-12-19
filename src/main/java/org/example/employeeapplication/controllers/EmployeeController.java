package org.example.employeeapplication.controllers;

import org.example.employeeapplication.entities.Employee;
import org.example.employeeapplication.entities.Role;
import org.example.employeeapplication.services.EmployeeService;
import org.example.employeeapplication.services.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.List;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;
    private RoleService RoleService;


    @GetMapping("/search")
    public ResponseEntity<List<Employee>> search(@RequestParam String term) {
        List<Employee> employees = employeeService.searchByName(term);

        return ResponseEntity.ok(employees);
    }

    // Assuming 'role' parameter is the roleName and you have a method in RoleService to get Role by name
    @PostMapping("/addEmployee")
    public String addEmployee(@RequestParam String employeeNumber,
                              @RequestParam String firstName,
                              @RequestParam String lastName,
                              @RequestParam String email,
                              @RequestParam String password,
                              @RequestParam String hireDate,
                              @RequestParam String roleName) throws Exception {

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date parsedDate = formatter.parse(hireDate);
        java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());

        Role role = (Role) RoleService.searchByRoleName(roleName); // This method needs to be defined in your RoleService

        Employee newEmployee = new Employee(null, employeeNumber, firstName, lastName, email, password, sqlDate, role);
        employeeService.addEmployee(newEmployee);
        return "redirect:/admin";
    }

    /*@PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password, Model model) {
        Employee employee = employeeService.login(email, password);
        if (employee != null) {
            model.addAttribute("loggedInEmployee", employee);
            return "redirect:/admin";
        }
        model.addAttribute("errorMessage", "Email ou mot de passe incorrect.");
        return "login";
    }*/

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String showEmployees(@ModelAttribute("loggedInEmployee") Employee loggedInEmployee, Model model) {
        List<Employee> employees = employeeService.getAllEmployees();
        model.addAttribute("employees", employees);
        model.addAttribute("employeeName", loggedInEmployee.getFirstName()); // Pass the first name to the view
        return "admin";
    }


}
