package org.example.employeeapplication.controllers;

import org.example.employeeapplication.entities.Employee;
import org.example.employeeapplication.services.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private EmployeeService employeeService;


    @PostMapping("/addEmployee")
    public String addEmployee(@RequestParam Long employeePhone,
                              @RequestParam String firstName,
                              @RequestParam String lastName,
                              @RequestParam String email,
                              @RequestParam String password,
                              @RequestParam String hireDate,
                              @RequestParam String pole,
                              @RequestParam String role,
                              RedirectAttributes redirectAttributes
    ) throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date parsedDate = formatter.parse(hireDate);
        java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());

//      Verifier si le numero de telephone ou l'email existe deja dans la base de donnees
        if (!employeeService.isEmailUnique(email)) {
            redirectAttributes.addFlashAttribute("errorMessage", "Votre mail existe déjà !");
            return "redirect:/";
        }
        if (!employeeService.isPhoneUnique(employeePhone)) {
            redirectAttributes.addFlashAttribute("errorMessage", "Votre numéro de téléphone existe déjà !");
            return "redirect:/";
        }

        Employee newEmployee = new Employee(null, employeePhone, firstName, lastName, email, password, sqlDate, pole, role, false);
        employeeService.addEmployee(newEmployee);
        return "redirect:/";
    }

    @PostMapping("/filter")
    public String filter(@RequestParam String trie, @RequestParam String filterPole, Model model) {

        List<Employee> employees = employeeService.getfilterPoleAndSortedEmployees(filterPole, trie);
        System.out.println(employees);
        model.addAttribute("employees", employees);
        return "home";
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