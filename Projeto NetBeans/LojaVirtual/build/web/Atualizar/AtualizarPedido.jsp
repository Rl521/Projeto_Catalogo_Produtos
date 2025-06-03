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
<%@page import="java.util.*"%>
<%@page import="dao.PedidoDAO"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="model.Pedido"%>
<%@page import="model.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    PedidoDAO dao = new PedidoDAO();
    ClienteDAO clienteDao = new ClienteDAO();

    String metodo = request.getMethod();

    if ("POST".equalsIgnoreCase(metodo)) {
        int id = Integer.parseInt(request.getParameter("id"));
        int clienteId = Integer.parseInt(request.getParameter("clienteId"));
        double total = Double.parseDouble(request.getParameter("total"));
        java.sql.Date data = java.sql.Date.valueOf(request.getParameter("data"));

        Pedido pedido = new Pedido();
        pedido.setId(id);
        pedido.setCliente(clienteDao.buscarPorId(clienteId));
        pedido.setData(data);
        pedido.setTotal(total);

        boolean sucesso = dao.atualizar(pedido);
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Atualização - ShopBase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card shadow-sm mx-auto text-center" style="max-width: 500px;">
        <div class="card-body">
            <h1 class="mb-4 text-primary">Atualização de Pedido</h1>
            <div class="alert <%= sucesso ? "alert-success" : "alert-danger" %>">
                <%= sucesso ? "Pedido atualizado com sucesso!" : "Erro ao atualizar o pedido." %>
            </div>
            <a href="../views/Pedidos.jsp" class="btn btn-primary">Voltar</a>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%
    } else {
        int id = Integer.parseInt(request.getParameter("id"));
        Pedido pedido = dao.consultarPorId(id);
        List<Cliente> clientes = clienteDao.consultar();

        if (pedido == null) {
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Pedido Não Encontrado - ShopBase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light text-center py-5">
<div class="container">
    <div class="card shadow-sm mx-auto" style="max-width: 500px;">
        <div class="card-body">
            <h1 class="mb-4 text-primary">Atualização de Pedido</h1>
            <div class="alert alert-warning">Pedido não encontrado.</div>
            <a href="../views/Pedidos.jsp" class="btn btn-secondary">Voltar</a>
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
    <title>Editar Pedido - ShopBase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card shadow-sm mx-auto p-4" style="max-width: 500px;">
        <h1 class="text-center text-primary mb-4">Editar Pedido</h1>
        <form action="AtualizarPedido.jsp" method="post">
            <input type="hidden" name="id" value="<%= pedido.getId() %>">

            <div class="mb-3">
                <label for="clienteId" class="form-label fw-bold">Cliente:</label>
                <select class="form-select" name="clienteId" id="clienteId" required>
                    <% for (Cliente c : clientes) { %>
                        <option value="<%= c.getId() %>" <%= (c.getId() == pedido.getCliente().getId()) ? "selected" : "" %>>
                            <%= c.getNome() %>
                        </option>
                    <% } %>
                </select>
            </div>

            <div class="mb-3">
                <label for="data" class="form-label fw-bold">Data:</label>
                <input type="date" class="form-control" name="data" id="data"
                    value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(pedido.getData()) %>" required>
            </div>

            <div class="mb-3">
                <label for="total" class="form-label fw-bold">Total:</label>
                <input type="number" step="0.01" min="0" class="form-control" name="total" id="total"
                    value="<%= pedido.getTotal() %>" required>
            </div>

            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-primary fw-bold">Salvar Alterações</button>
                <a href="../views/Pedidos.jsp" class="btn btn-secondary fw-bold">Cancelar</a>
            </div>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%
        }
    }
%>