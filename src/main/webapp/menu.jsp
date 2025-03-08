<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>菜单选择</title>
    <!-- 引入 Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #a1c4fd 0%, #c2e9fb 100%);
            font-family: 'Georgia', serif;
            color: #333;
        }
        .choose-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 50px;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
            text-align: center;
        }
        .choose-container h2 {
            font-size: 36px;
            margin-bottom: 20px;
            color: #0056b3;
        }
        .btn-primary {
            margin: 15px;
            padding: 15px 30px;
            font-size: 18px;
            border-radius: 25px;
            background-color: #6c5ce7;
            border: none;
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn-primary:hover {
            background-color: #5a45f7;
            transform: scale(1.05);
        }
        .icon {
            font-size: 24px;
            margin-right: 5px;
        }
    </style>
    <!-- 引入 Font Awesome 图标库 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="choose-container">
        <h2 class="text-center mb-4">菜单选择</h2>
        <a href="profile.jsp" class="btn btn-primary btn-lg">
            <i class="fas fa-user icon"></i> 个人信息
        </a>
        <a href="listRestaurants1" class="btn btn-primary btn-lg">
            <i class="fas fa-list icon"></i> 列表
        </a>
    </div>
</div>
<!-- 引入 Bootstrap JS 和依赖 -->
<script src="js/jquery-3.7.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
