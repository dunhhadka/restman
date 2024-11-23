<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="org.example.entities.MonAn266" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Món Ăn</title>
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

        .container {
            margin-top: 120px;
        }

        h1 {
            color: #007bff;
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .mon-an-detail-card {
            display: flex;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 20px 0;
        }

        .mon-an-detail-card img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 8px;
            margin-right: 20px;
        }

        .mon-an-detail-card .card-body {
            flex: 1;
        }

        .mon-an-detail-card .card-title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .mon-an-detail-card .card-description {
            font-size: 16px;
            color: #666;
            margin-top: 10px;
        }

        .mon-an-detail-card .card-price {
            font-size: 20px;
            font-weight: bold;
            color: #007bff;
            margin-top: 10px;
        }

        .btn-back {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn-back:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>

<div class="top-menu">
    <div class="menu-items">
        <div>
            <a href="/home">Trang chủ</a>
            <a href="/about">Giới thiệu</a>
            <a href="/contact">Liên hệ</a>
        </div>
    </div>
</div>

<div class="container">
    <h1>Chi Tiết Món Ăn</h1>
    <div class="mon-an-detail-card">
        <img src="${monAn.anh}" alt="${monAn.ten}">
        <div class="card-body">
            <h2 class="card-title">${monAn.ten}</h2>
            <p class="card-description">${monAn.moTa}</p>
            <p>Loại món: ${monAn.loaiMon}</p>
            <p class="card-price">Giá: ${monAn.gia} VND</p>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
