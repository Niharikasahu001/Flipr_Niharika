package com.hibernate.ecommerce1.controller;

import com.hibernate.ecommerce1.dao.CategoryDao;
import com.hibernate.ecommerce1.dao.ProductDao;
import com.hibernate.ecommerce1.entities.Category;
import com.hibernate.ecommerce1.entities.Product;
import com.hibernate.ecommerce1.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String op = request.getParameter("operation");

            if (op.trim().equals("addcategory")) {
                //add product
                //fetching category data
                String title = request.getParameter("cattitle");
                String description = request.getParameter("catdes");

                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);

                //category database save:
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);
                System.out.println("Category Saved!!");

                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Category added Successfully!!" + catId);
                response.sendRedirect("admin.jsp");
                return;

            } else if (op.trim().equals("addproduct")) {
                //add product
                String pName = request.getParameter("ptitle");
                String pDesc = request.getParameter("pdes");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                Part part = request.getPart("pPic");

                Product p = new Product();
                p.setpTitle(pName);
                p.setpDesc(pDesc);
                p.setpPrice(pPrice);
                p.setpQuantity(pQuantity);
                p.setpDiscount(pDiscount);
                p.setcId(catId);
                p.setpPhoto(part.getSubmittedFileName());

                //get Category by id
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                Category category = cdao.getCategoryById(catId);

                p.setCategory(category);

                //Product save.....       
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);

                //pic upload
                String path = request.getRealPath("img") + File.separator + "product" + File.separator + part.getSubmittedFileName();
                System.out.println(path);
                try {

                    //uploading code(must be in a new function)
                    FileOutputStream fos = new FileOutputStream(path);
                    System.out.println("fos");

                    InputStream is = part.getInputStream();
                    System.out.println("is");
                    
                    //reading data
                    byte []data = new byte[is.available()];
                    is.read(data);
                    System.out.println("byte");

                    //writing data
                    fos.write(data);
                    System.out.println("write");

                    fos.close();
                    System.out.println("close");
                    
                }
                catch(IOException e)
                {
                    e.printStackTrace();
                }
                

                //out.println("Product Saved Successfully!!");
                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Product Saved Successfully!!");
                response.sendRedirect("admin.jsp");
                return;

            } else {

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
