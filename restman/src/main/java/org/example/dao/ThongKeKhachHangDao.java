package org.example.dao;

import org.example.model.ThongKeKhachHang266;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ThongKeKhachHangDao extends DaoFactory {

    public static List<ThongKeKhachHang266> thongKe(LocalDate startDate, LocalDate endDate) {
        String sql = "SELECT kh.id, kh.tenDangNhap, kh.email, kh.dienThoai, kh.diaChi, SUM(h.tongTien) as tongChiTieu, COUNT(h.id) as soLanDatMon " +
                "FROM tblkhachhang266 as kh " +
                "LEFT JOIN tblhoadonbanhang266 as h ON h.khachHang266ID = kh.id " +
                "LEFT JOIN tblnhanvien266 as nv ON h.nhanVien266ID = nv.id " +
                "WHERE 1 = 1 ";
        StringBuilder builder = new StringBuilder(sql);
        var sqlBuilder = generateSql(builder, startDate, endDate);
        var mapValue = sqlBuilder.mapValue;
        var sqlFinal = sqlBuilder.builder.toString();

        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(sqlFinal);
            for (int i = 0; i < mapValue.size(); i++) {
                statement.setTimestamp(i + 1, mapValue.get(i + 1));
            }
            var result = statement.executeQuery();
            List<ThongKeKhachHang266> thongKeKhachHang266s = new ArrayList<>();
            while (result.next()) {
                var thongKe = getThongKeFromResult(result);
                thongKeKhachHang266s.add(thongKe);
            }
            return thongKeKhachHang266s;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private static ThongKeKhachHang266 getThongKeFromResult(ResultSet result) throws SQLException {
        ThongKeKhachHang266 thongKeKhachHang = new ThongKeKhachHang266();
        thongKeKhachHang.setKhachHangId(result.getInt("id"));
        thongKeKhachHang.setkHTenDangNhap(result.getString("tenDangNhap"));
        thongKeKhachHang.setKhEmail(result.getString("email"));
        thongKeKhachHang.setKhDiaChi(result.getString("diaChi"));
        thongKeKhachHang.setKhPhone(result.getString("dienThoai"));
        thongKeKhachHang.setTongChiTieu(result.getFloat("tongChiTieu"));
        thongKeKhachHang.setSoLanDatMon(result.getInt("soLanDatMon"));
        return thongKeKhachHang;
    }

    private static SqlInfo generateSql(StringBuilder builder, LocalDate startDate, LocalDate endDate) {
        var mapValue = new HashMap<Integer, Timestamp>();
        if (startDate != null) {
            Timestamp startTimestamp = Timestamp.valueOf(startDate.atStartOfDay());
            builder
                    .append("AND h.ngayBan >= ? ");
            mapValue.put(1, startTimestamp);
        }
        if (endDate != null) {
            Timestamp endTimestamp = Timestamp.valueOf(endDate.atTime(23, 59, 59));
            builder
                    .append("AND h.ngayBan <= ? ");
            mapValue.put(mapValue.size() + 1, endTimestamp);
        }

        builder
                .append("GROUP BY kh.id ")
                .append("ORDER BY tongChiTieu DESC");

        return new SqlInfo(builder, mapValue);
    }

    record SqlInfo(StringBuilder builder, Map<Integer, Timestamp> mapValue) {
    }
}
