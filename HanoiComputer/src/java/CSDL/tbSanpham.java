/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CSDL;

import Models.clsNhomSP;
import Models.clsSanpham;
import com.mysql.jdbc.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tran Manh Truong
 */
public class tbSanpham {

    private void GanThongTinTuRS(ResultSet rs, clsSanpham sp) throws SQLException {
        sp.setId(rs.getInt("id"));
        sp.setMasp(rs.getString("masp"));
        sp.setTensp(rs.getString("tensp"));
        sp.setGiasp(rs.getInt("giasp"));
        sp.setManhom(rs.getInt("manhom"));
        sp.setHinhanh(rs.getString("hinhanh"));
        sp.setTomtat(rs.getString("tomtat"));
        sp.setNoidung(rs.getString("noidung"));
        sp.setTrangthai(rs.getBoolean("trangthai"));
    }

    public int TimDSSanpham(int manhom, Vector<clsSanpham> dsSP, int curpage) {
        //Vector<clsSanpham> dsSP=new Vector<clsSanpham>();
        Connection cnn = Database.KetnoiCSDL();
        int first_record = 0;
        int count = 0;
        if (curpage == 1) {
            first_record = 0;
        } else {
            first_record = (curpage - 1) * 12 - 1;
        }
        int last_record = 12;
        if (cnn == null) {
            return -1;//Lỗi kết nối CSDL
        } else//nếu kết nối CSDL thành công
        {
//            String count_sql = "SELECT COUNT(*) FROM tbsanpham";
            String sql = "SELECT * FROM tbsanpham WHERE 1 AND trangthai=1 ";
            String sql_count = "SELECT * FROM tbsanpham WHERE 1 AND trangthai=1 ";
            if (manhom > 0)//nếu mã nhóm > 0 => bổ sung tìm sp theo mã nhóm
            {
                sql = sql + "AND manhom=" + manhom;
                sql_count = sql_count + "AND manhom=" + manhom;

            }
            sql += "LIMIT " + first_record + "," + last_record;

            try {
                Statement stm = cnn.createStatement();
                ResultSet rs = stm.executeQuery(sql_count);
                while (rs.next()) {
                    count += 1;
                }
                rs = stm.executeQuery(sql);
                //dslop = new Vector<clsLophoc>();
                while (rs.next()) {//duyệt từng bản ghi kết quả select
                    clsSanpham sp = new clsSanpham();
                    GanThongTinTuRS(rs, sp);
                    dsSP.add(sp);
                }
                if (dsSP.size() == 0)//không tìm thấy sản phẩm nào
                {
                    return 0;
                } else {
                    return count;
                }
            } catch (SQLException ex) {
                Logger.getLogger(tbSanpham.class.getName()).log(Level.SEVERE, null, ex);
                return -2;//Lỗi SQL
            }
        }
    }

    public int TimSanpham(int id, clsSanpham sp) {
        //clsSanpham sp=new clsSanpham();
        Connection cnn = Database.KetnoiCSDL();
        if (cnn == null) {
            return -1;
        } else//nếu kết nối CSDL thành công
        {
            String sql = "SELECT * FROM tbsanpham WHERE id=" + id;
            try {
                Statement stm = cnn.createStatement();
                ResultSet rs = stm.executeQuery(sql);
                if (rs.next()) {//nếu có kết quả select
                    GanThongTinTuRS(rs, sp);
                    return 1;
                } else {
                    return 0;
                }
            } catch (SQLException ex) {
                Logger.getLogger(tbSanpham.class.getName()).log(Level.SEVERE, null, ex);
                return -2;
            }
        }
    }

    //TRẢ VỀ DANH SÁCH N SẢN PHẨM MỚI NHẤT
    public int DSTopNSanpham(int n, Vector<clsSanpham> dsSP) {
        //Vector<clsSanpham> dsSP=new Vector<clsSanpham>();
        Connection cnn = Database.KetnoiCSDL();
        if (cnn == null) {
            return -1;
        } else//nếu kết nối CSDL thành công
        {
            String sql = "SELECT * FROM tbsanpham  ORDER BY id DESC Limit 0," + n;
            try {
                Statement stm = cnn.createStatement();
                ResultSet rs = stm.executeQuery(sql);
                //dslop = new Vector<clsLophoc>();
                while (rs.next()) {//duyệt từng bản ghi kết quả select
                    clsSanpham sp = new clsSanpham();
                    GanThongTinTuRS(rs, sp);
                    dsSP.add(sp);
                }
                if (dsSP.size() == 0)//không tìm thấy sản phẩm nào
                {
                    return 0;
                }
            } catch (SQLException ex) {
                Logger.getLogger(tbSanpham.class.getName()).log(Level.SEVERE, null, ex);
                return -2;//Lỗi SQL
            }
        }
        return 1;
    }

