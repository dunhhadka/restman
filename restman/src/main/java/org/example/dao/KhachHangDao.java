package org.example.dao;

import org.example.model.KhachHang266;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class KhachHangDao extends DaoFactory {

    private static class messages {
        public static String LOGIN_ERROR = "";
    }

    private static class SQL_QUERIES {
        public static String LOGIN_QUERY = "SELECT * FROM tblkhachhang266 WHERE email = ? AND matKhau = ?";
        public static String FIND_BY_ID_QUERY = "SELECT * FROM tblkhachhang266 WHERE id = ?";

    }

    public static String login(KhachHang266 khachHang) {
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(SQL_QUERIES.LOGIN_QUERY);

            statement.setString(1, khachHang.getEmail());
            statement.setString(2, khachHang.getMatKhau());

            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    int id = rs.getInt("id");
                    return String.valueOf(id);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return "LoginError";
    }

    public static KhachHang266 findById(int id) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(SQL_QUERIES.FIND_BY_ID_QUERY)) {
            statement.setInt(1, id);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    KhachHang266 khachHang = new KhachHang266();
                    khachHang.setId(rs.getInt("id"));
                    khachHang.setTenDangNhap(rs.getString("tenDangNhap"));
                    khachHang.setMatKhau(rs.getString("matKhau"));
                    khachHang.setEmail(rs.getString("email"));
                    khachHang.setDienThoai(rs.getString("dienThoai"));
                    khachHang.setDiaChi(rs.getString("diaChi"));
                    return khachHang;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error finding customer by ID", e);
        }
        return null;
    }
}
