<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <!-- 引入 Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #ffcccb 0%, #ffe6e6 100%);
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-size: 16px;
            line-height: 1.6;
        }
        .register-container {
            width: 100%;
            max-width: 500px;
            padding: 50px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease-in-out;
        }
        .register-container:hover {
            transform: scale(1.02);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
        }
        .register-container h2 {
            color: #d63031;
            font-size: 24px;
            margin-bottom: 30px;
        }
        .form-group label {
            color: #880e4f;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-control {
            border-radius: 25px;
            background-color: #fff;
            border: 1px solid #e0e0e0;
            font-size: 16px;
            padding: 10px 20px;
        }
        .form-control:focus {
            border-color: #d63031;
            box-shadow: 0 0 0 0.2rem rgba(214, 48, 49, 0.25);
        }
        .btn-primary {
            border-radius: 25px;
            background-color: #d63031;
            border: none;
            color: white;
            font-size: 18px;
            padding: 10px 20px;
        }
        .btn-primary:hover {
            background-color: #b71c1c;
        }
        .text-danger {
            color: #d63031;
        }
        a {
            color: #d63031;
            text-decoration: none;
        }
        a:hover {
            color: #b71c1c;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="register-container">
        <h2 class="text-center mb-4">注册</h2>
        <form action="register" method="post">
            <div class="form-group">
                <label for="username">用户名:</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">密码:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="realName">真实姓名:</label>
                <input type="text" class="form-control" id="realName" name="realName" required>
            </div>
            <div class="form-group">
                <label for="sex">性别:</label>
                <select class="form-control" id="sex" name="sex" required>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>
            <div class="form-group">
                <label for="number">学号:</label>
                <input type="text" class="form-control" id="number" name="number" required>
            </div>
            <div class="form-group">
                <label for="grade">年级:</label>
                <input type="text" class="form-control" id="grade" name="grade" required>
            </div>
            <div class="form-group">
                <label for="major">专业:</label>
                <input type="text" class="form-control" id="major" name="major" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">注册</button>
        </form>
        <p class="text-danger text-center mt-3">${error}</p>
        <p class="text-center mt-3"><a href="login.jsp">登录</a></p>
    </div>
</div>
<!-- 引入 Bootstrap JS 和依赖 -->
<script src="js/jquery-3.7.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
