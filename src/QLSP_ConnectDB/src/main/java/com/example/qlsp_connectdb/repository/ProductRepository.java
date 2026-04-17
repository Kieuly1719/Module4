package com.example.qlsp_connectdb.repository;

import com.example.qlsp_connectdb.model.Product;
import com.example.qlsp_connectdb.utils.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository{
    private final String SELECT_ALL = "select id, name, price, quantity, category_id from products";
    private final String SELECT_PRODUCT_BY_CATEGORYID = "select * from products where category_id = ?";
    private final String SELECT_PRODUCT_BY_NAME = "select * from product LIKE ?";
    private final String DELETE_PRODUCT = "delete from products where id = ?";
    private final String UPDATE_PRODUCT = "update products SET name = ?, price = ?. quantity = ?, category_id = ? where id = ?";

    @Override
    public List<Product> findAll() {
        List<Product> productList = new ArrayList<>();
        try(Connection connection = ConnectDB.getConnectionDB()){
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                int category_id = resultSet.getInt("category_id");

                productList.add(new Product(id, name, price, quantity, category_id));
            }
        }catch (SQLException e){
            System.out.println("Lỗi lấy dữ liệu");
        }
        return productList;
    }

    @Override
    public List<Product> findProductByCategoryID(int category_id) {
        List<Product> productList = new ArrayList<>();
        try(Connection connection = ConnectDB.getConnectionDB()){
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_CATEGORYID);
            preparedStatement.setInt(1, category_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");

                productList.add(new Product(id, name, price, quantity, category_id));
            }
        }catch (SQLException e){
            System.out.println("Lỗi lấy dữ liệu");
        }
        return productList;
    }

    @Override
    public List<Product> searchByProductName(String productName) {
        List<Product> productList = new ArrayList<>();
        try(Connection connection = ConnectDB.getConnectionDB()){
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_NAME);
            preparedStatement.setString(1, "%" + productName + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                int category_id = resultSet.getInt("category_id");

                productList.add(new Product(id, name, price, quantity, category_id));
            }
        }catch (SQLException e){
            System.out.println("Lỗi lấy dữ liệu");
        }
        return productList;
    }

    @Override
    public Product findById(int id) {
        Product product = new Product();
        try(Connection connection = ConnectDB.getConnectionDB()){
            PreparedStatement preparedStatement = connection.prepareStatement("select * from products where id ?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            product.setId(resultSet.getInt("id"));
            product.setName(resultSet.getString("name"));
            product.setPrice(resultSet.getDouble("price"));
            product.setQuantity(resultSet.getInt("quantity"));
            product.setCategory_id(resultSet.getInt("category_id"));
        } catch (SQLException e){
            System.out.println("Lỗi lấy dữ liệu");
        }
        return product;
    }

    @Override
    public boolean deleteProduct(int id) {
        boolean flag = false;
        try(Connection connection = ConnectDB.getConnectionDB()){
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT);
            preparedStatement.setInt(1, id);
            if (preparedStatement.executeUpdate() > 0) {
                flag = true;
            }
        }catch (SQLException e){
            System.out.println("Lỗi lấy dữ liệu");
        }
        return flag;
    }

    @Override
    public boolean updateProduct(Product product) {
        boolean flag = false;
        try(Connection connection = ConnectDB.getConnectionDB()){
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setInt(3, product.getQuantity());
            preparedStatement.setInt(4, product.getCategory_id());
            preparedStatement.setInt(5, product.getId());

            if(preparedStatement.executeUpdate() > 0){
                flag = true;
            }
        }catch (SQLException e){
            System.out.println("Lỗi lấy dữ liệu");
        }
        return flag;
    }

    @Override
    public boolean addProduct(Product product) {
        boolean flag = false;
        try(Connection connection = ConnectDB.getConnectionDB()){
            PreparedStatement preparedStatement = connection.prepareStatement("insert into products(name, price, quantity, category_id) values (?,?,?,?)");
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setInt(3, product.getQuantity());
            preparedStatement.setInt(4, product.getCategory_id());

            if(preparedStatement.executeUpdate() > 0){
                flag = true;
            }
        }catch (SQLException e){
            System.out.println("Lỗi lấy dữ liệu");
        }
        return flag;
    }
}
