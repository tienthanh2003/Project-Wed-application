/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Dal.DAO;
import Models.Book;
import Models.Cart;

import Models.Item;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author PC
 */
public class CheckOut extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckCart at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DAO dao = new DAO();

        List<Book> list = dao.getAllBooks();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        if (!txt.isEmpty()) {
            Cart cart = new Cart(txt, list);
            HttpSession session = request.getSession();
            User a = (User) session.getAttribute("account");
            if (a == null) {
                response.sendRedirect("login");
            } else {
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                String checkshipper = request.getParameter("checkshipper");
                if (!address.isEmpty() && !phone.isEmpty() && a.getMoney() >= cart.getTotalMoney()) {
                    dao.addOrder(a, cart, Integer.parseInt(checkshipper), phone, address);
                    dao.updateUser(a, cart);
                    double newMoney = a.getMoney() - cart.getTotalMoney();
                    a.setMoney(newMoney);
                    session.setAttribute("account", a);
                    Cookie c = new Cookie("cart", "");
                    c.setMaxAge(0);
                    response.addCookie(c);
                    request.setAttribute("mess1", "đã đặt hàng thành công");
                    List<Item> items = cart.getItems();
                    session.setAttribute("size", items.size());
                    // set lai custome vao trong session 
                    User ur = dao.checkAcountByuser(a.getUsername());
                    session.setAttribute("account", a);
                } else {
                    request.setAttribute("mess3", "chưa nhập đầy đủ thông tin hoặc tổng tiền không đủ!");
                }
            }
        } else {
            request.setAttribute("mess2", "giỏ hàng rỗng vui lòng mua sản phẩm!");
        }
        request.getRequestDispatcher("Views/mycart.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
