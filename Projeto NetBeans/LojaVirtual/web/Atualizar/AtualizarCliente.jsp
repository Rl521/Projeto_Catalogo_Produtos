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
<%@page import="java.util.List" %>
<%@page import="dao.ClienteDAO" %>
<%@page import="model.Cliente" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    ClienteDAO dao = new ClienteDAO();
    String metodo = request.getMethod();

    if ("POST".equalsIgnoreCase(metodo)) {
        int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String email = request.getParameter("email");

        Cliente cliente = new Cliente();
        cliente.setId(id);
        cliente.setNome(nome);
        cliente.setTelefone(telefone);
        cliente.setEmail(email);

        boolean sucesso = dao.atualizar(cliente);
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
            <h1 class="mb-4 text-primary">Atualização de Cliente</h1>
            <div class="alert <%= sucesso ? "alert-success" : "alert-danger" %>" role="alert">
                <%= sucesso ? "Cliente atualizado com sucesso!" : "Erro ao atualizar o cliente." %>
            </div>
            <a href="../views/Clientes.jsp" class="btn btn-primary mt-3">Voltar</a>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%
    } else {
        Cliente cliente = null;
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
    <a href="../views/Clientes.jsp" class="btn btn-secondary">Voltar</a>
</body>
</html>
<%
        } else {
            List<Cliente> lista = dao.consultar();
            if (lista != null) {
                for (Cliente c : lista) {
                    if (c.getId() == id) {
                        cliente = c;
                        break;
                    }
                }
            }

            if (cliente == null) {
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cliente Não Encontrado - ShopBase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light text-center py-5">
    <div class="alert alert-danger w-50 mx-auto">Cliente não encontrado.</div>
    <a href="../views/Clientes.jsp" class="btn btn-secondary">Voltar</a>
</body>
</html>
<%
            } else {
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Editar Cliente - ShopBase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card shadow-sm mx-auto" style="max-width: 540px;">
        <div class="card-body">
            <h1 class="mb-4 text-primary text-center">Editar Cliente</h1>
            <form action="AtualizarCliente.jsp" method="post" novalidate>
                <input type="hidden" name="id" value="<%= cliente.getId() %>">

                <div class="mb-3">
                    <label for="nome" class="form-label fw-bold">Nome:</label>
                    <input type="text" class="form-control" id="nome" name="nome" value="<%= cliente.getNome() %>" required>
                </div>

                <div class="mb-3">
                    <label for="telefone" class="form-label fw-bold">Telefone:</label>
                    <input type="text" class="form-control" id="telefone" name="telefone" value="<%= cliente.getTelefone() %>" 
                           pattern="\\(\\d{2}\\) \\d{4,5}-\\d{4}" title="Formato esperado: (11) 99999-9999" required>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label fw-bold">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= cliente.getEmail() %>" required>
                </div>

                <div class="d-flex justify-content-between">
                    <button type="submit" class="btn btn-primary">Salvar Alterações</button>
                    <a href="../views/Clientes.jsp" class="btn btn-secondary">Cancelar</a>
                </div>
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
    }
%>
