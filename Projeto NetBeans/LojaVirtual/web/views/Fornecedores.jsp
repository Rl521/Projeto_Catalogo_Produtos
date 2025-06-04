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
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fornecedores - ShopBase</title>
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Fornecedores</h2>
        <div>
            <a href="../Cadastrar/CadastrarFornecedor.html" class="btn btn-primary me-2">Novo Fornecedor</a>
        </div>
    </div>

    <%
        FornecedorDAO fornecedorDAO = new FornecedorDAO();
        List<Fornecedor> lista = fornecedorDAO.consultar();

        if (lista != null && !lista.isEmpty()) {
            for (Fornecedor fornecedor : lista) {
    %>
    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title"><%= fornecedor.getNome() %></h5>
            <div class="row">
                <div class="col-md-6">
                    <p class="card-text"><strong>ID:</strong> <%= fornecedor.getId() %></p>
                    <p class="card-text"><strong>Email:</strong> <%= fornecedor.getEmail() %></p>
                </div>
                <div class="col-md-6">
                    <p class="card-text"><strong>Telefone:</strong> <%= fornecedor.getTelefone() %></p>
                </div>
            </div>
            
            <div class="d-flex gap-2 mt-3">
                <form action="../Atualizar/AtualizarFornecedor.jsp" method="get">
                    <input type="hidden" name="id" value="<%= fornecedor.getId() %>">
                    <button type="submit" class="btn btn-sm btn-outline-primary">Editar</button>
                </form>
                
                <form action="../Excluir/ExcluirFornecedor.jsp" method="post"
                       onsubmit="return confirm('Deseja realmente excluir este fornecedor?');">
                    <input type="hidden" name="id" value="<%= fornecedor.getId() %>">
                    <button type="submit" class="btn btn-sm btn-outline-danger">Excluir</button>
                </form>
            </div>
        </div>
    </div>
    <%
            }
        } else {
    %>
    <div class="alert alert-info">Nenhum fornecedor cadastrado.</div>
    <%
        }
    %>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>