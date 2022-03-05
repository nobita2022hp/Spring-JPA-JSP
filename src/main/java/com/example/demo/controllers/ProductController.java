package com.example.demo.controllers;

import com.example.demo.model.Product;
import com.example.demo.repositories.CategoryRepository;
import com.example.demo.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("product")
public class ProductController {

    @Autowired
    ProductRepository repository;

    @Autowired
    CategoryRepository crepository;

    @GetMapping("getProductByCategoryId/{categoryId}")
    public String getProductByCategoryId(ModelMap model, @PathVariable String categoryId){
        var products = repository.findProductsByCategoryId(categoryId);
        model.addAttribute("products", products);
        return "productList";
    }

    @GetMapping("changeCategory/{productId}")
    public String changeCategory(ModelMap model, @PathVariable String productId){
        model.addAttribute("categories", crepository.findAll());
        model.addAttribute("product", repository.findById(productId).get());
        return "assign";
    }

    @PostMapping("changeCategory/{productId}")
    public String changeCategory(
            ModelMap model,
            @Valid @ModelAttribute("product") Product product,
            BindingResult br,
            @PathVariable String productId){

        if (br.hasErrors()){
            model.addAttribute("categories", crepository.findAll());
            return "assign";
        }

        var p = repository.findById(productId);
        if (p.isPresent()){
            var pro = p.get();
            pro.setCategoryId(product.getCategoryId());
            pro.setProductName(product.getProductName());
            pro.setPrice(product.getPrice());
            pro.setDescription(product.getDescription());
            repository.save(pro);
        }

        return "redirect:/product/getProductByCategoryId/" + product.getCategoryId();
    }

    @GetMapping("insert")
    public String insert(ModelMap model){
        model.addAttribute("product", new Product());
        model.addAttribute("categories", crepository.findAll());
        return "insert";
    }

    @PostMapping("insert")
    public String insert(ModelMap model,
                         @Valid @ModelAttribute Product product,
                         BindingResult result){
        if (result.hasErrors()){
            return "insert";
        }

        try {
            repository.save(product);
            return "redirect:/product/getProductByCategoryId/" + product.getCategoryId();
        }catch (Exception e){
            model.addAttribute("error", e.getMessage());
            return "insert";
        }
    }

    @RequestMapping("delete/{productId}")
    public String delete(@PathVariable String productId){
        var product = repository.findById(productId);
        repository.deleteById(productId);
        return "redirect:/product/getProductByCategoryId/" + product.get().getCategoryId();
    }
}
