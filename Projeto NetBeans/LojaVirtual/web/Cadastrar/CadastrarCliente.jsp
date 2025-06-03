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
<%@page import="dao.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Cliente - ShopBase</title>
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h1 class="h4 mb-0">Cadastro de Cliente</h1>
                    </div>
                    <div class="card-body">
                        <%
                            Cliente cliente = new Cliente();
                            cliente.setNome(request.getParameter("nome"));
                            cliente.setEmail(request.getParameter("email"));
                            cliente.setTelefone(request.getParameter("telefone"));
                            
                            ClienteDAO clienteDAO = new ClienteDAO();
                            
                            if (clienteDAO.inserir(cliente)) {
                        %>
                        <div class="alert alert-success">
                            <strong>Cliente cadastrado com sucesso!</strong>
                            <div class="mt-3">
                                <p><strong>Nome:</strong> <%= cliente.getNome() %></p>
                                <p><strong>Email:</strong> <%= cliente.getEmail() %></p>
                                <p><strong>Telefone:</strong> <%= cliente.getTelefone() %></p>
                            </div>
                        </div>
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                            <a href="../Cadastrar/CadastrarCliente.html" class="btn btn-primary me-md-2">Cadastrar outro</a>
                        </div>
                        <%
                            } else {
                        %>
                        <div class="alert alert-danger">
                            <strong>Não foi possível cadastrar o cliente.</strong>
                        </div>
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                            <a href="../Cadastrar/CadastrarCliente.html" class="btn btn-primary me-md-2">Tentar novamente</a>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>