/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import CSDL.tbNhomSP;
import Models.clsNhomSP;
import Tienich.Dungchung;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(urlPatterns = {"/EditDataTable"})
public class EditDataTable extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            tbNhomSP tb_nhomSP = new tbNhomSP();
            int result = 0;
            if (request.getParameter("c").equalsIgnoreCase("suanhom")) {
                int id = Integer.parseInt(request.getParameter("txtGroupId"));
                out.println(id);
                String name = request.getParameter("txtGroupName");
                out.println(name);
                int orderby = Integer.parseInt(request.getParameter("txtOrderId"));
                out.print(orderby);
                int status = Integer.parseInt(request.getParameter("txtGroupStatus"));
                out.println(status);
                result = tb_nhomSP.suaNhomSanPham(id, name, orderby, status);
                out.println(result);
                response.sendRedirect("admin/index.jsp");
            } else if (request.getParameter("c").equalsIgnoreCase("xoanhom")) {
                
                result = tb_nhomSP.xoaNhomSanPham(Integer.parseInt(request.getParameter("idGroup")));
                out.println(request.getParameter("idGroup"));
                if (result == -2) {
                    tb_nhomSP.suaNhomSanPham(Integer.parseInt(request.getParameter("idGroup")));
                }
                out.println(result);
                response.sendRedirect("admin/index.jsp?error=2");
            } else if (request.getParameter("c").equals("themNhom")) {
                String name = request.getParameter("txtGroupName");
                int orderby = Integer.parseInt(request.getParameter("txtOrderId"));
                int status = Integer.parseInt(request.getParameter("txtGroupStatus"));
                clsNhomSP sp = new clsNhomSP();
                sp.setTenhom(name); 
                sp.setTrangthai(Dungchung.intToBoolean(status));
                sp.setThutu(orderby);
                result = tb_nhomSP.ThemNhomSP(sp);
                out.println(result);
                if (result > 1) {
                    response.sendRedirect("admin/index.jsp");
                }
                else {
                    response.sendRedirect("admin/index.jps?s=f");
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
