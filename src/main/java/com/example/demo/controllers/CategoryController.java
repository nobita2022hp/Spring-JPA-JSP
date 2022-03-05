package com.example.demo.controllers;

import com.example.demo.model.Category;
import com.example.demo.repositories.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("category")
public class CategoryController {

    @Autowired
    CategoryRepository repository;

    @GetMapping
    public String getAll(ModelMap model){
        var categories = repository.findAll();
        model.addAttribute("categories", categories);
        return "category";
    }
}
