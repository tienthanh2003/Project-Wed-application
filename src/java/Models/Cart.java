/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class Cart {
    private List<Item> items;
    

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public Cart() {
        items= new ArrayList<>();
    }
    public Cart(List<Item> items){
        this.items=items;
    }
    private Item getItemById(int id){
        for (Item i : items) {
            if(i.getBook().getBookID()==id){
                return i;
            }
        }
        return null;
    }
    // tim so luong cua san pham 
    public int getQuantityById(int id){
         return getItemById(id).getQuantity();
    }
    // them vao gio hang
    public void addItem(Item t){
        // co trong cart roi
        if(getItemById(t.getBook().getBookID())!=null){
            Item i = getItemById(t.getBook().getBookID());
            // set lai so luong hang cho gio cart
            i.setQuantity(i.getQuantity()+t.getQuantity());
            
        }else{
            // chua co trong cart
            items.add(t);
        }
        
    }
    // xoa san pham gio hang
    public void  removeItem(int id){
        if(getItemById(id)!=null){
            items.remove(getItemById(id));
        }
    }
        //tong tien 
    public double getTotalMoney(){
        double t= 0;
        for (Item i : items) {
            t+=i.getQuantity()*i.getPrice();
        }
        return t;
    }
    // dung cho cookie
    private Book getProductByID(int id, List<Book> list){
        for(Book i : list){
            if(i.getBookID()==id){
                return i;
            }
        }
        return null;
    }
    public Cart(String txt,List<Book>list){
        items = new ArrayList<>();
        try {
             if(txt!=null && txt.length()!= 0){
            // tach tung tham so theo /
            String []s = txt.split("/");
            for(String i:s){
                // tach dung san pham bang dau :
                String[] n=i.split(":");
                int id  = Integer.parseInt(n[0]);
                int quantity = Integer.parseInt(n[1].trim());
                Book p = getProductByID(id, list);
                Item t = new Item(p, quantity, p.getPrice());
                addItem(t);
             }
             }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