    public int getListProduct(Vector<clsSanpham> dsSP) {
        //Vector<clsSanpham> dsSP=new Vector<clsSanpham>();
        Connection cnn = Database.KetnoiCSDL();
        if (cnn == null) {
            return -1;
        } else//nếu kết nối CSDL thành công
        {
            String sql = "SELECT * FROM tbsanpham";
            try {
                Statement stm = cnn.createStatement();
                ResultSet rs = stm.executeQuery(sql);
                //dslop = new Vector<clsLophoc>();
                while (rs.next()) {//duyệt từng bản ghi kết quả select
                    clsSanpham sp = new clsSanpham();
                    GanThongTinTuRS(rs, sp);
                    dsSP.add(sp);
                }
                if (dsSP.size() == 0)//không tìm thấy sản phẩm nào
                {
                    return 0;
                }
            } catch (SQLException ex) {
                Logger.getLogger(tbSanpham.class.getName()).log(Level.SEVERE, null, ex);
                return -2;//Lỗi SQL
            }
        }
        return 1;
    }

    public int TimDSSanpham(int manhom, String tukhoa, int gia1, int gia2, Vector<clsSanpham> dsSP, int curpage) {
        //Vector<clsSanpham> dsSP=new Vector<clsSanpham>();
        Connection cnn = Database.KetnoiCSDL();
        int first_record = 0;
        int count = 0;
        if (curpage == 1) {
            first_record = 0;
        } else {
            first_record = (curpage - 1) * 12 - 1;
        }
        int last_record = 12;
        if (cnn == null) {
            return -1;
        } else//nếu kết nối CSDL thành công
        {
            String sql = "SELECT * FROM tbsanpham WHERE 1 AND trangthai=1 ";
            String sql_count = "SELECT * FROM tbsanpham WHERE 1 AND trangthai=1 ";

            if (manhom > 0) {
                sql = sql + " AND manhom=" + manhom;
                sql_count = sql_count + " AND manhom=" + manhom;

            }
            if (tukhoa.equals("") == false) {
                sql = sql + " AND tensp LIKE '%" + tukhoa + "%' ";
                sql_count = sql_count + " AND tensp LIKE '%" + tukhoa + "%' ";
            }
            if (gia1 >= 0 && gia2 > 0) {
                sql = sql + " AND (giasp >= " + gia1 + " AND giasp<=" + gia2 + ") ";
                sql_count = sql_count + " AND (giasp >= " + gia1 + " AND giasp<=" + gia2 + ") ";
            }
            sql += " LIMIT " + first_record + "," + last_record;

            try {
                Statement stm = cnn.createStatement();
                ResultSet rs = stm.executeQuery(sql_count);
                while (rs.next()) {
                    count += 1;
                }
                rs = stm.executeQuery(sql);
                //dslop = new Vector<clsLophoc>();
                while (rs.next()) {//duyệt từng bản ghi kết quả select
                    clsSanpham sp = new clsSanpham();
                    GanThongTinTuRS(rs, sp);
                    dsSP.add(sp);
                }
                if (dsSP.size() == 0)//không tìm thấy sản phẩm nào
                {
                    return 0;
                } else {
                    return count;
                }
            } catch (SQLException ex) {
                Logger.getLogger(tbSanpham.class.getName()).log(Level.SEVERE, null, ex);
                return -2;//Lỗi SQL
            }
        }
    }

    public int addNewProduct(clsSanpham sp) {
        Connection cnn = Database.KetnoiCSDL();
        if (cnn == null) {
            return -1;
        } else//nếu kết nối CSDL thành công
        {
            String sql = "INSERT INTO tbsanpham(masp,tensp,giasp,manhom,hinhanh,noidung) VALUES(?,?,?,?,?,?)";
            java.sql.PreparedStatement ptm;
            try {
                ptm = cnn.prepareStatement(sql);
                ptm.setString(1, sp.getMasp());
                ptm.setString(2, sp.getTensp());
                ptm.setInt(3, sp.getGiasp());
                ptm.setInt(4, sp.getManhom());
                ptm.setString(5, sp.getHinhanh());
                ptm.setString(6, sp.getNoidung());
                ptm.executeUpdate();
                return 1;
            } catch (SQLException ex) {
                Logger.getLogger(tbNhomSP.class.getName()).log(Level.SEVERE, null, ex);
                return -2;
            }
        }
    }
    public int editProduct(clsSanpham sp) {
        Connection cnn = Database.KetnoiCSDL();
        if (cnn == null) {
            return -1;
        } else//nếu kết nối CSDL thành công
        {
            String sql = "UPDATE tbsanpham SET masp = ?, tensp=?, giasp=?,manhom=?,noidung= ?, hinhanh = ? WHERE id=?";
            java.sql.PreparedStatement ptm;
            try {
                ptm = cnn.prepareStatement(sql);
                ptm.setString(1, sp.getMasp());
                ptm.setString(2, sp.getTensp());
                ptm.setInt(3, sp.getGiasp());
                ptm.setInt(4, sp.getManhom());
                ptm.setString(5, sp.getNoidung());
                ptm.setInt(7, sp.getId());
                ptm.setString(6,sp.getHinhanh());
                ptm.executeUpdate();
                return 1;
            } catch (SQLException ex) {
                Logger.getLogger(tbNhomSP.class.getName()).log(Level.SEVERE, null, ex);
                return -2;
            }
        }
    }
    public int deleteProduct(int id) {
        Connection cnn = Database.KetnoiCSDL();
        if (cnn == null) {
            return -1;
        } else//nếu kết nối CSDL thành công
        {
            String sql = "DELETE FROM tbsanpham WHERE id=?";
            java.sql.PreparedStatement ptm;
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
}
