package com.restaurant.servlet;

import com.restaurant.dao.RestaurantDAO;
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

@WebServlet("/deleteRestaurant")
public class DeleteRestaurantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RestaurantDAO restaurantDAO;

    @Override
    public void init() throws ServletException {
        Connection connection = DBUtil.getConnection();
        restaurantDAO = new RestaurantDAO(connection);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            restaurantDAO.deleteRestaurant(id);
            request.setAttribute("successMessage", "餐厅删除成功");
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "餐厅删除失败: " + e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("deleteRestaurant.jsp");
        dispatcher.forward(request, response);
    }
}
