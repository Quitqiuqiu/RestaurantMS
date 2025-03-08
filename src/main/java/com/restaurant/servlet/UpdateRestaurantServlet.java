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

@WebServlet("/updateRestaurant")
public class UpdateRestaurantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RestaurantDAO restaurantDAO;

    @Override
    public void init() throws ServletException {
        Connection connection = DBUtil.getConnection();
        restaurantDAO = new RestaurantDAO(connection);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String main = request.getParameter("main");
        String category = request.getParameter("category");

        Restaurant restaurant = new Restaurant();
        restaurant.setId(id);
        restaurant.setName(name);
        restaurant.setType(type);
        restaurant.setMain(main);
        restaurant.setCategory(category);

        try {
            restaurantDAO.updateRestaurant(restaurant);
            request.setAttribute("successMessage", "餐厅更新成功");
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "餐厅更新失败: " + e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("updateRestaurant.jsp");
        dispatcher.forward(request, response);
    }
}
