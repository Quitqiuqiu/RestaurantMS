<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <!-- 引入 Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(45deg, #ff9a9e 0%, #fad0c4 100%); /* 更柔和的渐变色 */
            font-family: 'Arial', sans-serif;
        }
        .login-container {
            max-width: 500px; /* 容器宽度增大 */
            margin: 150px auto; /* 上下间距增加 */
            padding: 60px; /* 内边距增加 */
            background-color: rgba(255, 255, 255, 0.8); /* 背景透明度降低 */
            border-radius: 30px; /* 圆角更大 */
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2); /* 阴影更明显 */
        }
        .login-container h2 {
            color: #d63031; /* 标题颜色改为红色 */
            font-size: 2.5em; /* 字体更大 */
            margin-bottom: 2rem; /* 下边距增加 */
        }
        .form-group label {
            color: #7f8c8d; /* 标签颜色改为灰色 */
            font-size: 1.2em; /* 字体稍大 */
        }
        .form-control {
            border-radius: 30px; /* 输入框圆角更大 */
            background-color: #fff; /* 输入框背景为白色 */
            border: 1px solid #bdc3c7; /* 边框颜色改为浅灰 */
            font-size: 1.1em; /* 字体稍大 */
            padding: 15px; /* 内边距增加 */
        }
        .form-control:focus {
            border-color: #d63031; /* 输入框聚焦时边框颜色 */
            box-shadow: 0 0 5px rgba(214, 48, 49, 0.5); /* 输入框聚焦时阴影 */
        }
        .btn-primary {
            border-radius: 30px; /* 按钮圆角更大 */
            background-color: #d63031; /* 按钮背景色改为红色 */
            border: none;
            font-size: 1.2em; /* 字体稍大 */
            padding: 15px; /* 内边距增加 */
            transition: all 0.3s ease; /* 添加过渡效果 */
            width: 100%; /* 按钮宽度为100% */
        }
        .btn-primary:hover {
            background-color: #b72121; /* 悬停时背景色更深 */
            transform: scale(1.05); /* 悬停时放大 */
        }
        .text-danger {
            color: #d63031; /* 错误信息颜色改为红色 */
            font-size: 1.1em; /* 字体稍大 */
            font-weight: bold; /* 加粗显示 */
            margin-top: 1rem; /* 上边距增加 */
        }
        a {
            color: #d63031; /* 链接颜色改为红色 */
            text-decoration: none;
            font-size: 1.1em; /* 字体稍大 */
            transition: color 0.3s ease; /* 添加过渡效果 */
        }
        a:hover {
            color: #b72121; /* 悬停时颜色更深 */
        }
    </style>
</head>
<body>
<div class="container">
    <div class="login-container">
        <h2 class="text-center">登录</h2>
        <form action="login" method="post">
            <div class="form-group">
                <label for="username">用户名:</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">密码:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">登录</button>
        </form>
        <p class="text-danger text-center">${error}</p>
        <p class="text-center"><a href="register.jsp">注册</a></p>
    </div>
</div>
<!-- 引入 Bootstrap JS 和依赖 -->
<script src="js/jquery-3.7.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
