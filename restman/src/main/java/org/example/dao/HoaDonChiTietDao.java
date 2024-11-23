package org.example.dao;

import org.example.entities.ChiTietHoaDonBanHang266;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HoaDonChiTietDao extends DaoFactory {

    public static List<ChiTietHoaDonBanHang266> findByHoaDonId(int id) {
        var sql = "SELECT c.*, m.ten " +
                "FROM tblchitiethoadonBanhang266 c " +
                "JOIN tblmonan266 as m ON m.id = c.monAnID " +
                "WHERE hoaDonBanHangID = ? ";
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            var result = statement.executeQuery();
            List<ChiTietHoaDonBanHang266> chiTietHoaDonBanHang266s = new ArrayList<>();
            while (result.next()) {
                var hoaDon = getHoaDonChiTiet(result);
                chiTietHoaDonBanHang266s.add(hoaDon);
            }
            return chiTietHoaDonBanHang266s;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private static ChiTietHoaDonBanHang266 getHoaDonChiTiet(ResultSet result) throws SQLException {
        var hoaDonChiTiet = new ChiTietHoaDonBanHang266();
        hoaDonChiTiet.setId(result.getInt("id"));
        hoaDonChiTiet.setSoLuong(result.getInt("soLuong"));
        hoaDonChiTiet.setGiaMonAn(result.getFloat("giaMonAn"));
        hoaDonChiTiet.setHoaDonBanHangID(result.getInt("hoaDonBanHangID"));
        hoaDonChiTiet.setMonAnID(result.getInt("monAnID"));
        hoaDonChiTiet.setMonAn(result.getString("ten"));
        return hoaDonChiTiet;
    }
}
