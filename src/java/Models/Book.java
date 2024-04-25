/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author PC
 */
public class Book {

    private int bookID;
    private String name;
    private String link;
    private String descrip;
    private int quantity;
    private double price;
    private Categories cateid;

    public Book() {
    }

    public Book(int bookID, String name, String link, String descrip, int quantity, double price) {
        this.bookID = bookID;
        this.name = name;
        this.link = link;
        this.descrip = descrip;
        this.quantity = quantity;
        this.price = price;
    }

    public Book(int bookID, String name, String link, String descrip, int quantity, double price, Categories cateid) {
        this.bookID = bookID;
        this.name = name;
        this.link = link;
        this.descrip = descrip;
        this.quantity = quantity;
        this.price = price;
        this.cateid = cateid;
    }
     public Book( String name, String link, String descrip, int quantity, double price, Categories cateid) {
        this.name = name;
        this.link = link;
        this.descrip = descrip;
        this.quantity = quantity;
        this.price = price;
        this.cateid = cateid;
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getDescrip() {
        return descrip;
    }

    public void setDescrip(String descrip) {
        this.descrip = descrip;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Categories getCateid() {
        return cateid;
    }

    public void setCateid(Categories cateid) {
        this.cateid = cateid;
    }

    @Override
    public String toString() {
        return "Book{" + "bookID=" + bookID + ", name=" + name + ", link=" + link + ", descrip=" + descrip + ", quantity=" + quantity + ", price=" + price + ", cateid=" + cateid + '}';
    }

    
}
