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
    <title>Cadastrar Pedido - ShopBase</title>
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body class="bg-light">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h1 class="h4 mb-0"><i class="bi bi-cart-plus"></i> Cadastrar Novo Pedido</h1>
                    </div>
                    <div class="card-body">
                        <%
                            ClienteDAO clienteDAO = new ClienteDAO();
                            List<Cliente> clientes = clienteDAO.consultar();
                        %>

                        <form action="../Cadastrar/CadastrarPedido.jsp" method="post" class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label for="clienteId" class="form-label">Cliente:</label>
                                <select class="form-select" name="clienteId" id="clienteId" required>
                                    <option value="">-- Selecione um cliente --</option>
                                    <% 
                                        if (clientes != null) {
                                            for (Cliente c : clientes) {
                                    %>
                                        <option value="<%= c.getId() %>"><%= c.getNome() %></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                                <div class="invalid-feedback">
                                    Por favor, selecione um cliente.
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="data" class="form-label">Data do Pedido:</label>
                                <input type="date" class="form-control" name="data" id="data" required>
                                <div class="invalid-feedback">
                                    Informe a data do pedido.
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="total" class="form-label">Total (R$):</label>
                                <input type="number" step="0.01" class="form-control" name="total" id="total" required min="0">
                                <div class="invalid-feedback">
                                    Informe um valor válido para o total.
                                </div>
                            </div>

                            <div class="d-flex justify-content-between align-items-center mt-4">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-save"></i> Salvar Pedido
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Bootstrap form validation script
        (() => {
            'use strict'
            const forms = document.querySelectorAll('.needs-validation')
            Array.from(forms).forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
        })()
    </script>
</body>
</html>
