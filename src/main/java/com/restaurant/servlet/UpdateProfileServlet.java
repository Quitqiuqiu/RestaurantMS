package com.restaurant.servlet;

import com.restaurant.dao.UserDAO;
import com.restaurant.entity.User;
import com.restaurant.util.DBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

/**
 * 更新用户资料的Servlet
 */
@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    /**
     * 初始化Servlet，创建UserDAO实例
     * @throws ServletException 如果初始化失败
     */
    @Override
    public void init() throws ServletException {
        Connection connection = DBUtil.getConnection();
        userDAO = new UserDAO(connection);
    }

    /**
     * 处理用户资料更新请求
     * @param request HttpServletRequest对象，用于获取请求信息
     * @param response HttpServletResponse对象，用于发送响应信息
     * @throws ServletException 如果处理过程中发生Servlet异常
     * @throws IOException 如果处理过程中发生I/O异常
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            // 更新用户信息
            user.setRealName(request.getParameter("realName"));
            user.setSex(request.getParameter("sex"));
            user.setNumber(request.getParameter("number"));
            user.setGrade(request.getParameter("grade"));
            user.setMajor(request.getParameter("major"));

            // 调用DAO方法更新数据库中的用户信息
            if (userDAO.updateUser(user)) {
                session.setAttribute("user", user);

                // 设置更新成功的信息
                request.setAttribute("successMessage", "更新成功");

                // 转发到 profile.jsp
                RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
                dispatcher.forward(request, response);

            } else {
                // 如果更新失败，设置错误信息并转发到 profile.jsp
                request.setAttribute("error", "更新成功");
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            }
        } else {
            // 如果用户未登录，重定向到 login.jsp
            response.sendRedirect("login.jsp");
        }
    }
}
