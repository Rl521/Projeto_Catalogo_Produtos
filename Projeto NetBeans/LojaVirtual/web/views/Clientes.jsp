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
<%@page import="dao.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Clientes - ShopBase</title>
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Clientes</h2>
        <div>
            <a href="../Cadastrar/CadastrarCliente.html" class="btn btn-primary me-2">Novo Cliente</a>
        </div>
    </div>

    <%
        ClienteDAO clienteDAO = new ClienteDAO();
        List<Cliente> lista = clienteDAO.consultar();

        if (lista != null && !lista.isEmpty()) {
            for (Cliente cliente : lista) {
    %>
    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title"><%= cliente.getNome() %></h5>
            <div class="row">
                <div class="col-md-6">
                    <p class="card-text"><strong>ID:</strong> <%= cliente.getId() %></p>
                    <p class="card-text"><strong>Email:</strong> <%= cliente.getEmail() %></p>
                </div>
                <div class="col-md-6">
                    <p class="card-text"><strong>Telefone:</strong> <%= cliente.getTelefone() %></p>
                </div>
            </div>
            
            <div class="d-flex gap-2 mt-3">
                <form action="../Atualizar/AtualizarCliente.jsp" method="get">
                    <input type="hidden" name="id" value="<%= cliente.getId() %>">
                    <button type="submit" class="btn btn-sm btn-outline-primary">Editar</button>
                </form>
                
                <form action="../Excluir/ExcluirCliente.jsp" method="post" onsubmit="return confirm('Deseja realmente excluir este cliente?');">
                    <input type="hidden" name="id" value="<%= cliente.getId() %>">
                    <button type="submit" class="btn btn-sm btn-outline-danger">Excluir</button>
                </form>
            </div>
        </div>
    </div>
    <%
            }
        } else {
    %>
    <div class="alert alert-info">Nenhum cliente cadastrado.</div>
    <%
        }
    %>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>