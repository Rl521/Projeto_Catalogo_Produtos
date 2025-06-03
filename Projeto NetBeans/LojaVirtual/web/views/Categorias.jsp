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
<%@page import="dao.CategoriaDAO"%>
<%@page import="model.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Categorias - ShopBase</title>
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Categorias</h2>
        <div>
            <a href="../Cadastrar/CadastrarCategoria.html" class="btn btn-primary me-2">Nova Categoria</a>
        </div>
    </div>

    <%
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        List<Categoria> lista = categoriaDAO.consultar();

        if (lista != null && !lista.isEmpty()) {
            for (Categoria categoria : lista) {
    %>
    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title"><%= categoria.getNome() %></h5>
            <p class="card-text"><strong>ID:</strong> <%= categoria.getId() %></p>
            
            <div class="d-flex gap-2 mt-3">
                <form action="../Atualizar/AtualizarCategoria.jsp" method="get">
                    <input type="hidden" name="id" value="<%= categoria.getId() %>">
                    <button type="submit" class="btn btn-sm btn-outline-primary">Editar</button>
                </form>
                
                <form action="../Excluir/ExcluirCategoria.jsp" method="post" 
                      onsubmit="return confirm('Deseja realmente excluir esta categoria?');">
                    <input type="hidden" name="id" value="<%= categoria.getId() %>">
                    <button type="submit" class="btn btn-sm btn-outline-danger">Excluir</button>
                </form>
            </div>
        </div>
    </div>
    <%
            }
        } else {
    %>
    <div class="alert alert-info">Nenhuma categoria cadastrada.</div>
    <%
        }
    %>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>