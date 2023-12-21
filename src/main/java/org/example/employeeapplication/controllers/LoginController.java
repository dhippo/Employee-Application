package org.example.employeeapplication.controllers;

import jakarta.servlet.http.HttpSession;
import org.example.employeeapplication.entities.Employee;
import org.example.employeeapplication.services.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password, Model model, HttpSession session) {
        Employee employee = employeeService.login(email, password);
        if (employee != null) {
            session.setAttribute("userEmail", employee.getEmail());
            session.setAttribute("isAdmin", employee.isAdmin());
            return employee.isAdmin() ? "redirect:/" : "redirect:/user";
        }
        model.addAttribute("errorMessage", "Email ou mot de passe incorrect.");
        return "login";
    }




    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Efface tous les attributs de la session
        return "redirect:/login";
    }
}
