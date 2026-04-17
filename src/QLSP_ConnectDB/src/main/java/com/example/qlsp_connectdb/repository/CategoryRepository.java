package com.example.qlsp_connectdb.repository;

import com.example.qlsp_connectdb.model.Category;
import com.example.qlsp_connectdb.model.Product;
import com.example.qlsp_connectdb.utils.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepository implements ICategoryRepository{
    private final String SELECT_ALL = "select id, name from category ORDER BY id DESC";
    private final String SELECT_BY_ID = "select id, name from category where id = ?";
    public CategoryRepository(){}
    @Override
    public List<Category> findAll() {
        List<Category> categoryList = new ArrayList<>();
        try(Connection connection = ConnectDB.getConnectionDB()){
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                categoryList.add(new Category(id, name));
            }
        }catch (SQLException e){
            System.out.println("Lỗi lấy dữ liệu");
        }
        return categoryList;
    }

    @Override
    public Category findById(int id) {
        Category categorys = new Category();
        try(Connection connection = ConnectDB.getConnectionDB()){
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            int category_id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            categorys.setId(category_id);
            categorys.setName(name);
        } catch (SQLException e){
            System.out.println("Lỗi lấy dữ liệu");
        }
        return categorys;
    }
}
