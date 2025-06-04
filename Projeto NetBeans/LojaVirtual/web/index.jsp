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
    <title>ShopBase</title>
    <!-- Bootstrap 5.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
        }
        frameset {
            border: none;
        }
    </style>
</head>

<frameset rows="70,*" frameborder="0" border="0" framespacing="0">
    <!-- Menu superior -->
    <frame name="topFrame" scrolling="no" noresize src="menu.jsp">

    <!-- Conteudo inicial -->
    <frame name="mainFrame" src="views/BemVindo.jsp">

    <!-- Mensagem para navegadores não suportados -->
    <noframes>
        <body>
            <div class="container mt-5">
                <div class="alert alert-danger">
                    <h4 class="alert-heading">Navegador não compatível</h4>
                    <p>Seu navegador não suporta <strong>frames</strong>
                </div>
            </div>
        </body>
    </noframes>
</frameset>
</html>
