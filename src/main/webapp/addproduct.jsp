<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"


%>
<%@ page import="com.sanvalero.dao.SupplierDao" %>
<%@ page import="com.sanvalero.dao.Database" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.sanvalero.domain.Supplier" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.sql.SQLException" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- libreria de ajax es como una libreria de js con cosas ya hechas -->
    <link rel="stylesheet" href="css/style.css" /> <!--Estilos de CSS-->
    <title>Add product</title>
</head>
<body>
    <script type="text/javascript">
        $(document).ready(function () {
            $("form").on("submit", function (event) {
                event.preventDefault();
                var formValue = $(this).serialize();
                $.post("add-product", formValue, function (data) { <!-- servlet que recibe todos los datos del formulario -->
                    $("#result").html(data); <!-- Lo usamos para enviar la respuesta al div en la misma página -->
                });
            });
        });
    </script>

    <div class="container">
        <div class="product-tittle">
            <h1>Add product</h1>
        </div>
        <div class="alert alert-secondary" role="alert">
            All fields are mandatory
        </div>

        <form>
            <div class="mb-2">
                <label for="nombre" class="form-label" style="font-size: 1.5rem">Name of the product</label>
                <input name="nombre" type="text" class="form-control w-25" id="nombre" required>
                <!-- input name es lo importante para poder coger las variables con java -->
            </div>
            <div class="mb-3">
                <label for="precio" class="form-label" style="font-size: 1.5rem">Price</label>
                <input name="precio" type="text" class="form-control w-25" id="precio" required>
            </div>
            <div class="mb-2">
                <label for="stock" class="form-label" style="font-size: 1.5rem">Stock</label>
                <input name="stock" type="text" class="form-control w-25" id="stock" required>
            </div>
            <%
                Database database = new Database();
                Connection connection = database.getConnection();
            %>
            <div class="form-label">
                <label for="idProveedor" style="font-size: 1.5rem">Supplier</label>
                <select class="form-control w-25" id="idProveedor" name="idProveedor" required>
                    <option>Select supplier</option>
                    <%
                        SupplierDao supplierDao = new SupplierDao(database.getConnection());
                        ArrayList<Supplier> suppliers = supplierDao.findAll();
                        for (Supplier supplier : suppliers) {
                            out.println("<option value=\"" + supplier.getId() + "\">" + supplier.getName() + "</option>");
                        }
                    %>
                </select>
            </div>
            <button type="submit" class="btn btn-success" style="font-size: 1.5rem">Register</button>
        </form>
        <div id="result"></div>
        <a href="index.jsp" class="btn btn-primary">Main menu</a>
    </div>

</body>
</html>