package com.sweater.sweater.controller;

import com.sweater.sweater.entity.User;
import com.sweater.sweater.entity.Role;
import com.sweater.sweater.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class Registration {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(
            User user,
            Map<String, Object> model) {
        System.out.println("POST REGISTRATION");
        User userFromDB = userRepository.findByUsername(user.getUsername());

        if (userFromDB != null) {
            System.out.println("USER EXISTS");
            model.put("message", "User exists!");
            return "registration";
        }

        user.setEnabled(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        userRepository.save(user);

        return "redirect:/login";
    }
}
