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
    request.setCharacterEncoding("UTF-8");
    UsuarioDAO dao = new UsuarioDAO();
    String metodo = request.getMethod();

    if ("POST".equalsIgnoreCase(metodo)) {
        int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");

        Usuario usuario = new Usuario();
        usuario.setId(id);
        usuario.setNome(nome);
        usuario.setEmail(email);

        boolean sucesso = dao.atualizar(usuario);
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Atualização - ShopBase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card shadow-sm mx-auto text-center" style="max-width: 540px;">
        <div class="card-body">
            <h1 class="mb-4 text-primary">Atualização de Usuário</h1>
            <div class="alert <%= sucesso ? "alert-success" : "alert-danger" %>" role="alert">
                <%= sucesso ? "Usuário atualizado com sucesso!" : "Erro ao atualizar o usuário." %>
            </div>
            <a href="../views/Usuarios.jsp" class="btn btn-primary mt-3">Voltar</a>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%
    } else {
        Usuario usuario = null;
        int id = -1;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (Exception e) {
            id = -1;
        }

        if (id == -1) {
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>ID Inválido - ShopBase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light text-center py-5">
    <div class="alert alert-warning w-50 mx-auto">ID inválido.</div>
    <a href="../views/Usuarios.jsp" class="btn btn-secondary">Voltar</a>
</body>
</html>
<%
        } else {
            List<Usuario> lista = dao.consultar();
            if (lista != null) {
                for (Usuario u : lista) {
                    if (u.getId() == id) {
                        usuario = u;
                        break;
                    }
                }
            }

            if (usuario == null) {
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Usuário Não Encontrado - ShopBase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light text-center py-5">
    <div class="alert alert-danger w-50 mx-auto">Usuário não encontrado.</div>
    <a href="../views/Usuarios.jsp" class="btn btn-secondary">Voltar</a>
</body>
</html>
<%
            } else {
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Editar Usuário - ShopBase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card shadow-sm mx-auto" style="max-width: 540px;">
        <div class="card-body">
            <h1 class="mb-4 text-primary text-center">Editar Usuário</h1>
            <form action="AtualizarUsuario.jsp" method="post" novalidate>
                <input type="hidden" name="id" value="<%= usuario.getId() %>">

                <div class="mb-3">
                    <label for="nome" class="form-label fw-bold">Nome:</label>
                    <input type="text" class="form-control" id="nome" name="nome" value="<%= usuario.getNome() %>" required>
                    <div class="invalid-feedback">Por favor, preencha o nome.</div>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label fw-bold">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= usuario.getEmail() %>" required>
                    <div class="invalid-feedback">Por favor, preencha o e-mail.</div>
                </div>

                <div class="d-flex justify-content-between">
                    <button type="submit" class="btn btn-primary">Salvar Alterações</button>
                    <a href="../views/Usuarios.jsp" class="btn btn-secondary">Cancelar</a>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
(() => {
    'use strict';
    const forms = document.querySelectorAll('form');
    Array.from(forms).forEach(form => {
        form.addEventListener('submit', event => {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    });
})();
</script>
</body>
</html>
<%
            }
        }
    }
%>