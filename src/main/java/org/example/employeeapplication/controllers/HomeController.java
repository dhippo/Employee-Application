package org.example.employeeapplication.controllers;

import jakarta.servlet.http.HttpServletRequest;
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
    public String showEmployees(Model model, HttpServletRequest request) {
        String userEmail = (String) request.getSession().getAttribute("userEmail");
        Boolean isAdmin = (Boolean) request.getSession().getAttribute("isAdmin");

        if (userEmail == null || userEmail.isEmpty()) {
            return "redirect:/login";
        }

        Employee loggedInEmployee = employeeService.findByEmail(userEmail);
        model.addAttribute("loggedInEmployee", loggedInEmployee);

        long totalEmployees = employeeService.countAllEmployees();
        long totalEmployeesThisMonth = employeeService.countEmployeesThisMonth();
        long totalAdmins = employeeService.countAdminEmployees();

        model.addAttribute("totalEmployees", totalEmployees);
        model.addAttribute("totalEmployeesThisMonth", totalEmployeesThisMonth);
        model.addAttribute("totalAdmins", totalAdmins);


        if (isAdmin != null && !isAdmin) {
            return "redirect:/user";
        }

        List<Employee> employees = employeeService.getAllEmployees();
        model.addAttribute("employees", employees);
        return "home";
    }





    @GetMapping("/search")
    public ResponseEntity<List<Employee>> search(@RequestParam String term) {
        List<Employee> employees = employeeService.searchByName(term);
        return ResponseEntity.ok(employees);
    }

    @GetMapping("/updateEmployee")
    public String showUpdateEmployeePage(@RequestParam("id") Long id, Model model) {
        Employee employee = employeeService.findEmployeeById(id);
        model.addAttribute("employee", employee);
        return "updateEmployee";
    }

    @PostMapping("/deleteEmployee")
    public String deleteEmployee(@RequestParam("id") Long id) {
        employeeService.deleteEmployeeById(id);
        return "redirect:/";
    }

    @PostMapping("/updateEmployee")
    public String updateEmployee(@ModelAttribute Employee employee, RedirectAttributes redirectAttributes) {
        try {
            // Mise à jour de l'employé
            employeeService.updateEmployee(employee);
            redirectAttributes.addFlashAttribute("successMessage", "L'employé a été mis à jour avec succès.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Erreur lors de la mise à jour de l'employé.");
        }
        return "redirect:/";
    }

    @PostMapping("/updateFirstName")
    public String updateFirstName(@RequestParam("firstName") String firstName, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        // Récupération de l'employé actuel et mise à jour du prénom
        String userEmail = (String) request.getSession().getAttribute("userEmail");
        Employee employee = employeeService.findByEmail(userEmail);
        employee.setFirstName(firstName);
        employeeService.updateEmployee(employee);
        redirectAttributes.addFlashAttribute("successMessage", "Prénom mis à jour avec succès.");
        return "redirect:/user";
    }

    @PostMapping("/updateLastName")
    public String updateLastName(@RequestParam("lastName") String lastName, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        // Récupération de l'employé actuel et mise à jour du nom
        String userEmail = (String) request.getSession().getAttribute("userEmail");
        Employee employee = employeeService.findByEmail(userEmail);
        employee.setLastName(lastName);
        employeeService.updateEmployee(employee);
        redirectAttributes.addFlashAttribute("successMessage", "Nom mis à jour avec succès.");
        return "redirect:/user";
    }

    @GetMapping("/user")
    public String showUserProfile(HttpServletRequest request, Model model) {
        String userEmail = (String) request.getSession().getAttribute("userEmail");

        if (userEmail == null || userEmail.isEmpty()) {
            return "redirect:/login";
        }

        Employee employee = employeeService.findByEmail(userEmail);
        model.addAttribute("employee", employee);
        return "user";
    }

    @GetMapping("/updateAdmin")
    public String showUpdateAdminPage(@RequestParam("id") Long id, Model model) {
        Employee employee = employeeService.findEmployeeById(id);
        if (!employee.isAdmin()) {
            return "redirect:/"; // Rediriger vers l'accueil si l'employé n'est pas un admin
        }
        model.addAttribute("employee", employee);
        return "updateAdmin";
    }

    @PostMapping("/updateAdmin")
    public String updateAdmin(@ModelAttribute Employee employee, RedirectAttributes redirectAttributes) {
        try {
            // Mise à jour de l'administrateur
            employeeService.updateEmployee(employee); // Assurez-vous que cette méthode gère correctement les mises à jour d'admin
            redirectAttributes.addFlashAttribute("successMessage", "Administrateur mis à jour avec succès.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Erreur lors de la mise à jour de l'administrateur.");
        }
        return "redirect:/";
    }

}