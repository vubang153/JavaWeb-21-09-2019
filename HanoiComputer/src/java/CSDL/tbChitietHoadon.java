/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CSDL;

import Models.clsChitietHoadon;
import Models.clsHoadon;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
public class tbChitietHoadon {

    private void GanThongTinTuRS(ResultSet rs, clsChitietHoadon cthd) throws SQLException {
        cthd.setId(rs.getInt("id"));
        cthd.setIdhd(rs.getInt("mahd"));
        cthd.setIdsp(rs.getInt("idsp"));
        cthd.setSoluong(rs.getInt("soluong"));
        cthd.setGiamua(rs.getInt("giamua"));
    }

    //tính tổng tiền, đầu vào là mã hóa đơn

    public int TinhTongTienHD(int MaHD) {
        Connection cnn = Database.KetnoiCSDL();
        if (cnn == null) {
            return -1;
        }
        String sql = "SELECT SUM(soluong*giamua) AS tongtien FROM tbchitiethoadon WHERE mahd=?";
        try {
            PreparedStatement stm = cnn.prepareStatement(sql);
            stm.setInt(1, MaHD);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("tongtien");
            } else {
                return 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(tbChitietHoadon.class.getName()).log(Level.SEVERE, null, ex);
            return -2;
        }
    }

    public int ThemChitietHoadon(clsChitietHoadon cthd) {
        Connection cnn = Database.KetnoiCSDL();
        if (cnn == null) {
            return -1;
        }
        String sql = "INSERT INTO tbchitiethoadon VALUES(NULL,?,?,?,?)";
        try {
            PreparedStatement stm = cnn.prepareStatement(sql);
            stm.setInt(1, cthd.getIdhd());
            stm.setInt(2, cthd.getIdsp());
            stm.setInt(3, cthd.getSoluong());
            stm.setInt(4, cthd.getGiamua());
            int n = stm.executeUpdate();
            if (n <= 0) {
                return 0;
            } else {
                return 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(tbChitietHoadon.class.getName()).log(Level.SEVERE, null, ex);
            return -2;
        }
    }

    public int TimDSChitietHoadon(int MaHD, Vector<clsChitietHoadon> dsCTHD) {
        Connection cnn = Database.KetnoiCSDL();
        if (cnn == null) {
            return -1;//Lỗi kết nối CSDL
        } else//nếu kết nối CSDL thành công
        {
            String sql = "SELECT * FROM tbchitiethoadon WHERE mahd=" + MaHD;
            try {
                Statement stm = cnn.createStatement();
                ResultSet rs = stm.executeQuery(sql);
                while (rs.next()) {//duyệt từng bản ghi kết quả select
                    clsChitietHoadon cthd = new clsChitietHoadon();
                    GanThongTinTuRS(rs, cthd);
                    dsCTHD.add(cthd);
                }
                if (dsCTHD.size() == 0)//không tìm thấy 
                {
                    return 0;
                }
            } catch (SQLException ex) {
                Logger.getLogger(tbChitietHoadon.class.getName()).log(Level.SEVERE, null, ex);
                return -2;//Lỗi SQL
            }
        }
        return 1;
    }
}
