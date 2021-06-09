/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author Admin
 */
public class clsSubGroup {
    private int ma_nhom_cha;
    private int ma_nhom_con;
    private String ten_nhom_con;

    public clsSubGroup(int ma_nhom_cha, int ma_nhom_con, String ten_nhom_con) {
        this.ma_nhom_cha = ma_nhom_cha;
        this.ma_nhom_con = ma_nhom_con;
        this.ten_nhom_con = ten_nhom_con;
    }

    public clsSubGroup() {
    }

    public int getMa_nhom_cha() {
        return ma_nhom_cha;
    }

    public void setMa_nhom_cha(int ma_nhom_cha) {
        this.ma_nhom_cha = ma_nhom_cha;
    }

    public int getMa_nhom_con() {
        return ma_nhom_con;
    }

    public void setMa_nhom_con(int ma_nhom_con) {
        this.ma_nhom_con = ma_nhom_con;
    }

    public String getTen_nhom_con() {
        return ten_nhom_con;
    }

    public void setTen_nhom_con(String ten_nhom_con) {
        this.ten_nhom_con = ten_nhom_con;
    }
}
