<%@ page import="com.restaurant.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
    <!-- 引入 Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #e0c3fc 0%, #8ec5fc 100%);
            font-family: 'Georgia', serif;
            color: #333;
        }
        .profile-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 50px;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
            text-align: center;
        }
        .profile-container h2 {
            font-size: 36px;
            margin-bottom: 20px;
            color: #0056b3;
        }
        .form-group label {
            font-size: 18px;
            color: #555;
        }
        .form-control {
            border-radius: 25px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            font-size: 16px;
        }
        .form-control:focus {
            border-color: #6c5ce7;
            box-shadow: 0 0 8px rgba(108, 92, 231, 0.5);
        }
        .btn-primary {
            border-radius: 25px;
            background-color: #6c5ce7;
            border: none;
            padding: 15px 30px;
            font-size: 18px;
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn-primary:hover {
            background-color: #5a45f7;
            transform: scale(1.05);
        }
        .btn-danger {
            border-radius: 25px;
            background-color: #ff4d4f;
            border: none;
            padding: 15px 30px;
            font-size: 18px;
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn-danger:hover {
            background-color: #ff1919;
            transform: scale(1.05);
        }
        .text-success, .text-danger {
            font-size: 18px;
            margin-top: 20px;
        }
        a {
            color: #6c5ce7;
            text-decoration: none;
            transition: color 0.3s;
        }
        a:hover {
            color: #5a45f7;
        }
        .navbar-custom {
            background-color: #6c5ce7;
            padding: 10px 20px;
        }
        .navbar-custom .navbar-brand {
            color: #fff;
            font-size: 24px;
        }
        .navbar-custom .navbar-nav .nav-link {
            color: #fff;
            font-size: 18px;
            margin-left: 15px;
        }
        .navbar-custom .navbar-nav .nav-link:hover {
            color: #ff4d4f;
        }
    </style>
    <script>
        function showSuccessMessageAndRefresh() {
            alert('更新成功');
        }

        function confirmDelete(userId) {
            if (confirm('确定要删除该用户吗？删除之后将会跳转到登录页面！！！')) {
                window.location.href = 'deleteUser?id=' + userId;
            }
        }
    </script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-custom">
    <a class="navbar-brand" href="#">个人信息</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="javascript:history.back()">返回上一级</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logout">注销</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container">
    <div class="profile-container">
        <h2 class="text-center mb-4">个人信息</h2>
        <%
            User user = (User) session.getAttribute("user");
            if (user != null) {
        %>
        <form action="updateProfile" method="post">
            <div class="form-group">
                <label for="realName">真实姓名:</label>
                <input type="text" class="form-control" id="realName" name="realName" value="<%= user.getRealName() %>"
                       required>
            </div>
            <div class="form-group">
                <label for="sex">性别:</label>
                <select class="form-control" id="sex" name="sex" required>
                    <option value="男" <%= user.getSex().equals("男") ? "selected" : "" %>>男</option>
                    <option value="女" <%= user.getSex().equals("女") ? "selected" : "" %>>女</option>
                </select>
            </div>
            <div class="form-group">
                <label for="number">学号:</label>
                <input type="text" class="form-control" id="number" name="number" value="<%= user.getNumber() %>"
                       required>
            </div>
            <div class="form-group">
                <label for="grade">年级:</label>
                <input type="text" class="form-control" id="grade" name="grade" value="<%= user.getGrade() %>" required>
            </div>
            <div class="form-group">
                <label for="major">专业:</label>
                <input type="text" class="form-control" id="major" name="major" value="<%= user.getMajor() %>" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">更新</button>
        </form>
        <%
            String successMessage = (String) request.getAttribute("successMessage");
            if (successMessage != null) {
        %>
        <p class="text-success text-center mt-3"><%= successMessage %></p>
        <script>
            showSuccessMessageAndRefresh();
        </script>
        <%
            }
            // 重置 successMessage
            request.setAttribute("successMessage", null);
        %>
        <p class="text-danger text-center mt-3">${error}</p>
        <button type="button" class="btn btn-danger btn-block" onclick="confirmDelete(<%= user.getId() %>)">删除</button>
        <p class="text-center mt-3"><a href="logout">注销</a></p>
        <%
        } else {
        %>
        <p class="text-center">请先登录</p>
        <p class="text-center mt-3"><a href="login.jsp">登录</a></p>
        <%
            }
        %>
    </div>
</div>
<!-- 引入 Bootstrap JS 和依赖 -->
<script src="js/jquery-3.7.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
