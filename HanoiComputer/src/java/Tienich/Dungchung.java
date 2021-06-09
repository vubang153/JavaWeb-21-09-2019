/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tienich;

import CSDL.tbNhomSP;
import Models.clsNhomSP;
import java.io.IOException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

/**
 *
 * @author Tran Manh Truong
 */
public class Dungchung {

    public static void Hienthi_NhomSP_UL(JspWriter out) {
        try {
            tbNhomSP bangNhomSP = new tbNhomSP();
            //Vector<clsNhomSP> dsNhomSP = bangNhomSP.TimNhomSP("");
            Vector<clsNhomSP> dsNhomSP = new Vector<clsNhomSP>();
            int ketqua = bangNhomSP.TimNhomSP("", dsNhomSP);
            if (ketqua == -1) {
                out.println("<h3>LỖI KẾT NỐI CSDL</h3>");
            } else if (ketqua == -2) {
                out.println("<h3>LỖI TRUY VẤN CSDL SQL</h3>");
            } else if (ketqua == 0) {
                out.println("<h3>Chưa có nhóm sản phẩm</h3>");
            } else {
                out.println("<ul>");
                for (clsNhomSP nhomsp : dsNhomSP) {
                    out.println("<li>");
                    out.println("<a href=\"index.jsp?module=sanpham&manhom="
                            + nhomsp.getManhom() + "\">");
                    out.println(nhomsp.getTenhom());
                    out.println("</a>");
                    out.println("</li>");
                }
                out.println("</ul>");
            }
        } catch (IOException ex) {
            Logger.getLogger(Dungchung.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void Hienthi_NhomSP_Option(JspWriter out, int manhom) {
        try {
            tbNhomSP bangNhomSP = new tbNhomSP();
            //Vector<clsNhomSP> dsNhomSP = bangNhomSP.TimNhomSP("");
            Vector<clsNhomSP> dsNhomSP = new Vector<clsNhomSP>();
            int ketqua = bangNhomSP.TimNhomSP("", dsNhomSP);
            if (ketqua == -1) {
                out.println("<h3>LỖI KẾT NỐI CSDL</h3>");
            } else if (ketqua == -2) {
                out.println("<h3>LỖI TRUY VẤN CSDL SQL</h3>");
            } else if (ketqua == 0) {
                out.println("<h3>Chưa có nhóm sản phẩm</h3>");
            } else {
                for (clsNhomSP nhomsp : dsNhomSP) {
                    if (nhomsp.getManhom() == manhom) {
                        out.println("<option value=\"" + nhomsp.getManhom() + "\" selected>" + nhomsp.getTenhom() + "</option>");
                    } else {
                        out.println("<option value=\"" + nhomsp.getManhom() + "\">" + nhomsp.getTenhom() + "</option>");
                    }
                }
            }
        } catch (IOException ex) {
            Logger.getLogger(Dungchung.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static String booleanToString(boolean name, String dung, String sai) {
        if (name) {
            return dung;
        } else {
            return sai;
        }
    }

    public static String booleanToString(int name, String case1, String case2, String case3, String case4) {
        if (name == 0) {
            return case1;
        } else if (name == 1) {
            return case2;
        } else if (name == 2) {
            return case3;
        } else {
            return case4;
        }
    }

    public static boolean intToBoolean(int num) {
        if (num == 1) {
            return true;
        } else {
            return false;
        }
    }

    public static void outError(String error, JspWriter out, HttpServletRequest request) {
        if (request.getParameter("s") != null) {
            if (request.getParameter("s").equalsIgnoreCase("f")) {
                try {
                    out.println("<script>alert('Lỗi không xác định xin vui lòng thử lại')</script>");
                } catch (IOException ex) {
                    Logger.getLogger(Dungchung.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    public static void cartIsNull(HttpServletRequest request,HttpServletResponse response) {
        HttpSession session = request.getSession();
        if (session.getAttribute("cart") == null) {
            try {
                response.sendRedirect("index.jsp");
            } catch (IOException ex) {
                Logger.getLogger(Dungchung.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
