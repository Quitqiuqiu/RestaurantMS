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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
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
        String realName = request.getParameter("realName");
        String sex = request.getParameter("sex");
        String number = request.getParameter("number");
        String grade = request.getParameter("grade");
        String major = request.getParameter("major");

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setType(1); // Ĭ��Ϊ1
        user.setRealName(realName);
        user.setSex(sex);
        user.setNumber(number);
        user.setGrade(grade);
        user.setMajor(major);

        if (userDAO.addUser(user)) {
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("error", "ע��ʧ��");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
