package com.example.demo2_qlsp.service;

import com.example.demo2_qlsp.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService{
    private static Map<Integer, Product> products = new HashMap<>();
    static {
        products.put(1, new Product(1, "iPhone 15 Pro", 1000.0, "Điện thoại Apple mới nhất", "Apple"));
        products.put(2, new Product(2, "Galaxy S24 Ultra", 1200.0, "Điện thoại Samsung tích hợp AI", "Samsung"));
        products.put(3, new Product(3, "MacBook Air M3", 1100.0, "Laptop mỏng nhẹ", "Apple"));
        products.put(4, new Product(4, "Dell XPS 15", 1500.0, "Laptop đồ hoạ", "Dell"));
        products.put(5, new Product(5, "Bàn phím cơ Keychron", 100.0, "Bàn phím cơ không dây", "Keychron"));
    }
    @Override
    public List<Product> getAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public boolean createProduct(Product product) {
        int newId = products.size() + 1;
        product.setId(newId);
        products.put(newId, product);
        return true;
    }


    @Override
    public boolean updateProduct(int id, Product product) {
        if(products.containsKey(id)){
            products.put(id, product);
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteProduct(int id) {
        if(products.containsKey(id)){
            products.remove(id);
            return true;
        }
        return false;
    }

    @Override
    public Product getProductByID(int id) {
        return products.get(id);
    }

    @Override
    public Product findProductByName(String name) {
        for(Product product : products.values()){
            if(product.getName().toLowerCase().contains(name.toLowerCase())){
                return product;
            }
        }
        return null;
    }
}
