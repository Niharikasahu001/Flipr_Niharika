package com.hibernate.ecommerce1.controller;

import com.hibernate.ecommerce1.dao.UserDAO;
import com.hibernate.ecommerce1.entities.User;
import com.hibernate.ecommerce1.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

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
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            //Authenticating user
            UserDAO userDao = new UserDAO(FactoryProvider.getFactory());
            User user = userDao.getUser(email, password);
            System.out.println(user);
            HttpSession httpsession = request.getSession();
            
            if(user == null)
            {
                out.println("<h1>Invalid email or password</h1>");
                httpsession.setAttribute("message", "Invalid Details !! Try with another one");
                response.sendRedirect("login.jsp");
                return;
                
            }
            else
            {
                out.println("<h1>Welcome "+user.getUserName()+"</h1>");
                
                //login
                httpsession.setAttribute("current-user", user);
                
                
                if(user.getUserType().equals("admin"))
                {
                    //admin: admin.jsp
                    response.sendRedirect("admin.jsp");
                }  
                else if(user.getUserType().equals("normal"))
                {
                    //normal: normal.jsp
                    response.sendRedirect("normal.jsp");
                }
                else
                {
                    out.println("We have not identified the type of user!!!");
                }
                
            }
            
            
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
        processRequest(request, response);
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
