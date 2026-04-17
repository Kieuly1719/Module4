package com.example.qlsp_connectdb.service;

import com.example.qlsp_connectdb.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    List<Product> findProductByCategoryID(int category_id);
    List<Product> searchByProductName (String productName);
    Product findById(int id);
    boolean deleteProduct (int id);
    boolean updateProduct (Product product);
    boolean addProduct(Product product);
}
