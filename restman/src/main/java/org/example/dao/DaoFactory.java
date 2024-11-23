package org.example.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class DaoFactory {

    private static final String URL = "jdbc:mysql://localhost:3306/rest_man";
    private static final String USER_NAME = "root";
    private static final String PASSWORD = "1234567";

    protected static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER_NAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
