package org.example.employeeapplication.services;

import org.example.employeeapplication.entities.Role;
import org.example.employeeapplication.repositories.RoleRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RoleService {

    @Autowired
    private RoleRepo roleRepo;

    public Role addRole(Role role) {
        return roleRepo.save(role);
    }

    public List<Role> getAllRoles() {
        return (List<Role>) roleRepo.findAll();
    }

    public Optional<Role> getRoleById(Long id) {
        return roleRepo.findById(id);
    }



    public List<Role> searchByRoleName(String term) {
        return roleRepo.findByRoleNameContainingIgnoreCase(term);
    }

    public void deleteRole(Long id) {
        roleRepo.deleteById(id);
    }
}
