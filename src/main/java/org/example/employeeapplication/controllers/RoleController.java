package org.example.employeeapplication.controllers;

import org.example.employeeapplication.entities.Role;
import org.example.employeeapplication.services.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class RoleController {

    @Autowired
    private RoleService roleService;

    @GetMapping("/roles")
    public String listRoles(Model model) {
        model.addAttribute("roles", roleService.getAllRoles());
        return "roles";
    }

    @PostMapping("/addRole")
    public String addRole(@RequestParam String roleName,
                          @RequestParam String roleTitle,
                          @RequestParam String roleDomain,
                          @RequestParam String employeesListVisibility) { // Add this line

        Role role = new Role(null, roleName, roleTitle, roleDomain, employeesListVisibility); // Update constructor call
        roleService.addRole(role);
        return "redirect:/roles";
    }
}
