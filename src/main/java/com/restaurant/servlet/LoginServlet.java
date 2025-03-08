package com.restaurant.servlet;

import com.restaurant.dao.UserDAO;
import com.restaurant.entity.User;
import com.restaurant.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        Connection connection = DBUtil.getConnection();
        userDAO = new UserDAO(connection);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userDAO.getUserByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            if(user.getType() == 0){
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("listRestaurants");
            }else {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("menu.jsp");
            }

        } else {
            request.setAttribute("error", "账号或密码错误");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}

