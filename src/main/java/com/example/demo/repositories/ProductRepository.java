package com.example.demo.repositories;

import com.example.demo.model.Product;
import org.springframework.data.repository.CrudRepository;

public interface ProductRepository extends CrudRepository<Product, String> {
    Iterable<Product> findProductsByCategoryId(String categoryId);
}
