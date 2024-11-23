<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            position: relative;
        }

        .login-container {
            margin-top: 100px;
        }

        .login-box {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 500px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translateX(-50%);
        }

        .login-box h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-control {
            height: 45px;
            font-size: 16px;
        }

        .btn-primary {
            width: 100%;
            height: 50px;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 20px;
            font-size: 16px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center login-container">
        <div class="col-md-4">
            <div class="login-box">
                <div id="error-message" class="error-message"></div>
                <h2>Đăng nhập</h2>
                <form id="loginForm">
                    <div class="mb-3">
                        <label for="email" class="form-label">Địa chỉ email</label>
                        <input type="email" class="form-control" id="email" name="email" required
                               placeholder="Nhập email của bạn">
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Mật khẩu</label>
                        <input type="password" class="form-control" id="password" name="password" required
                               placeholder="Nhập mật khẩu của bạn">
                    </div>
                    <button type="submit" class="btn btn-primary">Đăng nhập</button>
                    <div class="text-center mt-3">
                        <a href="#">Quên mật khẩu?</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="toast" id="successToast" style="position: fixed; top: 20px; right: 20px; min-width: 200px;">
    <div class="toast-header">
        <strong class="mr-auto">Thông báo</strong>
        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">
        Đăng nhập thành công!
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    $(document).ready(function () {
        $("#loginForm").on("submit", function (event) {
            event.preventDefault();
            var email = $("#email").val();
            var password = $("#password").val();

            $.ajax({
                url: "/nhan-vien/login",
                type: "POST",
                data: {
                    email: email,
                    password: password
                },
                success: function (response) {
                    console.log(response);
                    if (response === "LoginError") {
                        $("#error-message").text("Email hoặc mật khẩu không hợp lệ.");
                    } else {
                        var toast = new bootstrap.Toast($('#successToast'));
                        toast.show();
                        setTimeout(function () {
                            window.location.href = "/nhan-vien/trang-chu/" + response;
                        }, 2000);
                    }
                },
                error: function (xhr, status, error) {
                    $("#error-message").text("Đã xảy ra lỗi, vui lòng thử lại.");
                }
            });
        });
    });
</script>

</body>
</html>
