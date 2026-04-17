package com.example.qlsp_connectdb.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
    private static final String URL = "jdbc:mysql://localhost:3306/product_management";
    private static final String USER = "root";
    private static final String PASS = "123456";

    public ConnectDB() {
    }

    public static Connection getConnectionDB(){
        Connection connection = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USER, PASS);
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }catch (SQLException throwables){
            throwables.printStackTrace();
        }
        return connection;
    }
}

