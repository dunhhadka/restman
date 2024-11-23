<%@ page import="org.example.model.HoaDonBanHang266" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết thống kê khách hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
        }

        .container {
            margin-top: 50px;
        }

        .customer-info {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .customer-info h3 {
            margin-bottom: 20px;
            font-weight: bold;
            color: #343a40;
        }

        .customer-info p {
            font-size: 16px;
            margin: 5px 0;
        }

        .table th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        .card {
            border: none;
            border-radius: 10px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .card-body {
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
        }

        .card-title {
            font-size: 18px;
            font-weight: bold;
            color: #007bff;
        }

        .card-text {
            font-size: 14px;
            color: #6c757d;
        }

        .alert {
            text-align: center;
            font-size: 18px;
            background-color: #d1ecf1;
            color: #0c5460;
            border: none;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="customer-info">
        <h3>Thông tin khách hàng</h3>
        <p><strong>ID Khách Hàng:</strong> ${khachHang.id}</p>
        <p><strong>Tên Đăng Nhập:</strong> ${khachHang.tenDangNhap}</p>
        <p><strong>Email:</strong> ${khachHang.email}</p>
        <p><strong>Điện Thoại:</strong> ${khachHang.dienThoai}</p>
        <p><strong>Địa Chỉ:</strong> ${khachHang.diaChi}</p>
    </div>

    <h3 class="mb-4">Danh sách hóa đơn</h3>
    <div class="row">
        <%
            List<HoaDonBanHang266> dsHoaDon = (List<HoaDonBanHang266>) request.getAttribute("hoaDons");
            if (dsHoaDon != null && !dsHoaDon.isEmpty()) {
                for (HoaDonBanHang266 hoaDon : dsHoaDon) {
        %>
        <div class="col-md-4 mb-4">
            <div class="card shadow-sm" onclick="window.location.href='/hoa-don-detail/<%= hoaDon.getId() %>'"
                 style="cursor: pointer;">
                <div class="card-body">
                    <h5 class="card-title">Hóa Đơn: <%= hoaDon.getMaHoaDon() %></h5>
                    <p class="card-text">
                        <strong>Ngày Bán:</strong> <%= hoaDon.getNgayBan() %><br>
                        <strong>Tổng Tiền:</strong> <%= hoaDon.getTongTien() %> VND<br>
                        <strong>Trạng Thái:</strong> <%= hoaDon.getTrangThaiThanhToan() %>
                    </p>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="alert alert-info">
            Không có hóa đơn nào trong khoảng thời gian đã chọn.
        </div>
        <%
            }
        %>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
