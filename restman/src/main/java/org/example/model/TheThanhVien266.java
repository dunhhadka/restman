package org.example.model;

import java.sql.Timestamp;

public class TheThanhVien266 {
    private int id;
    private Timestamp ngayBatDau;
    private Timestamp ngayKetThuc;
    private String loaiThanhVien;
    private int khachHang266ID;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getNgayBatDau() {
        return ngayBatDau;
    }

    public void setNgayBatDau(Timestamp ngayBatDau) {
        this.ngayBatDau = ngayBatDau;
    }

    public Timestamp getNgayKetThuc() {
        return ngayKetThuc;
    }

    public void setNgayKetThuc(Timestamp ngayKetThuc) {
        this.ngayKetThuc = ngayKetThuc;
    }

    public String getLoaiThanhVien() {
        return loaiThanhVien;
    }

    public void setLoaiThanhVien(String loaiThanhVien) {
        this.loaiThanhVien = loaiThanhVien;
    }

    public int getKhachHang266ID() {
        return khachHang266ID;
    }

    public void setKhachHang266ID(int khachHang266ID) {
        this.khachHang266ID = khachHang266ID;
    }
}
