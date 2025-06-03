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
<%@page import="dao.FornecedorDAO"%>
<%@page import="model.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    FornecedorDAO dao = new FornecedorDAO();

    String metodo = request.getMethod();

    if ("POST".equalsIgnoreCase(metodo)) {
        int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String email = request.getParameter("email");

        Fornecedor fornecedor = new Fornecedor();
        fornecedor.setId(id);
        fornecedor.setNome(nome);
        fornecedor.setTelefone(telefone);
        fornecedor.setEmail(email);

        boolean sucesso = dao.atualizar(fornecedor);
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
    <div class="card shadow-sm mx-auto" style="max-width: 540px;">
        <div class="card-body text-center">
            <h1 class="mb-4 text-primary">Atualização de Fornecedor</h1>
            <% if (sucesso) { %>
                <div class="alert alert-success" role="alert">
                    Fornecedor atualizado com sucesso!
                </div>
            <% } else { %>
                <div class="alert alert-danger" role="alert">
                    Erro ao atualizar o fornecedor.
                </div>
            <% } %>
            <a href="../views/Fornecedores.jsp" class="btn btn-primary mt-3">Voltar</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%
    } else {
        int id = Integer.parseInt(request.getParameter("id"));
        Fornecedor fornecedor = null;

        List<Fornecedor> lista = dao.consultar();
        if (lista != null) {
            for (Fornecedor f : lista) {
                if (f.getId() == id) {
                    fornecedor = f;
                    break;
                }
            }
        }

        if (fornecedor == null) {
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Fornecedor Não Encontrado - ShopBase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="card shadow-sm mx-auto text-center" style="max-width: 540px;">
        <div class="card-body">
            <h1 class="mb-4 text-primary">Atualização de Fornecedor</h1>
            <div class="alert alert-warning">
                Fornecedor não encontrado.
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%
        } else {
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Editar Fornecedor - ShopBase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="card shadow-sm mx-auto" style="max-width: 540px;">
        <div class="card-body">
            <h1 class="mb-4 text-primary text-center">Editar Fornecedor</h1>
            <form action="AtualizarFornecedor.jsp" method="post" novalidate>
                <input type="hidden" name="id" value="<%= fornecedor.getId() %>">

                <div class="mb-3">
                    <label for="nome" class="form-label fw-bold">Nome:</label>
                    <input type="text" class="form-control" id="nome" name="nome" value="<%= fornecedor.getNome() %>" required>
                </div>

                <div class="mb-3">
                    <label for="telefone" class="form-label fw-bold">Telefone:</label>
                    <input type="text" class="form-control" id="telefone" name="telefone" value="<%= fornecedor.getTelefone() %>" required>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label fw-bold">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= fornecedor.getEmail() %>" required>
                </div>

                <button type="submit" class="btn btn-primary">Salvar Alterações</button>
                <a href="../views/Fornecedores.jsp" class="btn btn-secondary ms-2">Cancelar</a>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%
        }
    }
%>
