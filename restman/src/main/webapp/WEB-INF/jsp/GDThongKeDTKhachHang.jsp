<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="org.example.entities.MonAn266" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .top-menu {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .top-menu .menu-items {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .welcome-text {
            font-size: 16px;
        }

        .input-group {
            display: flex;
            align-items: center;
        }

        .input-group-text {
            background-color: #0056b3;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 5px 0 0 5px;
            font-size: 14px;
            padding: 5px 10px;
        }

        .form-control {
            border: 1px solid #ccc;
            border-radius: 0 5px 5px 0;
            font-size: 14px;
            padding: 5px 10px;
            width: 120px;
        }

        .btn {
            background-color: #0056b3;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            padding: 5px 15px;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #003d80;
        }

        h3 {
            text-align: center;
            margin-top: 100px;
            font-size: 24px;
            font-weight: bold;
        }

        .table {
            margin-top: 30px;
            border-collapse: collapse;
        }

        .table th, .table td {
            padding: 10px;
            text-align: center;
        }

        .table th {
            background-color: #007bff;
            color: white;
        }

        .alert-info {
            text-align: center;
            font-size: 18px;
            padding: 15px;
        }

        @media (max-width: 768px) {
            .top-menu .menu-items {
                flex-direction: column;
                align-items: flex-start;
            }

            .top-menu a {
                margin-bottom: 10px;
            }

            h3 {
                font-size: 20px;
            }

            .input-group, .btn {
                width: 100%;
                margin-bottom: 10px;
            }

            .btn {
                font-size: 16px;
                padding: 10px;
            }
        }
    </style>
</head>
<body>

<div class="top-menu">
    <div class="menu-items">
        <div class="d-flex align-items-center">
            <div class="input-group">
                <label for="startDate" class="input-group-text">Từ ngày:</label>
                <input type="date" id="startDate" class="form-control"/>
            </div>
            <div class="input-group ms-3">
                <label for="endDate" class="input-group-text">Đến ngày:</label>
                <input type="date" id="endDate" class="form-control"/>
            </div>
            <button id="viewStatsBtn" class="btn btn-primary ms-3" style="width: 300px">
                Xem thống kê
            </button>
        </div>
    </div>
</div>

<div class="container mt-5">
    <h3 class="mb-4">Thống kê doanh thu khách hàng</h3>
    <div id="noDataMessage" class="alert alert-info" style="display: none;">
        Không có khách hàng đặt món trong thời gian này.
    </div>
    <table class="table table-striped" id="statsTable" style="display: none;">
        <thead>
        <tr>
            <th>ID Khách Hàng</th>
            <th>Tên Đăng Nhập</th>
            <th>Email</th>
            <th>Điện Thoại</th>
            <th>Địa Chỉ</th>
            <th>Tổng Chi Tiêu</th>
            <th>Số lần đặt món</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    document.getElementById("viewStatsBtn").addEventListener("click", function () {
        const startDate = document.getElementById("startDate").value;
        const endDate = document.getElementById("endDate").value;

        $.ajax({
            url: "/doanh-thu-khach-hang/thoi-gian",
            type: "GET",
            data: {
                startDate,
                endDate
            },
            success: function (response) {
                console.log(response);

                const tableBody = document.getElementById("statsTable").getElementsByTagName("tbody")[0];
                tableBody.innerHTML = "";

                const noDataMessage = document.getElementById("noDataMessage");
                const statsTable = document.getElementById("statsTable");

                if (response.length === 0) {
                    noDataMessage.style.display = "block";
                    statsTable.style.display = "none";
                } else {
                    noDataMessage.style.display = "none";
                    statsTable.style.display = "table";
                    response.forEach(function (customer) {
                        var row =
                            '<tr onclick="window.location.href=\'/doanh-thu-chi-tiet/customer-details?id=' + customer.khachHangId +
                            '&startDate=' + startDate + '&endDate=' + endDate + '\'">' +
                            '<td>' + (customer.khachHangId || 'N/A') + '</td>' +
                            '<td>' + (customer.kHTenDangNhap || 'N/A') + '</td>' +
                            '<td>' + (customer.khEmail || 'N/A') + '</td>' +
                            '<td>' + (customer.khPhone || 'N/A') + '</td>' +
                            '<td>' + (customer.khDiaChi || 'N/A') + '</td>' +
                            '<td>' + (customer.tongChiTieu !== null ? customer.tongChiTieu.toFixed(2) + ' VND' : '0 VND') + '</td>' +
                            '<td>' + (customer.soLanDatMon) + '</td>' +
                            '</tr>';

                        tableBody.innerHTML += row;
                    });
                }
            },
            error: function (xhr, status, error) {
                console.error("Đã xảy ra lỗi, vui lòng thử lại.");
            }
        })
    });
</script>
</body>
</html>
