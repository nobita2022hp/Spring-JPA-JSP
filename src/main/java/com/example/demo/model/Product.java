package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "products")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {

    @Id
    private String productId;

    private String categoryId;

    @NotNull
    @Size(min = 3, max = 30)
    @NotBlank(message = "Name can't be null")
    private String productName;

    @NotNull
    @Min(0)
    private float price;

    @Size(min = 5, max = 130)
    @NotBlank(message = "Description can't be null")
    private String description;
}
