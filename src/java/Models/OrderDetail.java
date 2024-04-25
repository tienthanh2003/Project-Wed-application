/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author PC
 */
public class OrderDetail {
    private int odid;
    private Order orderid;
    private Book bookid;
    private int quantity;
    private int price;

    public OrderDetail() {
    }

    public OrderDetail(int odid, Order orderid, Book bookid, int quantity, int price) {
        this.odid = odid;
        this.orderid = orderid;
        this.bookid = bookid;
        this.quantity = quantity;
        this.price = price;
    }

    public int getOdid() {
        return odid;
    }

    public void setOdid(int odid) {
        this.odid = odid;
    }

    public Order getOrderid() {
        return orderid;
    }

    public void setOrderid(Order orderid) {
        this.orderid = orderid;
    }

    public Book getBookid() {
        return bookid;
    }

    public void setBookid(Book bookid) {
        this.bookid = bookid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "odid=" + odid + ", orderid=" + orderid + ", bookid=" + bookid + ", quantity=" + quantity + ", price=" + price + '}';
    }

    
    
    
}
