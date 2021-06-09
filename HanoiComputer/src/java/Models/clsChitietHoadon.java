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
public class clsChitietHoadon {
    int id;
    int idhd;
    int idsp;
    int soluong;
    int giamua;

    public clsChitietHoadon() {
    }

    public clsChitietHoadon(int id, int idhd, int idsp, int soluong, int giamua) {
        this.id = id;
        this.idhd = idhd;
        this.idsp = idsp;
        this.soluong = soluong;
        this.giamua = giamua;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdhd() {
        return idhd;
    }

    public void setIdhd(int idhd) {
        this.idhd = idhd;
    }

    public int getIdsp() {
        return idsp;
    }

    public void setIdsp(int idsp) {
        this.idsp = idsp;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public int getGiamua() {
        return giamua;
    }

    public void setGiamua(int giamua) {
        this.giamua = giamua;
    }
    
}
