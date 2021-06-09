/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CSDL;

import Models.clsNhomSP;
import Models.clsSubGroup;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.jsp.JspWriter;

/**
 *
 * @author Tran Manh Truong
 */
public class tbNhomSP {

    public int TimNhomSP(String tukhoa, Vector<clsNhomSP> dsNhomSP) {
        //Vector<clsNhomSP> dsNhomSP=new Vector<clsNhomSP>();
        Connection cnn = Database.KetnoiCSDL();
        if (cnn == null) {
            return -1;
        } else//nếu kết nối CSDL thành công
        {
            String sql = "SELECT * FROM tbnhomsp";
            if (!tukhoa.equals(""))//nếu từ khóa khác rỗng
            {
                sql = sql + " WHERE tenhom LIKE '%" + tukhoa + "%'";
            }
            try {
                Statement stm = cnn.createStatement();
                ResultSet rs = stm.executeQuery(sql);
                //dslop = new Vector<clsLophoc>();
                while (rs.next()) {//duyệt từng bản ghi kết quả select
                    clsNhomSP nhomsp = new clsNhomSP();
                    nhomsp.setManhom(rs.getInt("manhom"));
                    nhomsp.setTenhom(rs.getString("tennhom"));
                    nhomsp.setThutu(rs.getInt("sothutu"));
                    nhomsp.setTrangthai(rs.getBoolean("trangthai"));
                    dsNhomSP.add(nhomsp);
                }
                if (dsNhomSP.size() == 0) {
                    return 0;
                }
            } catch (SQLException ex) {
                Logger.getLogger(tbNhomSP.class.getName()).log(Level.SEVERE, null, ex);
                return -2;
            }
        }
        return 1;
    }

    public int ThemNhomSP(clsNhomSP nhomsp) {
        Connection cnn = Database.KetnoiCSDL();
        if (cnn == null) {
            return -1;//lỗi kết nối csdl
        }
        String sql = "INSERT INTO tbnhomsp VALUES(NULL,?,?,?)";
        try {
            //bổ sung tham số Statement.RETURN_GENERATED_KEYS để trả về giá trị số tự động
            PreparedStatement stm = cnn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, nhomsp.getTenhom());
            stm.setInt(2, nhomsp.getThutu());
            stm.setBoolean(3, nhomsp.isTrangthai());
            int n = stm.executeUpdate();
            if (n <= 0) {
                return 0;//lỗi không thêm/cập nhật được dữ liệu
            } else {
                ResultSet rs = stm.getGeneratedKeys();//lấy các bản ghi số tự động tăng (có trường hợp insert 1 lúc nhiều dòng)
                int last_id = 1;
                if (rs.next()) {//lấy cột 1 của bản ghi đầu tiên trong ResulSet
                    last_id = rs.getInt(1);
                }
                return last_id;
            }
        } catch (SQLException ex) {
            Logger.getLogger(tbNhomSP.class.getName()).log(Level.SEVERE, null, ex);
            return -2;//lỗi SQL
        }
    }

    public int layDanhSachNhomCon(Vector<clsSubGroup> sub_group, int ma_nhom) {
        //Vector<clsNhomSP> dsNhomSP=new Vector<clsNhomSP>();
        Connection cnn = Database.KetnoiCSDL();
        if (cnn == null) {
            return -1;
        } else//nếu kết nối CSDL thành công
        {
            String sql = "SELECT * FROM ct_nhom_sp WHERE `manhom` = " + ma_nhom;
            try {
                Statement stm = cnn.createStatement();
                ResultSet rs = stm.executeQuery(sql);
                //dslop = new Vector<clsLophoc>();
                while (rs.next()) {//duyệt từng bản ghi kết quả select
                    clsSubGroup s_group = new clsSubGroup();
                    s_group.setTen_nhom_con(rs.getString("ten_nhom_con"));
                    s_group.setMa_nhom_con(rs.getInt("ma_nhom_con"));
                    s_group.setMa_nhom_cha(rs.getInt("manhom"));
                    sub_group.add(s_group);
                }
            } catch (SQLException ex) {
                Logger.getLogger(tbNhomSP.class.getName()).log(Level.SEVERE, null, ex);
                return -2;
            }
        }
        return 0;
    }

    public int suaNhomSanPham(int id, String ten, int stt, int trangthai) {
        Connection cnn = Database.KetnoiCSDL();
        if (cnn == null) {
            return -1;
        } else//nếu kết nối CSDL thành công
        {
            String sql = "UPDATE tbnhomsp set tennhom = ?,sothutu=?,trangthai = ? WHERE manhom=?";
            PreparedStatement ptm;
            try {
                ptm = cnn.prepareStatement(sql);
                ptm.setString(1, ten);
                ptm.setInt(2, stt);
                ptm.setInt(3, trangthai);
                ptm.setInt(4, id);
                ptm.executeUpdate();
                return 1;
            } catch (SQLException ex) {
                Logger.getLogger(tbNhomSP.class.getName()).log(Level.SEVERE, null, ex);
                return -2;
            }

        }
    }

    public int suaNhomSanPham(int id) {
        Connection cnn = Database.KetnoiCSDL();
        if (cnn == null) {
            return -1;
        } else//nếu kết nối CSDL thành công
        {
            String sql = "UPDATE tbnhomsp set trangthai = 0 WHERE manhom=?";
            PreparedStatement ptm;
            try {
                ptm = cnn.prepareStatement(sql);
                ptm.setInt(1, id);
                ptm.executeUpdate();
                return 1;
            } catch (SQLException ex) {
                Logger.getLogger(tbNhomSP.class.getName()).log(Level.SEVERE, null, ex);
                return -2;
            }

        }
    }

    public int xoaNhomSanPham(int id) {
        Connection cnn = Database.KetnoiCSDL();
        if (cnn == null) {
            return -1;
        } else//nếu kết nối CSDL thành công
        {
            String sql = "DELETE FROM tbnhomsp WHERE manhom = ?";
            PreparedStatement ptm;
            try {
                ptm = cnn.prepareStatement(sql);
                ptm.setInt(1, id);
                ptm.executeUpdate();
                return 1;
            } catch (SQLException ex) {
                Logger.getLogger(tbNhomSP.class.getName()).log(Level.SEVERE, null, ex);
                return -2;
            }

        }
    }
    // lấy trạng thái hiện tại để selected cho thẻ option
    public void selectCurrentState(int curstate, int state, JspWriter out) {
        if (curstate == state) {
            try {
                 out.println(" selected");
            } catch (IOException ex) {
                Logger.getLogger(tbNhomSP.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    } 
}
