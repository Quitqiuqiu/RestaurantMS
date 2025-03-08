package com.restaurant.servlet;

import com.restaurant.dao.UserDAO;
import com.restaurant.entity.User;
import com.restaurant.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/userList")
public class UserListServlet extends HttpServlet {
    private UserDAO userDao;


    @Override
    public void init() throws ServletException {
        Connection connection = DBUtil.getConnection();
        userDao = new UserDAO(connection);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String keyword = request.getParameter("keyword");
        if (keyword == null) {
            keyword = "";
        }
        try {
            List<User> users = userDao.getUsers(keyword);
            request.setAttribute("users", users);
            request.getRequestDispatcher("/userList.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "��ѯʧ��");
            request.getRequestDispatcher("/userList.jsp").forward(request, response);
        }
    }
}
