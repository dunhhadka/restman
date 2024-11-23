package org.example.dao;

import org.example.model.NhanVien266;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class NhanVienDao extends DaoFactory {

    public static String login(NhanVien266 nhanVien) {
        try {
            String sql = "SELECT * FROM tblnhanvien266 WHERE email = ? AND matKhau = ?";
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nhanVien.getEmail());
            statement.setString(2, nhanVien.getMatKhau());

            var result = statement.executeQuery();
            if (result.next()) {
                var id = result.getInt("id");
                return String.valueOf(id);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return "LoginError";
    }

    public static NhanVien266 findById(int id) {
        try {
            String sql = "SELECT * FROM tblnhanvien266 WHERE id = ?";
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);

            var result = statement.executeQuery();
            if (result.next()) {
                var nhanVien = new NhanVien266();
                nhanVien.setId(result.getInt("id"));
                nhanVien.setTenDangNhap(result.getString("tenDangNhap"));
                nhanVien.setMatKhau(result.getString("matKhau"));
                nhanVien.setEmail(result.getString("email"));
                nhanVien.setDienThoai(result.getString("dienThoai"));
                nhanVien.setViTri(result.getString("viTri"));
                nhanVien.setTrangThai(result.getString("trangThai"));
                nhanVien.setDiaChi("diaChi");
                return nhanVien;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
