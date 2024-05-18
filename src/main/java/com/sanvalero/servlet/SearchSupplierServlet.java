package com.sanvalero.servlet;

import com.sanvalero.dao.Database;
import com.sanvalero.dao.SupplierDao;
import com.sanvalero.domain.Supplier;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/search-suppliers")
public class SearchSupplierServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String searchText = request.getParameter("searchtext");

        Database database = new Database();
        SupplierDao supplierDao = new SupplierDao(database.getConnection());
        try {
            ArrayList<Supplier> suppliers = supplierDao.findAllSupplier(searchText);
            StringBuilder result = new StringBuilder("<ul class='list-group");
            for (Supplier supplier : suppliers) {
                result.append("<li class='list-group-item'>").append((supplier.getName())).append("</li>");
            }
            result.append("</ul>");
            out.println(result);
        } catch (SQLException sqle) {
            out.println("<div class='alert alert-danger' role='alert'>No se ha podido conectar con la base de datos. Verifique que todos los datos son correctos.</div>");
            sqle.printStackTrace();
        }
    }
}

