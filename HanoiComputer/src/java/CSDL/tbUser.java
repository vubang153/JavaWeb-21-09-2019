/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CSDL;

import Models.clsNhomSP;
import Models.clsUser;
import com.mysql.jdbc.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class tbUser {

    public int loginCheck(String username, String password) {
        Connection cnn = Database.KetnoiCSDL();
        if (cnn == null) {
            return -1;
        } else//nếu kết nối CSDL thành công
        {
            String sql = "SELECT * FROM tbuser WHERE username='"
                    + username + "' AND password='" + password + "'";
            try {
                Statement stm = cnn.createStatement();
                ResultSet rs = stm.executeQuery(sql);
                if (rs.next()) {
                    return rs.getInt("user_id");
                } else {
                    return -1;
                }
            } catch (SQLException ex) {
                Logger.getLogger(tbUser.class.getName()).log(Level.SEVERE, null, ex);
                return -2;
            }
        }
    }
    public int loginCheckAdmin(String username, String password) {
        Connection cnn = Database.KetnoiCSDL();
        if (cnn == null) {
            return -1;
        } else//nếu kết nối CSDL thành công
        {
            String sql = "SELECT * FROM tbquantri WHERE taikhoan='"
                    + username + "' AND matkhau='" + password + "'";
            try {
                Statement stm = cnn.createStatement();
                ResultSet rs = stm.executeQuery(sql);
                if (rs.next()) {
                    return rs.getInt("id");
                } else {
                    return -1;
                }
            } catch (SQLException ex) {
                Logger.getLogger(tbUser.class.getName()).log(Level.SEVERE, null, ex);
                return -2;
            }
        }
    }

    public int register(String username, String password, String name, int phone_number, int sex,
            String ngaysinh, String address, String province) {
        Connection cnn = Database.KetnoiCSDL();
        if (cnn == null) {
            return -1;
        } else//nếu kết nối CSDL thành công
        {
            String sql = "INSERT INTO tbuser(username,PASSWORD,NAME,phone_number,sex,birthday,address,province)"
                    + " VALUES(?,?,?,?,?,?,?,?)";
            try {
                PreparedStatement ptm = (PreparedStatement) cnn.prepareStatement(sql);
                ptm.setString(1, username);
                ptm.setString(2, password);
                ptm.setString(3, name);
                ptm.setInt(4, phone_number);
                ptm.setInt(5, sex);
                ptm.setString(6, ngaysinh);
                ptm.setString(7, address);
                ptm.setString(8, province);
                ptm.execute();
                return 1;
            } catch (SQLException ex) {
                Logger.getLogger(tbUser.class.getName()).log(Level.SEVERE, null, ex);
                return -2;
            }
        }
    }

    public int fullInfoUser(int user_id, clsUser user) {
        Connection cnn = Database.KetnoiCSDL();
        if (cnn == null) {
            return -1;
        } else//nếu kết nối CSDL thành công
        {
            String sql = "SELECT * FROM tbuser WHERE user_id='" + user_id  + "'";
            try {
                Statement stm = cnn.createStatement();
                ResultSet rs = stm.executeQuery(sql);
                if (rs.next()) {
                    user.setAddress(rs.getString("address"));
                    user.setPhone_number(rs.getInt("phone_number"));
                    user.setReal_name(rs.getString("name"));
                }
                return 1;
//                return user.getPhone_number();
            } catch (SQLException ex) {
                Logger.getLogger(tbUser.class.getName()).log(Level.SEVERE, null, ex);
                return -2;
            }
        }
    }
}
