<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@ page import="java.util.Objects"
%>

<html lang="es">
<head>
     <!-- Para usar la hoja de estilos de  Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css" /> <!--Estilos de CSS-->
    <title>Practicas Mayo</title>
</head>
<body>
    <div class="container">
        <h2 id="titulo" class="titulo">PRACTICAS MAYO</h2>
        <div class="welcome">
                <h2>Aqui podrás gestionar clientes, proveedores y productos de la empresa.</h2>
        </div>
        <div class="list">
        <div class="supllier">
            <div class="supplier-tittle">
                <h1>SUPPLIER</h1>
            </div>
            <a href="/practicas/showsuppliers.jsp" class="btn btn-outline-warning"><h2>Listado de Proveedores</h2></a>
            <a href="/practicas/searchsupplier.jsp" class="btn btn-outline-warning"><h2>Buscar Proveedores</h2></a>
            <a href="/practicas/addsupplier.jsp" class="btn btn-outline-warning"><h2>Añadir Proveedor</h2></a>

        <br/>
        </div>
    <div class="product">
        <div class="product-tittle">
            <h1>PRODUCT</h1>
        </div>
        <a href="/practicas/showproducts.jsp" class="btn btn-outline-success"><h2>Listado de Productos</h2></a>
        <a href="/practicas/searchproduct.jsp" class="btn btn-outline-success"><h2>Buscar Productos</h2></a>
        <a href="/practicas/addproduct.jsp" class="btn btn-outline-success"><h2>Añadir un Producto</h2></a>
    </div>
        </div>

</body>
</html>
