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
<%@page import="dao.PedidoDAO"%>
<%@page import="model.Pedido"%>
<%@page import="model.Cliente"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Pedido - ShopBase</title>
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body class="bg-light">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h1 class="h4 mb-0">Cadastro de Pedido</h1>
                    </div>
                    <div class="card-body">
                        <%
                            String mensagem = "";
                            String alertType = "success";
                            try {
                                int clienteId = Integer.parseInt(request.getParameter("clienteId"));
                                String dataStr = request.getParameter("data");
                                double total = Double.parseDouble(request.getParameter("total"));

                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                Date data = sdf.parse(dataStr);

                                Cliente cliente = new Cliente();
                                cliente.setId(clienteId);

                                Pedido pedido = new Pedido();
                                pedido.setCliente(cliente);
                                pedido.setData(data);
                                pedido.setTotal(total);

                                PedidoDAO dao = new PedidoDAO();
                                if (dao.inserir(pedido)) {
                                    mensagem = "Pedido cadastrado com sucesso!";
                                } else {
                                    mensagem = "Não foi possível cadastrar o pedido.";
                                    alertType = "danger";
                                }
                            } catch (Exception e) {
                                mensagem = "Erro no processamento: " + e.getMessage();
                                alertType = "danger";
                            }
                        %>
                        
                        <div class="alert alert-<%= alertType %>">
                            <h4 class="alert-heading"><%= alertType.equals("success") ? "Sucesso!" : "Erro!" %></h4>
                            <p><%= mensagem %></p>
                            <hr>
                            <% if (alertType.equals("success")) { %>
                            <div class="mb-2"><strong>ID Cliente:</strong> <%= request.getParameter("clienteId") %></div>
                            <div class="mb-2"><strong>Data:</strong> <%= request.getParameter("data") %></div>
                            <div><strong>Total:</strong> R$ <%= String.format("%.2f", Double.parseDouble(request.getParameter("total"))) %></div>
                            <% } %>
                        </div>
                        
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                            <a href="../formularios/FormularioPedido.jsp" class="btn btn-primary me-md-2">
                                <i class="bi bi-cart-plus"></i> Novo Pedido
                            </a>
                            <a href="../views/Pedidos.jsp" class="btn btn-outline-secondary">
                                <i class="bi bi-list-ul"></i> Lista de Pedidos
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>