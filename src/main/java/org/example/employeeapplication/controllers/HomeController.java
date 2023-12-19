package org.example.employeeapplication.controllers;

import org.example.employeeapplication.entities.Employee;
import org.example.employeeapplication.services.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @GetMapping("/employee/edit/{id}")
    public String showUpdateForm(@PathVariable("id") Long id, Model model) {
        Employee employee = employeeService.findEmployeeById(id);
        if (employee == null) {
            return "errorPage";
        }
        model.addAttribute("employee", employee);
        return "updateEmployee";
    }

    @PostMapping("/employee/update")
    public String updateEmployee(@ModelAttribute("employee") Employee employee) {
        employeeService.updateEmployee(employee);
        return "redirect:/";
    }
    @GetMapping("/employee/delete/{id}")
    public String deleteEmployee(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        try {
            employeeService.deleteEmployeeById(id);
            redirectAttributes.addFlashAttribute("successMessage", "Employé correctement supprimé");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Erreur pendant la suppression de l'employé");
        }
        return "redirect:/";
    }

}