<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"

         import="com.sanvalero.dao.Database"

%>
<%@ page import="java.util.Optional" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.sanvalero.domain.Supplier" %>
<%@ page import="com.sanvalero.dao.SupplierDao" %>


<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css" /> <!--Estilos de CSS-->
    <link rel="stylesheet" href="css/style.css" /> <!--Estilos de CSS-->
    <title>Information supplier</title>
</head>
<body>
    <%
        String supplierId = request.getParameter("id");
        Database database = new Database();
        SupplierDao supplierDao = new SupplierDao((database.getConnection()));
        Supplier supplier = null;
        try {
            Optional<Supplier> optionalSupplier = supplierDao.findById(Integer.parseInt(supplierId));
            supplier = optionalSupplier.get();
    %>
    <div class="container">
        <div class="card text-center">
            <div class="card-header-supplier">Information supplier</div>
            <div class="card-body">
                <h5 class="card-title"><%= supplier.getName()%></h5>
                <h6 class="card-subtitle mb-2 text-muted">Telephone: <%= supplier.getPhone() %></h6>
                <h6 class="card-subtitle mb-2 text-muted">NIF: <%= supplier.getCif() %></h6>
                <a href="addsupplier.jsp?id=<%= supplier.getId() %>" class="btn btn-outline-warning">Modify</a>
                <a href="deletesupplier.jsp?id=<%= supplier.getId() %>" class="btn btn-outline-danger">Delete</a>
            </div>
            <a href="showsuppliers.jsp" class="btn btn-primary">Return</a>
        </div>
    </div>
    <%
    } catch (SQLException sqle) {
        %>
        <div class='alert alert-danger' role='alert'>An error has occurred. Try again later.</div>
        <%
            }
        %>
</body>
</html>