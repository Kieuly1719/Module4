package com.example.qlsp_connectdb.repository;

import com.example.qlsp_connectdb.model.Category;

import java.util.List;

public interface ICategoryRepository {
    List<Category> findAll();
    Category findById(int id);
}
