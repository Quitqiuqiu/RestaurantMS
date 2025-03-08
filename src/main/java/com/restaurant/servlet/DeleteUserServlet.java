package com.restaurant.servlet;

import com.restaurant.dao.UserDAO;
import com.restaurant.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
    private UserDAO userDao;


    @Override
    public void init() throws ServletException {
        Connection connection = DBUtil.getConnection();
        userDao = new UserDAO(connection);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null) {
            try {
                int id = Integer.parseInt(idParam);
                userDao.deleteUser(id);
                request.setAttribute("successMessage", "ɾ���ɹ�");
            } catch (NumberFormatException e) {
                request.setAttribute("error", "��Ч���û�ID");
            }
        } else {
            request.setAttribute("error", "δ�ṩ�û�ID");
        }
        response.sendRedirect("login.jsp");
    }
}
