package org.example.employeeapplication.repositories;

import org.example.employeeapplication.entities.Role;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleRepo extends CrudRepository<Role, Long> {
    List<Role> findByRoleNameContainingIgnoreCase(String term);
}
