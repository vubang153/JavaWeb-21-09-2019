/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import CSDL.tbUser;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(urlPatterns = {"/XuLyDangNhap"})
public class XuLyDangNhap extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();

            /* TODO output your page here. You may use following sample code. */
            if (request.getParameter("action") != null) {
                session.setAttribute("user", null);
                response.sendRedirect("index.jsp?module=login");
            } else {
                String user = request.getParameter("txtUsername");
                String password = request.getParameter("txtPassword");
                tbUser tb_user = new tbUser();
                int result = tb_user.loginCheck(user, password);
                out.println(result);
                out.println(user);
                out.println(password);
                if (result > 0) {
                    session.setAttribute("user", user);
                    session.setAttribute("user_id", result);
                    Cookie cookie1 = new Cookie("taikhoan", user);
                    Cookie cookie2 = new Cookie("matkhau", password);
                    if (request.getParameter("saveLoginCookies") == null) {
                        cookie1.setValue("");
                        cookie2.setValue("");
//                        out.println("hello");
                    }
                    response.addCookie(cookie1);
                    response.addCookie(cookie2);

                    response.sendRedirect("index.jsp");
                } else {
                    response.sendRedirect("index.jsp?module=login&s=f");
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
