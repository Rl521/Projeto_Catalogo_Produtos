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
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Fornecedor - ShopBase</title>
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h1 class="h4 mb-0">Cadastro de Fornecedor</h1>
                    </div>
                    <div class="card-body">
                        <%
                            Fornecedor fornecedor = new Fornecedor();
                            fornecedor.setNome(request.getParameter("nome"));
                            fornecedor.setTelefone(request.getParameter("telefone"));
                            fornecedor.setEmail(request.getParameter("email"));
                            
                            FornecedorDAO fornecedorDAO = new FornecedorDAO();
                            
                            if (fornecedorDAO.inserir(fornecedor)) {
                        %>
                        <div class="alert alert-success">
                            <h4 class="alert-heading">Fornecedor cadastrado com sucesso!</h4>
                            <hr>
                            <div class="mb-2"><strong>Nome:</strong> <%= fornecedor.getNome() %></div>
                            <div class="mb-2"><strong>Telefone:</strong> <%= fornecedor.getTelefone() %></div>
                            <div><strong>Email:</strong> <%= fornecedor.getEmail() %></div>
                        </div>
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                            <a href="../Cadastrar/CadastrarFornecedor.html" class="btn btn-primary me-md-2">
                                <i class="bi bi-plus-circle"></i> Cadastrar outro
                            </a>
                        </div>
                        <%
                            } else {
                        %>
                        <div class="alert alert-danger">
                            <h4 class="alert-heading">Erro no cadastro!</h4>
                            <p>Não foi possível cadastrar o fornecedor.</p>
                        </div>
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                            <a href="../Cadastrar/CadastrarFornecedor.html" class="btn btn-primary me-md-2">
                                <i class="bi bi-arrow-counterclockwise"></i> Tentar novamente
                            </a>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>