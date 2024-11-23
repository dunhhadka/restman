package org.example.dao;

import org.example.entities.MonAn266;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class MonAnDao extends DaoFactory {


    public static List<MonAn266> getList() {
        List<MonAn266> danhSachMonAn = new ArrayList<>();
        String sql = "SELECT * FROM tblmonan266 order by id desc";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {

            while (rs.next()) {
                var monAn = getFromResult(rs);
                danhSachMonAn.add(monAn);
            }

        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi truy vấn dữ liệu món ăn: " + e.getMessage(), e);
        }
        return danhSachMonAn;
    }

    private static MonAn266 getFromResult(ResultSet rs) throws SQLException {
        MonAn266 monAn = new MonAn266();
        monAn.setId(rs.getInt("id"));
        monAn.setTen(rs.getString("ten"));
        monAn.setMoTa(rs.getString("moTa"));
        monAn.setLoaiMon(rs.getString("loaiMon"));
        monAn.setGia(rs.getFloat("gia"));
        monAn.setAnh(rs.getString("anh"));
        return monAn;
    }

    public static List<MonAn266> getByKey(String key) {
        List<MonAn266> danhSachMonAn = new ArrayList<>();
        String sql = "SELECT * FROM tblmonan266 WHERE upper(ten) like upper(?) order by id desc";
        try (Connection connection = getConnection()) {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, Optional.ofNullable(key).map(k -> "%" + k + "%").orElse("%%"));
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                var monAn = getFromResult(rs);
                danhSachMonAn.add(monAn);
            }

        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi truy vấn dữ liệu món ăn: " + e.getMessage(), e);
        }
        return danhSachMonAn;
    }

    public static MonAn266 getDetailById(int id) {
        String sql = "SELECT * FROM tblmonan266 WHERE id = ?";
        try (Connection connection = getConnection()) {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                MonAn266 monAn = new MonAn266();
                monAn.setId(rs.getInt("id"));
                monAn.setTen(rs.getString("ten"));
                monAn.setMoTa(rs.getString("moTa"));
                monAn.setLoaiMon(rs.getString("loaiMon"));
                monAn.setGia(rs.getFloat("gia"));
                monAn.setAnh(rs.getString("anh"));

                return monAn;
            } else {
                return null;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi truy vấn dữ liệu món ăn: " + e.getMessage(), e);
        }
    }

}
