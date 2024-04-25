/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Models.Book;
import Models.Cart;
import Models.Categories;
import Models.Item;
import Models.Order;
import Models.OrderDetail;
import Models.User;
import Models.shipper;
import java.util.ArrayList;
import java.sql.SQLException;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

/**
 *
 * @author PC
 */
public class DAO extends DBContext {

    public List<Book> getAllBooks() {
        ArrayList<Book> Book = new ArrayList<>();
        String sql = "select B.book_id, B.book_name, B.image_path , B.Descrip ,B.quantity,B.price, C.category_id ,C.category_name "
                + "from Books B INNER JOIN Categories C ON B.category_id = C.category_id";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setBookID(rs.getInt("book_id"));
                b.setName(rs.getString("book_name"));
                b.setLink(rs.getString("image_path"));
                b.setDescrip(rs.getString("Descrip"));
                b.setQuantity(rs.getInt("quantity"));
                b.setPrice(rs.getDouble("price"));
                Categories c = new Categories();
                c.setCategoriesID(rs.getInt("category_id"));
                c.setCategoriesName(rs.getString("category_name"));
                b.setCateid(c);
                Book.add(b);

            }
        } catch (Exception e) {

        }
        return Book;
    }

    public List<OrderDetail> getAllOrderDetails(int orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        String sql = "SELECT od.order_detail_id, od.order_id, od.bookid, od.quantity, od.price, b.book_name "
                + "FROM OrderDetails od "
                + "INNER JOIN Books b ON od.bookid = b.book_id "
                + "WHERE od.order_id = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, orderId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOdid(rs.getInt("order_detail_id"));

                Order order = getOrderById(rs.getInt("order_id"));
                Book book = new Book();
                book.setName(rs.getString("book_name"));

                orderDetail.setOrderid(order);
                orderDetail.setBookid(book);
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setPrice(rs.getInt("price"));

                orderDetails.add(orderDetail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    public List<Categories> getAllCategories() {
        ArrayList<Categories> cate = new ArrayList<>();
        String sql = "select C.category_id , C.category_name  from Categories C ";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Categories c = new Categories();
                c.setCategoriesID(rs.getInt("category_id"));
                c.setCategoriesName(rs.getString("category_name"));
                cate.add(c);
            }
        } catch (Exception e) {

        }
        return cate;
    }

    public boolean addCategory(String categoryName) {
        String sql = "INSERT INTO Categories (category_name) VALUES (?)";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, categoryName);
            int rowsInserted = statement.executeUpdate();
            statement.close();

            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Book> getBooksByCategoryId(int categoryId) {
        ArrayList<Book> books = new ArrayList<>();
        String sql = "SELECT b.book_id, b.book_name, b.image_path , b.Descrip ,b.quantity,b.price "
                + "FROM Books b "
                + "INNER JOIN Categories c ON b.category_id = c.category_id "
                + "WHERE c.category_id = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, categoryId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                book.setBookID(rs.getInt("book_id"));
                book.setName(rs.getString("book_name"));
                book.setLink(rs.getString("image_path"));
                book.setDescrip(rs.getString("Descrip"));
                book.setQuantity(rs.getInt("quantity"));
                book.setPrice(rs.getDouble("price"));
                books.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    public User login(String username, String password) {
        String sql = "SELECT * FROM Users WHERE username=? AND upassword=?";
        try {
            PreparedStatement pst = connect.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                User user = new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getDouble(5)); // Assuming role is the 4th column in the ResultSet
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean changPassword(String username, String newPassword) {
        String sql = "UPDATE Users SET upassword = ? WHERE username = ?";

        try (PreparedStatement statement = connect.prepareStatement(sql)) {
            statement.setString(1, newPassword);
            statement.setString(2, username);

            int rowsUpdated = statement.executeUpdate();

            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User checkUsername(String username) {
        String sql = "SELECT * FROM Users WHERE username=? ";
        try {
            PreparedStatement pst = connect.prepareStatement(sql);
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                User user = new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getDouble(5));// Assuming role is the 4th column in the ResultSet
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Book> checkbookname(String name) {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT book_id, book_name, image_path, Descrip, quantity, price FROM Books WHERE book_name LIKE ?";
        try (PreparedStatement pst = connect.prepareStatement(sql)) {
            pst.setString(1, "%" + name + "%"); // Thêm dấu % cho phép toán LIKE
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    int bookId = rs.getInt("book_id");
                    String bookName = rs.getString("book_name");
                    String blink = rs.getString("image_path");
                    String descrip = rs.getString("Descrip");
                    int quantity = rs.getInt("quantity");
                    double price = rs.getDouble("price");

                    // Tạo đối tượng Book từ dữ liệu ResultSet và thêm vào danh sách
                    Book book = new Book(bookId, bookName, blink, descrip, quantity, price);
                    books.add(book);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    public User registerUser(User u) {
        String sql = "INSERT INTO Users (username, upassword,urole,Moneys) VALUES (?, ?,1,000.0)";
        try {
            PreparedStatement pst = connect.prepareStatement(sql);
            pst.setString(1, u.getUsername());
            pst.setString(2, u.getPassword());
            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
                // Đăng ký thành công, trả về đối tượng User mới với thông tin đăng ký
                User newUser = new User();
                newUser.setUsername(u.getUsername());
                newUser.setPassword(u.getPassword());
                return newUser;
            } else {
                // Đăng ký không thành công
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null; // Trả về null nếu có lỗi xảy ra
        }
    }

    public Book getBookByID(int id) {
        String sql = "SELECT B.book_id, B.book_name, B.image_path, B.Descrip, B.quantity, B.price "
                + "FROM Books B WHERE B.book_id = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet resultSet = st.executeQuery();
            if (resultSet.next()) {
                return new Book(resultSet.getInt("book_id"),
                        resultSet.getString("book_name"),
                        resultSet.getString("image_path"),
                        resultSet.getString("Descrip"),
                        resultSet.getInt("quantity"),
                        resultSet.getDouble("price"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Book addBook(Book book) {
        String sql = "INSERT INTO Books (book_name, image_path, Descrip, quantity, price, category_id) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pst = connect.prepareStatement(sql);
            pst.setString(1, book.getName());
            pst.setString(2, book.getLink());
            pst.setString(3, book.getDescrip());
            pst.setInt(4, book.getQuantity());
            pst.setDouble(5, book.getPrice());
            pst.setInt(6, book.getCateid().getCategoriesID());

            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
                // Lấy ID của sách vừa được thêm vào
                ResultSet rs = pst.getGeneratedKeys();
                if (rs.next()) {
                    int bookId = rs.getInt(1);
                    book.setBookID(bookId);
                }
                return book;
            } else {
                // Thêm không thành công
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public User getUserByID(int id) {
        String sql = "SELECT user_id, username, upassword, urole, Moneys FROM Users WHERE user_id =? ";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet resultSet = st.executeQuery();
            if (resultSet.next()) {
                return new User(resultSet.getInt("user_id"),
                        resultSet.getString("username"),
                        resultSet.getString("upassword"),
                        resultSet.getInt("urole"),
                        resultSet.getDouble("Moneys"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Order getOrderById(int id) {
        String sql = "SELECT order_id, user_id, sid, [date], phone, baddress, total_amount, dstatus FROM Orders WHERE order_id = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet resultSet = st.executeQuery();
            if (resultSet.next()) {
                Order order = new Order();
                order.setOid(resultSet.getInt("order_id"));
                User u = new User();
                u.setUser_id(resultSet.getInt("user_id"));
                order.setUid(u);
                shipper s = new shipper();
                s.setId(resultSet.getInt("sid"));
                order.setSid(s);
                order.setOrderDate(resultSet.getDate("date"));
                order.setPhone(resultSet.getString("phone"));
                order.setAddress(resultSet.getString("baddress"));
                order.setTotalAmount(resultSet.getDouble("total_amount"));
                order.setStatus(resultSet.getInt("dstatus"));
                return order;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<shipper> getAllShip() {
        List<shipper> list = new ArrayList<>();
        String sql = "SELECT id\n"
                + "      ,types\n"
                + "  FROM Shipper";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                shipper s = new shipper(rs.getInt("id"),
                        rs.getString("types"));
                list.add(s);

            }
        } catch (Exception e) {
        }
        return list;

    }

    public boolean checkDoubleUser(String user) {
        List<User> list = getAllUser();
        for (User u : list) {
            if (u.getUsername().equalsIgnoreCase(user)) {
                return true;
            }
        }
        return false;
    }

    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT user_id, username, upassword, urole, Moneys FROM Users";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("upassword"),
                        rs.getInt("urole"), // Change to getInt("urole") if it's stored as an integer
                        rs.getDouble("Moneys"));
                list.add(user);
            }
        } catch (SQLException e) {
            // Log or handle the exception appropriately
            e.printStackTrace();
        }
        return list;
    }

    public List<User> getUser() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT user_id, username, upassword, urole, Moneys FROM Users Where urole = 1 OR urole = 2";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("upassword"),
                        rs.getInt("urole"), // Change to getInt("urole") if it's stored as an integer
                        rs.getDouble("Moneys"));
                list.add(user);
            }
        } catch (SQLException e) {
            // Log or handle the exception appropriately
            e.printStackTrace();
        }
        return list;
    }

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT o.order_id, o.user_id, o.sid, u.username, s.types, o.date, o.phone, o.baddress, o.total_amount, o.dstatus "
                + "FROM Orders o "
                + "JOIN Users u ON o.user_id = u.user_id "
                + "JOIN Shipper s ON o.sid = s.id";

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Order order = new Order();
                order.setOid(rs.getInt("order_id"));
                order.setOrderDate(rs.getDate("date"));
                order.setPhone(rs.getString("phone"));
                order.setAddress(rs.getString("baddress"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setStatus(rs.getInt("dstatus"));

                User u = new User();
                u.setUser_id(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                order.setUid(u);

                shipper s = new shipper();
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("types"));
                order.setSid(s);
                list.add(order);
            }
        } catch (SQLException e) {
            // Log or handle the exception appropriately
            e.printStackTrace();
        }
        return list;
    }

    public List<Order> getOrdersByUserId(int userId) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT order_id, user_id, sid, [date], phone, baddress, total_amount, dstatus "
                + "FROM Orders WHERE user_id = ?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, userId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOid(rs.getInt("order_id"));
                User user = getUserByID(rs.getInt("user_id"));
                order.setUid(user);
                shipper s = new shipper();
                s.setId(rs.getInt("sid"));
                order.setSid(s);
                order.setOrderDate(rs.getDate("date"));
                order.setPhone(rs.getString("phone"));
                order.setAddress(rs.getString("baddress"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setStatus(rs.getInt("dstatus"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public void deleteUser(String id) {

        try {
            String sql = "delete from Users where user_id = ?";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, id);
            //khong tra ve du lieu thi dung executeUpdate
            statement.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteBook(String id) {

        try {
            String sql = "delete from Books where book_id = ?";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, id);
            //khong tra ve du lieu thi dung executeUpdate
            statement.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteOrder(String phone) {

        try {
            String sql = "DELETE FROM Orders WHERE phone = ?";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, phone);
            //khong tra ve du lieu thi dung executeUpdate
            statement.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addOrder(User u, Cart cart, int shipperId, String phone, String address) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            // Add to the Orders table
            String sql = "INSERT INTO Orders (user_id, sid, date, phone, baddress, total_amount, dstatus) "
                    + "VALUES (?, ?, ?, ?, ?, ?,0)";
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, u.getUser_id());
            st.setInt(2, shipperId);
            st.setString(3, date);
            st.setString(4, phone);
            st.setString(5, address);
            st.setDouble(6, cart.getTotalMoney());
            st.executeUpdate();

            // Retrieve the ID of the recently added order
            String sql1 = "SELECT TOP 1 order_id FROM Orders ORDER BY order_id DESC";
            PreparedStatement st1 = connect.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();

            // Add to the OrderLine table
            if (rs.next()) {
                int orderId = rs.getInt("order_id");
                for (Item i : cart.getItems()) {
                    String sql2 = "INSERT INTO OrderDetails (order_id, bookid, quantity, price) "
                            + "VALUES (?, ?, ?, ?)";
                    PreparedStatement st2 = connect.prepareStatement(sql2);
                    st2.setInt(1, orderId);
                    st2.setInt(2, i.getBook().getBookID());
                    st2.setInt(3, i.getQuantity());
                    st2.setDouble(4, i.getPrice());
                    st2.executeUpdate();
                }
            }
            String sql3 = "UPDATE Books\n"
                    + "   SET quantity= quantity - ?\n"
                    + " WHERE book_id=?";
            PreparedStatement st3 = connect.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getBook().getBookID());
                st3.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editUser(String name, String pass, int role, double money, int userId) {
        String sql = "UPDATE Users SET username=?, upassword=?, urole=?, Moneys=? WHERE user_id=?";
        try {
            PreparedStatement ed = connect.prepareStatement(sql);
            ed.setString(1, name);
            ed.setString(2, pass);
            ed.setInt(3, role);
            ed.setDouble(4, money);
            ed.setInt(5, userId);
            ed.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editBook(Book book) {
        String sql = "UPDATE Books SET book_name=?, image_path=?, Descrip=?, quantity=?, price=?, category_id=? WHERE book_id=?";
        try {
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setString(1, book.getName());
            statement.setString(2, book.getLink());
            statement.setString(3, book.getDescrip());
            statement.setInt(4, book.getQuantity());
            statement.setDouble(5, book.getPrice());
            statement.setInt(6, book.getCateid().getCategoriesID());
            statement.setInt(7, book.getBookID());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void EditOrder(Order o) {
        try {
            String sql = "UPDATE Orders SET dstatus = ? WHERE order_id = ?";
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, o.getStatus());
            statement.setInt(2, o.getOid());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUser(User u, Cart cart) {
        String sql = "UPDATE Users "
                + "SET Moneys = Moneys - ? "
                + "WHERE user_id = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            // Update the total money
            st.setDouble(1, cart.getTotalMoney());
            st.setInt(2, u.getUser_id());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public User checkAcountByuser(String user) {
        String sql = "SELECT [user_id]\n"
                + "      ,[username]\n"
                + "      ,[upassword]\n"
                + "      ,[urole]\n"
                + "      ,[Moneys]\n"
                + "  FROM [Users]  where username =? ";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, user);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("upassword"),
                        rs.getInt("urole"),
                        rs.getDouble("amount"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        List<Book> book = dao.getAllBooks();
        for (Book b : book) {
            System.out.println(b);
        }

        List<shipper> l = dao.getAllShip();
        for (shipper object : l) {
            System.out.println(object);
        }
        List<Book> a = dao.getBooksByCategoryId(3);
        for (Book c : a) {
            System.out.println(c);
        }
        List<Order> orders = dao.getAllOrder();
        for (Order order : orders) {
            System.out.println(order);
        }
        List<User> u = dao.getUser();
        for (User us : u) {
            System.out.println(us);
        }
    }
}
