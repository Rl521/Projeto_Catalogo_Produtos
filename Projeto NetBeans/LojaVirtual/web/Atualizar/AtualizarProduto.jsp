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
<%@page import="dao.ProdutoDAO"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="dao.FornecedorDAO"%>
<%@page import="model.Produto"%>
<%@page import="model.Categoria"%>
<%@page import="model.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    ProdutoDAO produtoDao = new ProdutoDAO();
    CategoriaDAO categoriaDao = new CategoriaDAO();
    FornecedorDAO fornecedorDao = new FornecedorDAO();

    String metodo = request.getMethod();

    if ("POST".equalsIgnoreCase(metodo)) {
        int id = Integer.parseInt(request.getParameter("id"));
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
        produto.setId(id);
        produto.setNome(nome);
        produto.setDescricao(descricao);
        produto.setPreco(preco);
        produto.setQuantidade(quantidade);
        produto.setCategoria(categoria);
        produto.setFornecedor(fornecedor);

        boolean sucesso = produtoDao.atualizar(produto);
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Atualização - ShopBase</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card shadow-sm mx-auto" style="max-width: 600px;">
        <div class="card-body text-center">
            <h1 class="mb-4 text-primary">Atualização de Produto</h1>
            <div class="alert <%= sucesso ? "alert-success" : "alert-danger" %>" role="alert">
                <%= sucesso ? "Produto atualizado com sucesso!" : "Erro ao atualizar o produto." %>
            </div>
            <a href="../views/Produtos.jsp" class="btn btn-primary mt-3">Voltar</a>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%
    } else {
        int id = Integer.parseInt(request.getParameter("id"));
        Produto produto = null;

        List<Produto> lista = produtoDao.consultar();
        if (lista != null) {
            for (Produto p : lista) {
                if (p.getId() == id) {
                    produto = p;
                    break;
                }
            }
        }

        List<Categoria> categorias = categoriaDao.consultar();
        List<Fornecedor> fornecedores = fornecedorDao.consultar();

        if (produto == null) {
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Produto Não Encontrado - ShopBase</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light text-center py-5">
<div class="container">
    <div class="card shadow-sm mx-auto" style="max-width: 600px;">
        <div class="card-body">
            <h1 class="mb-4 text-primary">Atualização de Produto</h1>
            <div class="alert alert-warning">Produto não encontrado.</div>
            <a href="../views/Produtos.jsp" class="btn btn-secondary">Voltar</a>
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
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Editar Produto - ShopBase</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card shadow-sm mx-auto" style="max-width: 600px;">
        <div class="card-body">
            <h1 class="mb-4 text-primary text-center">Editar Produto</h1>
            <form action="AtualizarProduto.jsp" method="post" class="needs-validation" novalidate>
                <input type="hidden" name="id" value="<%= produto.getId() %>">

                <div class="mb-3">
                    <label for="nome" class="form-label fw-bold">Nome:</label>
                    <input type="text" class="form-control" id="nome" name="nome" value="<%= produto.getNome() %>" required>
                    <div class="invalid-feedback">Por favor, preencha o nome.</div>
                </div>

                <div class="mb-3">
                    <label for="descricao" class="form-label fw-bold">Descrição:</label>
                    <input type="text" class="form-control" id="descricao" name="descricao" value="<%= produto.getDescricao() %>" required>
                    <div class="invalid-feedback">Por favor, preencha a descrição.</div>
                </div>

                <div class="mb-3">
                    <label for="preco" class="form-label fw-bold">Preço:</label>
                    <input type="number" step="0.01" class="form-control" id="preco" name="preco" value="<%= produto.getPreco() %>" required>
                    <div class="invalid-feedback">Por favor, informe um preço válido.</div>
                </div>

                <div class="mb-3">
                    <label for="quantidade" class="form-label fw-bold">Quantidade:</label>
                    <input type="number" class="form-control" id="quantidade" name="quantidade" value="<%= produto.getQuantidade() %>" required>
                    <div class="invalid-feedback">Por favor, informe a quantidade.</div>
                </div>

                <div class="mb-3">
                    <label for="categoriaId" class="form-label fw-bold">Categoria:</label>
                    <select class="form-select" id="categoriaId" name="categoriaId" required>
                        <% for (Categoria cat : categorias) { %>
                            <option value="<%= cat.getId() %>" <%= cat.getId() == produto.getCategoria().getId() ? "selected" : "" %>>
                                <%= cat.getNome() %>
                            </option>
                        <% } %>
                    </select>
                    <div class="invalid-feedback">Por favor, selecione uma categoria.</div>
                </div>

                <div class="mb-4">
                    <label for="fornecedorId" class="form-label fw-bold">Fornecedor:</label>
                    <select class="form-select" id="fornecedorId" name="fornecedorId" required>
                        <% for (Fornecedor forn : fornecedores) { %>
                            <option value="<%= forn.getId() %>" <%= forn.getId() == produto.getFornecedor().getId() ? "selected" : "" %>>
                                <%= forn.getNome() %>
                            </option>
                        <% } %>
                    </select>
                    <div class="invalid-feedback">Por favor, selecione um fornecedor.</div>
                </div>

                <div class="d-flex justify-content-between">
                    <button type="submit" class="btn btn-primary">Salvar Alterações</button>
                    <a href="../views/Produtos.jsp" class="btn btn-secondary">Cancelar</a>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
(() => {
    'use strict';
    const forms = document.querySelectorAll('.needs-validation');
    Array.from(forms).forEach(form => {
        form.addEventListener('submit', event => {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    });
})();
</script>
</body>
</html>
<%
        }
    }
%>