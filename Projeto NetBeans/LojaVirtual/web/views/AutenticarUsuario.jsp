<%@page import="dao.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");

    UsuarioDAO usuarioDAO = new UsuarioDAO();
    Usuario usuario = usuarioDAO.autenticar(email, senha);

    if (usuario != null) {
        session.setAttribute("usuarioLogado", usuario);
        response.sendRedirect("../index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - ShopBase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container d-flex align-items-center justify-content-center" style="min-height: 100vh;">
        <div class="card shadow-sm p-4" style="max-width: 400px; width: 100%;">
            <div class="alert alert-danger text-center mb-4">
                <h4 class="alert-heading">E-mail ou senha inválidos!</h4>
            </div>
            <a href="Login.jsp" class="btn btn-primary w-100">Tentar Novamente</a>
        </div>
    </div>
</body>
</html>