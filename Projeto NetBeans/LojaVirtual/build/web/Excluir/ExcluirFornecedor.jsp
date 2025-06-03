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
<%@page import="dao.FornecedorDAO"%>
<%@page import="model.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    FornecedorDAO dao = new FornecedorDAO();

    boolean metodoPost = "POST".equalsIgnoreCase(request.getMethod());
    boolean sucesso = false;
    if (metodoPost) {
        int id = Integer.parseInt(request.getParameter("id"));
        Fornecedor fornecedor = new Fornecedor();
        fornecedor.setId(id);
        sucesso = dao.excluir(fornecedor);
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Excluir Fornecedor - ShopBase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light py-5">
<div class="container">
    <div class="card shadow-sm mx-auto text-center" style="max-width: 500px;">
        <div class="card-body">
            <h1 class="text-primary mb-4">Excluir Fornecedor</h1>
            <% if (metodoPost) { %>
                <div class="alert <%= sucesso ? "alert-success" : "alert-danger" %>" role="alert">
                    <%= sucesso ? "Fornecedor excluído com sucesso!" : "Erro ao excluir o fornecedor." %>
                </div>
            <% } else { %>
                <div class="alert alert-warning" role="alert">
                    Este método HTTP não é permitido para esta operação.
                </div>
            <% } %>
            <a href="../views/Fornecedores.jsp" class="btn btn-primary mt-3">Voltar</a>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>