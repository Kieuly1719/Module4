package com.example.qlsp_connectdb.service;

import com.example.qlsp_connectdb.model.Category;
import com.example.qlsp_connectdb.model.Product;
import com.example.qlsp_connectdb.repository.CategoryRepository;

import java.util.List;

public interface ICategoryService {
    List<Category> findAll();
    Category findById(int id);
}
