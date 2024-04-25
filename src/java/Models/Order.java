/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.Date;

/**
 *
 * @author PC
 */
public class Order {
    private int oid;
    private User uid;
    private Date orderDate;
    private String address;
    private String Phone;
    private shipper sid;
    private double totalAmount;
    private int status;

    public Order() {
    }

    public Order(int oid, User uid, Date orderDate, String address, String Phone, shipper sid, double totalAmount, int status) {
        this.oid = oid;
        this.uid = uid;
        this.orderDate = orderDate;
        this.address = address;
        this.Phone = Phone;
        this.sid = sid;
        this.totalAmount = totalAmount;
        this.status = status;
    }
    public Order(int oid ,int status) {
        this.oid = oid;
        this.status = status;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public User getUid() {
        return uid;
    }

    public void setUid(User uid) {
        this.uid = uid;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public shipper getSid() {
        return sid;
    }

    public void setSid(shipper sid) {
        this.sid = sid;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" + "oid=" + oid + ", uid=" + uid + ", orderDate=" + orderDate + ", address=" + address + ", Phone=" + Phone + ", sid=" + sid + ", totalAmount=" + totalAmount + ", status=" + status + '}';
    }

 
}
