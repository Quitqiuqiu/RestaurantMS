<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>餐厅列表</title>
    <!-- 引入 Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">餐厅管理系统</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="logout">注销</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container mt-5">
    <h1 class="mb-4">餐厅列表</h1>

    <!-- 查询表单 -->
    <form action="listRestaurants1" method="get" class="mb-3">
        <div class="form-row">
            <div class="form-group col-md-3">
                <label for="name">名称:</label>
                <input type="text" class="form-control" id="name" name="name" value="${param.name}">
            </div>
            <div class="form-group col-md-3">
                <label for="type">菜系:</label>
                <input type="text" class="form-control" id="type" name="type" value="${param.type}">
            </div>
            <div class="form-group col-md-3">
                <label for="main">主材:</label>
                <input type="text" class="form-control" id="main" name="main" value="${param.main}">
            </div>
            <div class="form-group col-md-3">
                <label for="category">类别:</label>
                <input type="text" class="form-control" id="category" name="category" value="${param.category}">
            </div>
        </div>
        <button type="submit" class="btn btn-primary">查询</button>
    </form>

    <table class="table table-striped table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>名称</th>
            <th>菜系</th>
            <th>主材</th>
            <th>类别</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="restaurant" items="${restaurants}">
            <tr>
                <td>${restaurant.id}</td>
                <td>${restaurant.name}</td>
                <td>${restaurant.type}</td>
                <td>${restaurant.main}</td>
                <td>${restaurant.category}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <p class="text-danger">${errorMessage}</p>
</div>
<!-- 引入 Bootstrap JS 和依赖 -->
<script src="js/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
