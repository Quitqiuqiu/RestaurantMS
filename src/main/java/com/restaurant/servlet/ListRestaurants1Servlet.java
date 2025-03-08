package com.restaurant.servlet;

import com.restaurant.dao.RestaurantDAO;
import com.restaurant.entity.Restaurant;
import com.restaurant.util.DBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/listRestaurants1")
public class ListRestaurants1Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RestaurantDAO restaurantDAO;

    @Override
    public void init() throws ServletException {
        Connection connection = DBUtil.getConnection();
        restaurantDAO = new RestaurantDAO(connection);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String main = request.getParameter("main");
        String category = request.getParameter("category");

        try {
            List<Restaurant> restaurants = restaurantDAO.searchRestaurants(name, type, main, category);
            request.setAttribute("restaurants", restaurants);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "获取餐厅列表失败: " + e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("listRestaurants1.jsp");
        dispatcher.forward(request, response);
    }
}
