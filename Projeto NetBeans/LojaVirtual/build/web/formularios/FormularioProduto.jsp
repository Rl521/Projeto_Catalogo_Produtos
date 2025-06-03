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
<%@page import="dao.CategoriaDAO"%>
<%@page import="model.Fornecedor"%>
<%@page import="model.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Produto - ShopBase</title>
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        .price-input {
            position: relative;
        }
        .price-input::before {
            content: "R$";
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            z-index: 1;
        }
        .price-input input {
            padding-left: 30px;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h1 class="h4 mb-0"><i class="bi bi-box-seam"></i> Cadastrar Novo Produto</h1>
                    </div>
                    <div class="card-body">
                        <%
                            CategoriaDAO categoriaDAO = new CategoriaDAO();
                            List<Categoria> categorias = categoriaDAO.consultar();

                            FornecedorDAO fornecedorDAO = new FornecedorDAO();
                            List<Fornecedor> fornecedores = fornecedorDAO.consultar();
                        %>

                        <form action="../Cadastrar/CadastrarProduto.jsp" method="post" class="form-container">
                            <div class="mb-3">
                                <label for="nome" class="form-label">Nome do Produto:</label>
                                <input type="text" class="form-control" name="nome" id="nome" required>
                            </div>

                            <div class="mb-3">
                                <label for="descricao" class="form-label">Descrição:</label>
                                <textarea class="form-control" name="descricao" id="descricao" rows="2" required></textarea>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="preco" class="form-label">Preço:</label>
                                    <div class="input-group">
                                        <span class="input-group-text">R$</span>
                                        <input type="number" step="0.01" class="form-control" name="preco" id="preco" required min="0.01">
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="quantidade" class="form-label">Quantidade:</label>
                                    <input type="number" class="form-control" name="quantidade" id="quantidade" required min="0">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="categoriaId" class="form-label">Categoria:</label>
                                    <select class="form-select" name="categoriaId" id="categoriaId" required>
                                        <option value="">-- Selecione --</option>
                                        <% 
                                            if (categorias != null) {
                                                for (Categoria c : categorias) {
                                        %>
                                            <option value="<%= c.getId() %>"><%= c.getNome() %></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="fornecedorId" class="form-label">Fornecedor:</label>
                                    <select class="form-select" name="fornecedorId" id="fornecedorId" required>
                                        <option value="">-- Selecione --</option>
                                        <% 
                                            if (fornecedores != null) {
                                                for (Fornecedor f : fornecedores) {
                                        %>
                                            <option value="<%= f.getId() %>"><%= f.getNome() %></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <div class="d-flex justify-content-between mt-4">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-save"></i> Salvar Produto
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
</body>
</html>