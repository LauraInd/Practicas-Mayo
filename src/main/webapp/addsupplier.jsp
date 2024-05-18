<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"

%>
<%@ page import="com.sanvalero.domain.Supplier" %>
<%@ page import="com.sanvalero.dao.Database" %>
<%@ page import="com.sanvalero.dao.SupplierDao" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.sql.SQLException" %>

<%
    String textBouton = "";
    String supplierId = request.getParameter("id");
    Supplier supplier = null;
    if (supplierId != null) {
        textBouton = "Modificar";
        Database database = new Database();
        SupplierDao supplierDao = new SupplierDao(database.getConnection());
        try {
            Optional<Supplier> optionalSupllier = supplierDao.findById(Integer.parseInt(supplierId)); //recuperar un cliente con determinado DNI
            supplier = optionalSupllier.get();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    } else {
        textBouton = "Registrar";
    }

%>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- libreria de ajax es como una libreria de js con cosas ya hechas -->
    <link rel="stylesheet" href="css/style.css" /> <!--Estilos de CSS-->
    <title>Añadir proveedor</title>
</head>
<body>
    <script type="text/javascript">
        $(document).ready(function () {
            $("form").on("submit", function (event) {
                event.preventDefault();
                var formValue = $(this).serialize();
                $.post("add-modify-supplier", formValue, function (data) { <!-- servlet que recibe todos los datos del formulario -->
                    $("#result").html(data); <!-- Lo usamos para enviar la respuesta al div en la misma página -->
                });
            });
        });
    </script>

    <div class="container">
        <div class="supplier-tittle">
            <h1>Añadir Proveedor</h1>
        </div>

        <div class="alert alert-secondary" role="alert">
            Todos los campos son obligatórios. Si el proveedor ya existe lo puedes modificar.
        </div>
        <form>
            <div class="mb-2">
                <label for="nombre" class="form-label" style="font-size: 1.5rem">Nombre</label>
                <input name="nombre" type="text" class="form-control w-25" id="nombre" value="<% if (supplier != null) out.print(supplier.getName()); %>" required>
                <!-- input name es lo importante para poder coger las variables con java -->
            </div>
            <div class="mb-2">
                <label for="cif" class="form-label" style="font-size: 1.5rem">CIF</label>
                <input name="cif" type="text" class="form-control w-25" id="cif" value="<% if (supplier != null) out.print(supplier.getCif()); %>" required>
            </div>
            <div class="mb-2">
                <label for="telefono" class="form-label" style="font-size: 1.5rem">Telefono</label>
                <input name="telefono" type="text" class="form-control w-25" id="telefono" value="<% if (supplier != null) out.print(supplier.getPhone()); %>" required>
            </div>
            <div class="mb-2">
                <label for="email" class="form-label" style="font-size: 1.5rem">Correo Electrónico</label>
                <input type="email" name="email" type="text" class="form-control is-invalid w-25" id="email" placeholder="name@example.com" value="<% if (supplier != null) out.print(supplier.getEmail()); %>" required>
            </div>

            <input type="hidden" name="action"<% if (supplier != null) out.print("modify"); else out.print("register"); %>">
            <input type="hidden" name="supplierId" value="<% if (supplier != null) out.print(supplier.getId()); %>"> <!--campo oculto. Enviar valor definido internamente-->
            <button type="submit" class="btn btn-success" style="font-size: 1.5rem"><%= textBouton %></button>
        </form>
        <div id="result"></div>
        <a href="index.jsp" class="btn btn-primary">Menú Principal</a>

    </div>
</body>
</html>