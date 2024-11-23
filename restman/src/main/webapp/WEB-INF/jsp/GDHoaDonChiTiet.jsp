<%@ page import="org.example.entities.ChiTietHoaDonBanHang266" %>
<%@ page import="org.example.entities.HoaDonBanHang266" %>
<%@ page import="org.example.entities.KhachHang266" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết hóa đơn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Verdana', sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
            font-size: 14px;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 30px;
            background: #ffffff;
            border: 1px solid #ddd;
            border-radius: 12px;
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
        }

        .header, .footer {
            text-align: center;
            margin-bottom: 25px;
        }

        .header h1, .footer p {
            margin: 0;
            font-size: 20px;
            color: #333;
        }

        .header p {
            font-size: 14px;
            color: #555;
        }

        .info-card {
            margin-bottom: 30px;
            padding: 20px;
            border: 1px solid #f1f1f1;
            border-radius: 8px;
            background: #f9f9f9;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        .info-card h4 {
            margin-bottom: 15px;
            font-size: 16px;
            font-weight: bold;
            color: #333;
        }

        .info-card p {
            font-size: 14px;
            color: #555;
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle;
            padding: 12px;
            font-size: 14px;
        }

        .table th {
            background-color: #007bff;
            color: white;
            font-size: 15px;
        }

        .total p {
            font-size: 16px;
            font-weight: bold;
            margin: 5px 0;
            color: #333;
        }

        .footer p {
            font-size: 12px;
            color: #777;
        }

        .table-striped tbody tr:nth-child(odd) {
            background-color: #f9f9f9;
        }

        .table-striped tbody tr:nth-child(even) {
            background-color: #f1f1f1;
        }

        .btn-print {
            display: block;
            margin: 30px auto 0;
            padding: 10px 20px;
            font-size: 14px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-print:hover {
            background-color: #218838;
        }

        .info-card .row {
            margin-bottom: 10px;
        }

        .info-card .col-md-4 {
            font-weight: bold;
            font-size: 14px;
            padding-right: 10px;
        }

        .info-card .col-md-8 {
            font-size: 14px;
        }

        .row {
            display: flex;
            justify-content: space-between;
        }

        .row .col-md-4,
        .row .col-md-8 {
            flex: 1;
        }
    </style>

</head>
<body>
<div class="container">
    <div class="header">
        <h1>RestMan</h1>
        <p>Địa chỉ: test111, Website: RestMan.net, SĐT: +84389952471</p>
    </div>

    <div class="info-card">
        <h4>Thông tin khách hàng</h4>
        <div class="row">
            <div class="col-md-4">
                <strong>Khách hàng:</strong>
            </div>
            <div class="col-md-8">
                ${khachHang.tenDangNhap}
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <strong>Số điện thoại:</strong>
            </div>
            <div class="col-md-8">
                ${khachHang.dienThoai}
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <strong>Địa chỉ nhận hàng:</strong>
            </div>
            <div class="col-md-8">
                ${khachHang.diaChi}
            </div>
        </div>
    </div>

    <div class="info-card">
        <h4>Thông tin hóa đơn</h4>
        <div class="row">
            <div class="col-md-4">
                <strong>Mã Hóa Đơn:</strong>
            </div>
            <div class="col-md-8">
                ${hoaDon.maHoaDon}
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <strong>Ngày Bán:</strong>
            </div>
            <div class="col-md-8">
                ${hoaDon.ngayBan}
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <strong>Tổng Tiền:</strong>
            </div>
            <div class="col-md-8">
                ${hoaDon.tongTien} VND
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <strong>Trạng Thái Thanh Toán:</strong>
            </div>
            <div class="col-md-8">
                ${hoaDon.trangThaiThanhToan}
            </div>
        </div>
    </div>

    <div class="info-card">
        <h4>Chi tiết hóa đơn</h4>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>Tên Món Ăn</th>
                <th>Giá Món Ăn</th>
                <th>Số Lượng</th>
                <th>Thành Tiền</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<ChiTietHoaDonBanHang266> hoaDonChiTiets =
                        (List<ChiTietHoaDonBanHang266>) request.getAttribute("hoaDonChiTiets");
                if (hoaDonChiTiets != null && !hoaDonChiTiets.isEmpty()) {
                    for (ChiTietHoaDonBanHang266 chiTiet : hoaDonChiTiets) {
            %>
            <tr>
                <td><%= chiTiet.getId() %>
                </td>
                <td><%= chiTiet.getMonAn() %>
                </td>
                <td><%= chiTiet.getGiaMonAn() %> VND</td>
                <td><%= chiTiet.getSoLuong() %>
                </td>
                <td><%= chiTiet.getGiaMonAn() * chiTiet.getSoLuong() %> VND</td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="5" class="text-center text-muted">Không có chi tiết hóa đơn nào.</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="total">
        <p><strong>Tổng Tiền Hàng:</strong> ${hoaDon.tongTien} VND</p>
        <p><strong>Trạng thái Thanh Toán:</strong> ${hoaDon.trangThaiThanhToan}</p>
    </div>

    <button class="btn-print" onclick="window.print()">In hóa đơn</button>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
