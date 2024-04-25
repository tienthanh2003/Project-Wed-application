/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class DBContext {

   protected Connection connect;
    public DBContext()
    {
        //@Students: You are allowed to edit user, pass, url variables to fit 
        //your system configuration
        //You can also add more methods for Database Interaction tasks. 
        //But we recommend you to do it in another class
        // For example : StudentDBContext extends DBContext , 
        //where StudentDBContext is located in dal package, 
        try {
            String user = "sa";
            String pass = "thanh2003";
            String url = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433;databaseName=BookStore";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connect = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void main(String[] args) {
    // Creating an instance of DBContext to establish the database connection
    DBContext dbContext = new DBContext();
    
    // Checking if the connection is successfully established
    if (dbContext.connect != null) {
        System.out.println("Database connection established successfully!");
        try {
            // Closing the connection after testing
            dbContext.connect.close();
            System.out.println("Database connection closed successfully!");
        } catch (SQLException ex) {
            // Handling any potential closing connection errors
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    } else {
        System.out.println("Failed to establish database connection!");
    }
}

}
