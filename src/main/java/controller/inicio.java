package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "inicio", urlPatterns = { "/inicio" })
public class inicio extends HttpServlet {
    
    
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            request.getRequestDispatcher("admin/indexAdmin.jsp").forward(request, response);
        }
    
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            doGet(request, response);
            request.getRequestDispatcher("admin/indexAdmin.jsp").forward(request, response);
            
        }
    



}