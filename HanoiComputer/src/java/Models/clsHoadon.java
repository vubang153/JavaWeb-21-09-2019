/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author Tran Manh Truong
 */
public class clsHoadon {
    private int mahd;
    private int id_customer;
    private String tennguoimua;
    private int dienthoai;
    private String ngaydat;
    private String ngaynhan;
    private int trangthai;

    public clsHoadon(int mahd, int id_customer, String tennguoimua, int dienthoai, String ngaydat, String ngaynhan, int trangthai) {
        this.mahd = mahd;
        this.id_customer = id_customer;
        this.tennguoimua = tennguoimua;
        this.dienthoai = dienthoai;
        this.ngaydat = ngaydat;
        this.ngaynhan = ngaynhan;
        this.trangthai = trangthai;
    }

    public clsHoadon() {
    }

    public int getMahd() {
        return mahd;
    }

    public void setMahd(int mahd) {
        this.mahd = mahd;
    }

    public int getId_customer() {
        return id_customer;
    }

    public void setId_customer(int id_customer) {
        this.id_customer = id_customer;
    }

    public String getTennguoimua() {
        return tennguoimua;
    }

    public void setTennguoimua(String tennguoimua) {
        this.tennguoimua = tennguoimua;
    }

    public int getDienthoai() {
        return dienthoai;
    }

    public void setDienthoai(int dienthoai) {
        this.dienthoai = dienthoai;
    }

    public String getNgaydat() {
        return ngaydat;
    }

    public void setNgaydat(String ngaydat) {
        this.ngaydat = ngaydat;
    }

    public String getNgaynhan() {
        return ngaynhan;
    }

    public void setNgaynhan(String ngaynhan) {
        this.ngaynhan = ngaynhan;
    }

    public int getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(int trangthai) {
        this.trangthai = trangthai;
    }

    
    
}
