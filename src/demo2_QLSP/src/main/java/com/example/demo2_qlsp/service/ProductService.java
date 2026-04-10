package com.example.demo2_qlsp.service;

import com.example.demo2_qlsp.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> getAll();
    boolean createProduct(Product products);
    boolean updateProduct(int id, Product product);
    boolean deleteProduct(int id);
    Product getProductByID(int id);
    Product findProductByName(String name);
}
