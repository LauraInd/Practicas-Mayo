<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"

         import="com.sanvalero.dao.Database"
         import="java.util.List"
         import="java.sql.SQLException"
%>
<%@ page import="com.sanvalero.dao.SupplierDao" %>
<%@ page import="com.sanvalero.domain.Supplier" %>

<html lang="es">
<head>
    <!-- Para usar la hoja de estilos de  Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css" /> <!--Estilos de CSS-->
    <title>Listado de proveedores</title>
</head>
<body>
    <div class="container">
        <div class="supplier-tittle">
            <h1>Listado de proveedores</h1>
        </div>
        <div class="alert alert-secondary" role="alert">
            Selecciona el proveedor que quieres consultar.
        </div>
            <ul class="list-group">
                <%
                    // Acceder a la base de datos y recuperar la información de los clientes
                    Database database = new Database();
                    SupplierDao supplierDao = new SupplierDao(database.getConnection());
                    try {
                        List<Supplier> suppliers = supplierDao.findAll();
                        for (Supplier supplier : suppliers) {
                %>
                            <li class="list-group-item">
                                <a target="_blank" href="supplier.jsp?id=<%= supplier.getId() %>"><%= supplier.getName() %></a>
                            </li>
                <%
                    }
                } catch (SQLException sqle) {

                %>
                <div class="alert alert-danger" role="alert">
                    <h6>Error de conexión con la base da datos.</h6>
                </div>
                <%
                        sqle.printStackTrace();
                    }
                %>
            </ul>
        <div class="button">
        <a href="index.jsp" class="btn btn-primary">Menú Principal</a>
        </div>
    </div>
</body>
</html>
