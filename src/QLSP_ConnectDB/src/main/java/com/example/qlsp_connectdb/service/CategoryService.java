package com.example.qlsp_connectdb.service;

import com.example.qlsp_connectdb.model.Category;
import com.example.qlsp_connectdb.repository.CategoryRepository;
import com.example.qlsp_connectdb.repository.ICategoryRepository;

import java.util.List;

public class CategoryService implements ICategoryService{
    private ICategoryRepository categoryRepository = new CategoryRepository();
    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    @Override
    public Category findById(int id) {
        return categoryRepository.findById(id);
    }
}
