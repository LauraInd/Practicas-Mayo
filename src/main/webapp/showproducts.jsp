<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"

         import="com.sanvalero.dao.Database"
         import="java.util.List"
         import="java.sql.SQLException"
%>
<%@ page import="com.sanvalero.dao.ProductDao" %>
<%@ page import="com.sanvalero.domain.Product" %>

<html lang="es">
<head>
    <!-- Para usar la hoja de estilos de  Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css" /> <!--Estilos de CSS-->
    <title>Show Products</title>
</head>
<body>
    <div class="container">
        <div class="product-tittle">
            <h1>Show Products</h1>
        </div>
        <div class="alert alert-secondary" role="alert">
            Select the product you want to view.
        </div>
            <ul class="list-group">
                <%
                    // Acceder a la base de datos y recuperar la información de los clientes
                    Database database = new Database();
                    ProductDao productDao = new ProductDao(database.getConnection());
                    try {
                        List<Product> products = productDao.findAllProduct();
                        for (Product product : products) {
                %>
                            <li class="list-group-item">
                            <a target="_blank" href="product.jsp?idProduct=<%= product.getIdProduct() %>"><%= product.getName() %></a>
                            </li>
                <%
                    }
                } catch (SQLException sqle) {

                %>
                <div class="alert alert-danger" role="alert">
                    <h6>Database connection failed</h6>
                </div>
                <%
                        sqle.printStackTrace();
                    }
                %>
            </ul>
        <div class="button">
        <a href="index.jsp" class="btn btn-primary">Main menu</a>
        </div>

    </div>
</body>
</html>
