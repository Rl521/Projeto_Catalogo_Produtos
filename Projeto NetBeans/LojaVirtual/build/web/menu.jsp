<%-- 
    Author     : Raul dos Santos Souza
    RGM:       : 11232100173
    Author     : Eduardo Silva Brito 
    RGM:       : 11241405075
    Author     : Matheus Oliveira Manfredo
    RGM:       : 11232101613
    Author     : Leandro Antônio Muraro
    RGM:       : 11241403288
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menu</title>
    <!-- Bootstrap 5.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            overflow: hidden;
        }
        .navbar-brand img {
            height: 40px;
            max-height: 100%;
            object-fit: contain;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary px-3">
        <a class="navbar-brand d-flex align-items-center" href="views/BemVindo.jsp" target="mainFrame">
            <img src="img/shopbase-logo.png" alt="ShopBase Logo">
        </a>

        <div class="navbar-nav">
            <a class="nav-link" href="views/Produtos.jsp" target="mainFrame">Produtos</a>
            <a class="nav-link" href="views/Categorias.jsp" target="mainFrame">Categorias</a>
            <a class="nav-link" href="views/Fornecedores.jsp" target="mainFrame">Fornecedores</a>
            <a class="nav-link" href="views/Clientes.jsp" target="mainFrame">Clientes</a>
            <a class="nav-link" href="views/Pedidos.jsp" target="mainFrame">Pedidos</a>
        </div>
    </nav>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
