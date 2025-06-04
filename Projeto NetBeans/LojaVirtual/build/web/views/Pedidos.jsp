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
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="dao.PedidoDAO" %>
<%@ page import="model.Pedido" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pedidos - ShopBase</title>
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Pedidos</h2>
        <div>
            <a href="../formularios/FormularioPedido.jsp" class="btn btn-primary me-2">Novo Pedido</a>
        </div>
    </div>

    <%
        PedidoDAO pedidoDAO = new PedidoDAO();
        List<Pedido> lista = pedidoDAO.consultar();

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));

        if (lista != null && !lista.isEmpty()) {
            for (Pedido pedido : lista) {
    %>
    <div class="card mb-3">
        <div class="card-body">
            <div class="row">
                <div class="col-md-4">
                    <p class="card-text"><strong>ID:</strong> <%= pedido.getId() %></p>
                    <p class="card-text">
                        <strong>Cliente:</strong> <%= pedido.getCliente() != null ? pedido.getCliente().getNome() : "Não informado" %>
                    </p>
                </div>
                <div class="col-md-4">
                    <p class="card-text">
                        <strong>Data:</strong> <%= pedido.getData() != null ? sdf.format(pedido.getData()) : "Não informada" %>
                    </p>
                </div>
                <div class="col-md-4">
                    <p class="card-text"><strong>Total:</strong> <span class="text-success"><%= nf.format(pedido.getTotal()) %></span></p>
                </div>
            </div>
            
            <div class="d-flex gap-2 mt-3">
                <form action="../Atualizar/AtualizarPedido.jsp" method="get">
                    <input type="hidden" name="id" value="<%= pedido.getId() %>">
                    <button type="submit" class="btn btn-sm btn-outline-primary">Editar</button>
                </form>
                
                <form action="../Excluir/ExcluirPedido.jsp" method="post" onsubmit="return confirm('Deseja realmente excluir este pedido?');">
                    <input type="hidden" name="id" value="<%= pedido.getId() %>">
                    <button type="submit" class="btn btn-sm btn-outline-danger">Excluir</button>
                </form>
            </div>
        </div>
    </div>
    <%
            }
        } else {
    %>
    <div class="alert alert-info">Nenhum pedido cadastrado.</div>
    <%
        }
    %>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>