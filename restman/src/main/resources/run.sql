create table tblKhachHang266
(
    id          int primary key auto_increment,
    tenDangNhap varchar(100) not null,
    matKhau     varchar(20)  not null,
    email       varchar(20)  not null,
    dienThoai   varchar(20),
    diaChi      varchar(255)
);

create table tblNhanVien266
(
    id          int primary key auto_increment,
    tenDangNhap varchar(255) not null,
    matKhau     varchar(20)  not null,
    email       varchar(100) not null,
    dienThoai   varchar(20)  not null,
    viTri       varchar(20)  not null,
    trangThai   varchar(20)  not null,
    diaChi      varchar(100) not null
);

create table tblNhaCungCap266
(
    id        int primary key auto_increment,
    ten       varchar(100) not null,
    dienThoai varchar(155) not null,
    email     varchar(255)
);

create table tblTheThanhVien266
(
    id             int primary key auto_increment,
    ngayBatDau     timestamp,
    ngayKetThuc    timestamp,
    loaiThanhVien  varchar(20),
    khachHang266ID int not null,
    constraint `fk_khach_hang_the_thanh_vien`
        foreign key (`khachHang266ID`)
            references `tblKhachHang266` (`id`)
);

CREATE TABLE tblHoaDonBanHang266
(
    id                 INT PRIMARY KEY AUTO_INCREMENT,
    maHoaDon           VARCHAR(100),
    ngayBan            TIMESTAMP,
    tongTien           FLOAT(7, 2),
    trangThaiThanhToan VARCHAR(20),
    nhanVien266ID      INT NOT NULL,
    khachHang266ID     INT NOT NULL,
    CONSTRAINT fk_khach_hang_hoa_don
        FOREIGN KEY (khachHang266ID)
            REFERENCES tblkhachhang266(id),
    CONSTRAINT fk_nhan_vien_hoa_don
        FOREIGN KEY (nhanVien266ID)
            REFERENCES tblnhanvien266(id)
);


create table tblMonAn266
(
    id      int primary key auto_increment,
    ten     varchar(266),
    moTa    varchar(266),
    loaiMon varchar(100),
    gia     float(7, 2),
    anh     varchar(200)
);

create table tblChiTietHoaDonBanHang266
(
    id              int primary key auto_increment,
    soLuong         int not null,
    giaMonAn        float(7, 2),
    hoaDonBanHangID int,
    monAnID         int,
    constraint fk_hoa_don_chi_tiet
        foreign key (hoaDonBanHangID)
            references tblHoaDonBanHang266 (id),
    constraint fk_hoa_don_mon_an
        foreign key (monAnID)
            references tblMonAn266 (id)
);

create table tblNguyenLieu266
(
    id            int primary key auto_increment,
    ten           varchar(255),
    donVi         varchar(50),
    soLuongTonKho int,
    gia           float(7, 2)
    );