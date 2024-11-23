<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="org.example.model.MonAn266" %>
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

        .top-menu a {
            color: white;
            text-decoration: none;
            margin-right: 20px;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .top-menu a:hover {
            color: #ffdd57;
        }

        .welcome-text {
            font-size: 16px;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-btn {
            cursor: pointer;
            padding: 5px 10px;
            font-weight: bold;
            color: white;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 100;
            min-width: 180px;
            border-radius: 8px;
            overflow: hidden;
        }

        .dropdown-content a {
            color: #333;
            padding: 10px 15px;
            text-decoration: none;
            display: block;
            font-size: 14px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .dropdown-content a:hover {
            background-color: #007bff;
            color: white;
        }

        .dropdown:hover .dropdown-content {
            display: block;
            animation: fadeIn 0.3s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 768px) {
            .top-menu .menu-items {
                flex-direction: column;
                align-items: flex-start;
            }

            .top-menu a {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>

<div class="top-menu">
    <div class="menu-items">
        <div>
            <div class="dropdown">
                <a class="dropdown-btn">Xem báo cáo <i class="bi bi-chevron-down"></i></a>
                <div class="dropdown-content">
                    <a href="/doanh-thu-khach-hang">Theo khách hàng</a>
                    <a href="#">Theo món ăn</a>
                    <a href="#">Theo nhà cung cấp</a>
                </div>
            </div>
        </div>
        <div class="welcome-text">
            Xin chào, <strong>${nhanVien.tenDangNhap}</strong>!
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script>

</script>

</body>
</html>
