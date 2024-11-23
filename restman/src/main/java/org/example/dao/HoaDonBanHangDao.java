package org.example.dao;

import org.example.model.HoaDonBanHang266;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class HoaDonBanHangDao extends DaoFactory {

    public static List<HoaDonBanHang266> findByKhachHangIdAndCondition(int id, LocalDate startDate, LocalDate endDate) {
        String sql = "SELECT * FROM tblhoadonbanhang266 WHERE khachHang266ID = ? ";
        Map<Integer, Timestamp> mapValue = new HashMap<>();
        if (startDate != null) {
            Timestamp startTime = Timestamp.valueOf(startDate.atStartOfDay());
            sql += "AND ngayBan >= ?";
            mapValue.put(1, startTime);
        }
        if (endDate != null) {
            Timestamp endTimestamp = Timestamp.valueOf(endDate.atTime(23, 59, 59));
            sql += "AND ngayBan <= ?";
            mapValue.put(mapValue.size() + 1, endTimestamp);
        }
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            for (int i = 0; i < mapValue.size(); i++) {
                statement.setTimestamp(i + 2, mapValue.get(i + 1));
            }
            var result = statement.executeQuery();
            List<HoaDonBanHang266> hoaDonBanHang266s = new ArrayList<>();
            while (result.next()) {
                var hoaDong = getHoaDonFrom(result);
                hoaDonBanHang266s.add(hoaDong);
            }
            return hoaDonBanHang266s;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private static HoaDonBanHang266 getHoaDonFrom(ResultSet result) throws SQLException {
        var hoaDon = new HoaDonBanHang266();
        hoaDon.setId(result.getInt("id"));
        hoaDon.setMaHoaDon(result.getString("maHoaDon"));
        hoaDon.setNgayBan(result.getTimestamp("ngayBan"));
        hoaDon.setTongTien(result.getFloat("tongTien"));
        hoaDon.setTrangThaiThanhToan(result.getString("trangThaiThanhToan"));
        hoaDon.setNhanVien266ID(result.getInt("nhanVien266ID"));
        hoaDon.setKhachHang266ID(result.getInt("khachHang266ID"));
        return hoaDon;
    }

    public static HoaDonBanHang266 findById(int id) {
        String sql = "SELECT * FROM tblhoadonbanhang266 WHERE id = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            var result = statement.executeQuery();
            if (result.next()) {
                return getHoaDonFrom(result);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
