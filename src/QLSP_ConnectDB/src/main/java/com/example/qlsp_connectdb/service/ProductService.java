package com.example.qlsp_connectdb.service;

import com.example.qlsp_connectdb.model.Product;
import com.example.qlsp_connectdb.repository.IProductRepository;
import com.example.qlsp_connectdb.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
    private IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public List<Product> findProductByCategoryID(int category_id) {
        return productRepository.findProductByCategoryID(category_id);
    }

    @Override
    public List<Product> searchByProductName(String productName) {
        return productRepository.searchByProductName(productName);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public boolean deleteProduct(int id) {
        return productRepository.deleteProduct(id);
    }

    @Override
    public boolean updateProduct(Product product) {
        if(!isValidProduct(product)){
            return false;
        }
        return productRepository.updateProduct(product);
    }

    @Override
    public boolean addProduct(Product product) {
        return productRepository.addProduct(product);
    }

    private boolean isValidProduct(Product product) {
        if (product == null) {
            return false;
        }

        if (product.getName() == null || product.getName().trim().isEmpty()) {
            return false;
        }

        if (product.getPrice() < 0) {
            return false;
        }

        if (product.getQuantity() < 0) {
            return false;
        }

        if (product.getCategory_id() <= 0) {
            return false;
        }
        return true;
    }
}
