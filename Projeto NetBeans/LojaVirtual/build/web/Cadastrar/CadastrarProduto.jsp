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
<%@page import="dao.ProdutoDAO"%>
<%@page import="model.Produto"%>
<%@page import="model.Categoria"%>
<%@page import="model.Fornecedor"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Produto - ShopBase</title>
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
                        <h1 class="h4 mb-0">Cadastro de Produto</h1>
                    </div>
                    <div class="card-body">
                        <%
                            String mensagem = "";
                            String alertType = "success";
                            NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));
                            
                            try {
                                String nome = request.getParameter("nome");
                                String descricao = request.getParameter("descricao");
                                double preco = Double.parseDouble(request.getParameter("preco"));
                                int quantidade = Integer.parseInt(request.getParameter("quantidade"));
                                int categoriaId = Integer.parseInt(request.getParameter("categoriaId"));
                                int fornecedorId = Integer.parseInt(request.getParameter("fornecedorId"));

                                Categoria categoria = new Categoria();
                                categoria.setId(categoriaId);

                                Fornecedor fornecedor = new Fornecedor();
                                fornecedor.setId(fornecedorId);

                                Produto produto = new Produto();
                                produto.setNome(nome);
                                produto.setDescricao(descricao);
                                produto.setPreco(preco);
                                produto.setQuantidade(quantidade);
                                produto.setCategoria(categoria);
                                produto.setFornecedor(fornecedor);

                                ProdutoDAO dao = new ProdutoDAO();
                                if (dao.inserir(produto)) {
                                    mensagem = "Produto cadastrado com sucesso!";
                                } else {
                                    mensagem = "Não foi possível cadastrar o produto.";
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
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-2"><strong>Nome:</strong> <%= request.getParameter("nome") %></div>
                                    <div class="mb-2"><strong>Descrição:</strong> <%= request.getParameter("descricao") %></div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-2"><strong>Preço:</strong> <%= nf.format(Double.parseDouble(request.getParameter("preco"))) %></div>
                                    <div class="mb-2"><strong>Quantidade:</strong> <%= request.getParameter("quantidade") %></div>
                                </div>
                            </div>
                            <div class="mt-2">
                                <strong>Categoria ID:</strong> <%= request.getParameter("categoriaId") %> | 
                                <strong>Fornecedor ID:</strong> <%= request.getParameter("fornecedorId") %>
                            </div>
                            <% } %>
                        </div>
                        
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                            <a href="../formularios/FormularioProduto.jsp" class="btn btn-primary me-md-2">
                                <i class="bi bi-plus-circle"></i> Cadastrar Outro
                            </a>
                            <a href="../views/Produtos.jsp" class="btn btn-outline-secondary">
                                <i class="bi bi-house-door"></i> Listar Produtos
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