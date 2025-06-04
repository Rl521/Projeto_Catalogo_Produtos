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
<%@page import="model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Produtos</title>
    <!-- Bootstrap 5.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Produtos</h2>
        <a href="../formularios/FormularioProduto.jsp" class="btn btn-primary">Novo Produto</a>
    </div>

    <%
        ProdutoDAO produtoDAO = new ProdutoDAO();
        List<Produto> lista = produtoDAO.consultar();

        if (lista != null) {
            for (Produto produto : lista) {
    %>
    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title"><%= produto.getNome() %></h5>
            <p class="card-text"><strong>ID:</strong> <%= produto.getId() %></p>
            <p class="card-text"><%= produto.getDescricao() %></p>
            <p class="card-text"><strong>Preço:</strong> R$ <%= String.format("%.2f", produto.getPreco()) %></p>
            
            <div class="d-flex gap-2">
                <form action="../Atualizar/AtualizarProduto.jsp" method="get">
                    <input type="hidden" name="id" value="<%= produto.getId() %>">
                    <button type="submit" class="btn btn-sm btn-outline-primary">Editar</button>
                </form>
                
                <form action="../Excluir/ExcluirProduto.jsp" method="post" onsubmit="return confirm('Excluir este produto?');">
                    <input type="hidden" name="id" value="<%= produto.getId() %>">
                    <button type="submit" class="btn btn-sm btn-outline-danger">Excluir</button>
                </form>
            </div>
        </div>
    </div>
    <%
            }
        } else {
    %>
    <div class="alert alert-info">Nenhum produto cadastrado.</div>
    <%
        }
    %>
</body>
</html>