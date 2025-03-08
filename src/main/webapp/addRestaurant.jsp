<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>添加餐厅</title>
    <!-- 引入 Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">添加餐厅</h1>
    <form action="addRestaurant" method="post" class="mb-3">
        <div class="form-group">
            <label for="name">名称:</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="type">菜系:</label>
            <input type="text" class="form-control" id="type" name="type" required>
        </div>
        <div class="form-group">
            <label for="main">主材:</label>
            <input type="text" class="form-control" id="main" name="main" required>
        </div>
        <div class="form-group">
            <label for="category">类别:</label>
            <input type="text" class="form-control" id="category" name="category" required>
        </div>
        <button type="submit" class="btn btn-primary">添加</button>
    </form>
    <p class="text-success">${successMessage}</p>
    <p class="text-danger">${errorMessage}</p>
    <a href="listRestaurants" class="btn btn-secondary">返回餐厅列表</a>
</div>
<!-- 引入 Bootstrap JS 和依赖 -->
<script src="js/jquery-3.7.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
