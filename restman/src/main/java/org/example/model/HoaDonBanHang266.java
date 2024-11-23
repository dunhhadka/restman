package org.example.model;

import java.sql.Timestamp;

public class HoaDonBanHang266 {
    private int id;
    private String maHoaDon;
    private Timestamp ngayBan;
    private float tongTien;
    private String trangThaiThanhToan;
    private int nhanVien266ID;  // Foreign key to NhanVien266
    private int khachHang266ID;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMaHoaDon() {
        return maHoaDon;
    }

    public void setMaHoaDon(String maHoaDon) {
        this.maHoaDon = maHoaDon;
    }

    public Timestamp getNgayBan() {
        return ngayBan;
    }

    public void setNgayBan(Timestamp ngayBan) {
        this.ngayBan = ngayBan;
    }

    public float getTongTien() {
        return tongTien;
    }

    public void setTongTien(float tongTien) {
        this.tongTien = tongTien;
    }

    public String getTrangThaiThanhToan() {
        return trangThaiThanhToan;
    }

    public void setTrangThaiThanhToan(String trangThaiThanhToan) {
        this.trangThaiThanhToan = trangThaiThanhToan;
    }

    public int getNhanVien266ID() {
        return nhanVien266ID;
    }

    public void setNhanVien266ID(int nhanVien266ID) {
        this.nhanVien266ID = nhanVien266ID;
    }

    public int getKhachHang266ID() {
        return khachHang266ID;
    }

    public void setKhachHang266ID(int khachHang266ID) {
        this.khachHang266ID = khachHang266ID;
    }
}
