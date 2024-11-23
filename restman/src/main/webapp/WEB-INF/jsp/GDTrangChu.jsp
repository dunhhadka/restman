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
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            color: #333;
            padding-top: 80px;
        }

        .top-menu {
            background-color: #1981ee;
            color: white;
            padding: 20px 20px;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
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
        }

        .top-menu a:hover {
            text-decoration: underline;
        }

        .welcome-text {
            font-size: 16px;
        }

        .search-bar {
            display: flex;
            align-items: center;
        }

        .search-bar input {
            width: 250px;
            padding: 8px 15px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .search-bar button {
            padding: 8px 15px;
            border: 1px solid #66b3ff;
            background-color: #66b3ff;
            color: white;
            font-size: 14px;
            border-radius: 5px;
        }

        .search-bar button:hover {
            background-color: #4d99e1;
            border-color: #4d99e1;
        }

        .container {
            margin-top: 30px;
        }

        h1 {
            color: #007bff;
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .mon-an-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            margin: 15px 0;
            padding: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            background-color: white;
            transition: transform 0.3s ease;
            position: relative;
        }

        .mon-an-card:hover {
            transform: translateY(-5px);
        }

        .mon-an-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-radius: 8px;
        }

        .mon-an-card .card-body {
            padding: 15px;
        }

        .mon-an-card .card-title {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        .mon-an-card .card-description {
            font-size: 14px;
            color: #666;
        }

        .mon-an-card .card-price {
            font-size: 16px;
            font-weight: bold;
            color: #007bff;
        }

        .mon-an-card .btn-detail {
            position: absolute;
            bottom: 10px;
            right: 10px;
            background-color: #007bff;
            color: white;
            font-size: 18px;
            border: none;
            border-radius: 50%;
        }

        .mon-an-card .btn-detail:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            .top-menu .menu-items {
                flex-direction: column;
                align-items: flex-start;
            }

            .top-menu a {
                margin-bottom: 10px;
            }

            .search-bar input {
                width: 200px;
            }

            .search-bar button {
                width: 100px;
            }

            .mon-an-card {
                margin-bottom: 15px;
            }
        }
    </style>
</head>
<body>

<!-- Top Menu -->
<div class="top-menu">
    <div class="menu-items">
        <div>
            <a href="/home">Trang chủ</a>
            <a href="/about">Giới thiệu</a>
            <a href="/contact">Liên hệ</a>
        </div>
        <div class="search-bar">
            <input type="text" id="searchInput" placeholder="Tìm kiếm món ăn..."/>
            <button onclick="search()">Tìm kiếm</button>
        </div>
        <div class="welcome-text">
            Xin chào, <strong>${khachHang.tenDangNhap}</strong>!
        </div>
    </div>
</div>

<!-- Nội dung chính -->
<div class="container">
    <div class="row justify-content-center">
        <h1>Danh sách Món Ăn</h1>
    </div>

    <div class="row" id="dishList">
        <%
            List<MonAn266> dsMonAn = (List<MonAn266>) request.getAttribute("dsMonAn");
            if (dsMonAn != null) {
                for (MonAn266 monAn : dsMonAn) {
        %>
        <div class="col-md-4">
            <div class="mon-an-card" onclick="window.location.href='/mon-an-detail/<%= monAn.getId() %>'">
                <img src="<%= monAn.getAnh() %>" alt="<%= monAn.getTen() %>">
                <div class="card-body">
                    <h5 class="card-title"><%= monAn.getTen() %>
                    </h5>
                    <p class="card-description"><%= monAn.getMoTa() %>
                    </p>
                    <p>Loại món: <%= monAn.getLoaiMon() %>
                    </p>
                    <p class="card-price">Giá: <%= monAn.getGia() %> VND</p>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function search() {
        let query = document.getElementById("searchInput").value.trim();
        if (!query) query = "";
        $.ajax({
            url: "/get-by-key",
            data: {key: query},
            method: "GET",
            success: function (responses) {
                var dishListContainer = document.getElementById("dishList");
                dishListContainer.innerHTML = "";

                if (Array.isArray(responses) && responses.length > 0) {
                    responses.forEach(function (monAn) {
                        var dishCard =
                            '<div class="col-md-4" onclick="window.location.href=\'/mon-an-detail/' + (monAn.id || '') + '\'">' +
                            '<div class="mon-an-card">' +
                            '<img src="' + (monAn.anh || '') + '" alt="' + (monAn.ten || 'Món ăn') + '">' +
                            '<div class="card-body">' +
                            '<h5 class="card-title">' + (monAn.ten || 'Tên món') + '</h5>' +
                            '<p class="card-description">' + (monAn.moTa || 'Mô tả món') + '</p>' +
                            '<p>Loại món: ' + (monAn.loaiMon || 'Chưa rõ') + '</p>' +
                            '<p class="card-price">Giá: ' + (monAn.gia || 'Chưa rõ') + ' VND</p>' +
                            '</div>' +
                            '</div>' +
                            '</div>';
                        dishListContainer.innerHTML += dishCard;
                    });
                } else {
                    dishListContainer.innerHTML = "<p>Không có kết quả tìm kiếm!</p>";
                }
            }
        });
    }
</script>

</body>
</html>
