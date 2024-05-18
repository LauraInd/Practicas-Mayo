<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"


%>
<%@ page import="com.sanvalero.dao.Database" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.sanvalero.dao.SupplierDao" %>
<%@ page import="com.sanvalero.domain.Supplier" %>
<%@ page import="com.sanvalero.dao.ProductDao" %>
<%@ page import="com.sanvalero.domain.Product" %>


<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- libreria de ajax es como una libreria de js con cosas ya hechas -->
    <link rel="stylesheet" href="css/style.css" /> <!--Estilos de CSS-->
    <title>Delete product</title>
</head>
<body>
    <script type="text/javascript">
        $(document).ready(function () {
            $("form").on("submit", function (event) {
                event.preventDefault();
                var formValue = $(this).serialize();
                $.post("delete-product", formValue, function (data) { <!-- servlet que recibe todos los datos del formulario -->
                    $("#result").html(data); <!-- Lo usamos para enviar la respuesta al div en la misma página -->
                });
            });
        });
    </script>
    <%
        String productId = request.getParameter("idProduct");
        Database database = new Database();
        ProductDao productDao = new ProductDao((database.getConnection()));
        Product product = null;
        try {
             Optional<Product> optionalSupplier = productDao.findById(Integer.parseInt(productId));
             product = optionalSupplier.get();
    %>
    <div class="container">
        <h2>Delete product</h2>
        <div class="card text-center">
            <div class="card-header">Are you sure you want to delete the product?</div>
            <div class="card-body">
                <a href="delete-product?idProduct=<%= product.getIdProduct() %>" class="btn btn-danger">Yes</a>
                <a href="showproducts.jsp?idProduct<%= product.getIdProduct() %>" class="btn btn-outline-danger">No</a>
            </div>
        </div>
    </div>
        <div id="result"></div>
    </div>
    <%
    } catch (SQLException sqle) {
    %>
    <div class='alert alert-danger' role='alert'>Unable to connect to the database. Verify that all data is correct</div>
    <%
        }
    %>
</body>
</html>