/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import CSDL.tbChitietHoadon;
import CSDL.tbHoadon;
import CSDL.tbSanpham;
import CSDL.tbUser;
import Models.clsChitietHoadon;
import Models.clsHoadon;
import Models.clsSanpham;
import Models.clsUser;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tran Manh Truong
 */
@WebServlet(name = "cart_checkout", urlPatterns = {"/cart_checkout"})
public class cart_checkout extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            HashMap<Integer,Integer> cart = (HashMap<Integer,Integer>)session.getAttribute("cart");
            clsUser user = new clsUser();
            tbUser tb_user = new tbUser();
            int tongGia = 0;
            int user_id = Integer.parseInt(session.getAttribute("user_id").toString());
            int result = tb_user.fullInfoUser(user_id, user);
            if(cart!=null ||cart.size()>0){
                //lấy thông tin từ form đặt hàng và tạo hóa đơn mới
                clsHoadon hoadon = new clsHoadon();
                hoadon.setId_customer(user_id);
                hoadon.setTennguoimua(user.getReal_name());
                hoadon.setDienthoai(user.getPhone_number());
                out.println(hoadon.getId_customer());
                out.println(hoadon.getTennguoimua());
                out.println(hoadon.getDienthoai());
                tbHoadon bangHoadon = new tbHoadon();
                int mahd = bangHoadon.ThemHoadon(hoadon);
                boolean loi = false;
                if(mahd<=0){
                    out.println("<h3>Lỗi thêm hóa đơn: " + mahd + "</h3>");
                    loi = true;
                }
                else{//thêm các sản phẩm từ giỏ hàng vào chi tiết hóa đơn 
                    for(int idsp : cart.keySet())//lấy các id sản phẩm từ giỏ hàng
                    {
                        int soluong = cart.get(idsp);
                        //lấy giá sản phẩm từ bảng sản phẩm
                        tbSanpham bangSanpham = new tbSanpham();
                        clsSanpham sp = new clsSanpham();
                        bangSanpham.TimSanpham(idsp,sp);
                        int dongia = sp.getGiasp();
                        tongGia += dongia* cart.get(idsp);
                        //tạo chi tiết hóa đơn và thêm vào csdl
                        clsChitietHoadon cthd = new clsChitietHoadon(0, mahd, idsp, soluong, dongia);
                        tbChitietHoadon bangChitietHoadon = new tbChitietHoadon();
                        int ketqua = bangChitietHoadon.ThemChitietHoadon(cthd);
                        if(ketqua<=0){
                            out.println("<h3>Lỗi thêm chi tiết hóa đơn</h3>");
                            loi = true;
                        }
                    }
                }
                if(loi==false){
                    session.setAttribute("cart", null);
                    response.sendRedirect("index.jsp?module=checkout_success&orderId=" + mahd + "&total_price=" + tongGia);
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
