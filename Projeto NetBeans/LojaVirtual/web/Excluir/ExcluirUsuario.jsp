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
<%@page import="dao.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    UsuarioDAO dao = new UsuarioDAO();

    boolean metodoPost = "POST".equalsIgnoreCase(request.getMethod());
    boolean sucesso = false;
    boolean usuarioLogadoExcluido = false;

    if (metodoPost) {
        int id = Integer.parseInt(request.getParameter("id"));
        Usuario usuario = new Usuario();
        usuario.setId(id);
        sucesso = dao.excluir(usuario);

        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
        if (usuarioLogado != null && usuarioLogado.getId() == id && sucesso) {
            session.invalidate();
            usuarioLogadoExcluido = true;
        }
    }

    if (usuarioLogadoExcluido) {
%>
    <script>
        window.top.location.href = "../views/Login.jsp";
    </script>
<%
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Excluir Usuário - ShopBase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light py-5">
<div class="container">
    <div class="card shadow-sm mx-auto text-center" style="max-width: 500px;">
        <div class="card-body">
            <h1 class="text-primary mb-4">Excluir Usuário</h1>
            <% if (metodoPost) { %>
                <div class="alert <%= sucesso ? "alert-success" : "alert-danger" %>" role="alert">
                    <%= sucesso ? "Usuário excluído com sucesso!" : "Erro ao excluir o usuário." %>
                </div>
            <% } else { %>
                <div class="alert alert-warning" role="alert">
                    Este método HTTP não é permitido para esta operação.
                </div>
            <% } %>
            <a href="../views/Usuarios.jsp" class="btn btn-primary mt-3">Voltar</a>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>