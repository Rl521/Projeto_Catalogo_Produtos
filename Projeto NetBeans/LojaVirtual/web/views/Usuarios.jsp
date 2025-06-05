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
<%@page import="java.util.List"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("usuarioLogado") == null) {
%>
    <script>
        window.top.location.href = "Login.jsp";
    </script>
<%
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Usuários - ShopBase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Usuários</h2>
        <form method="post" style="margin:0;">
            <button type="submit" name="logout" class="btn btn-outline-danger">Sair</button>
        </form>
    </div>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("logout") != null) {
            session.invalidate();
    %>
        <script>
            window.top.location.href = "Login.jsp";
        </script>
    <%
            return;
        }
    %>

    <%
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        List<Usuario> lista = usuarioDAO.consultar();

        if (lista != null && !lista.isEmpty()) {
            for (Usuario usuario : lista) {
    %>
    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title"><%= usuario.getNome() %></h5>
            <div class="row">
                <div class="col-md-6">
                    <p class="card-text"><strong>ID:</strong> <%= usuario.getId() %></p>
                    <p class="card-text"><strong>Email:</strong> <%= usuario.getEmail() %></p>
                </div>
            </div>
            <div class="d-flex gap-2 mt-3">
                <form action="../Atualizar/AtualizarUsuario.jsp" method="get">
                    <input type="hidden" name="id" value="<%= usuario.getId() %>">
                    <button type="submit" class="btn btn-sm btn-outline-primary">Editar</button>
                </form>
                <form action="../Excluir/ExcluirUsuario.jsp" method="post" onsubmit="return confirm('Deseja realmente excluir este usuário?');">
                    <input type="hidden" name="id" value="<%= usuario.getId() %>">
                    <button type="submit" class="btn btn-sm btn-outline-danger">Excluir</button>
                </form>
            </div>
        </div>
    </div>
    <%
            }
        } else {
    %>
    <div class="alert alert-info">Nenhum usuário cadastrado.</div>
    <%
        }
    %>
</body>
</html>