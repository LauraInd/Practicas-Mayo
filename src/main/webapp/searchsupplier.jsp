<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
%>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="css/style.css" /> <!--Estilos de CSS-->
    <title>Buscar Proveedor</title>
</head>
<body>
    <script type="text/javascript">
        $(document).ready(function() {
            $("form").on("submit", function(event) {
                event.preventDefault();
                var formValue = $(this).serialize();
                $.post("search-suppliers", formValue, function(data) {
                    $("#result").html(data);
                });
            });
        });
    </script>
    <div class="container">
        <div class="supplier-tittle">
            <h1>Buscar proveedores de productos</h1>
        </div>
        <div class="alert alert-secondary" role="alert">
            Puedes buscar um proveedor por nombre, CIF, telefono o e-mail.
        </div>
        <form>
            <div class="mb-2">
                <label for="searchtext" class="form-label" style="font-size: 1.5rem">Texto</label>
                <input name="searchtext" type="text" class="form-control w-25" id="searchtext">
            </div>
            <button type="submit" class="btn btn-success" style="font-size: 1.5rem">Buscar</button>
        </form>
        <div id="result"></div>
        <a href="index.jsp" class="btn btn-primary">Menú Principal</a>
    </div>
</body>
</html>