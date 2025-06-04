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
<%@page import="dao.CategoriaDAO" %>
<%@page import="model.Categoria" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    CategoriaDAO dao = new CategoriaDAO();
    String metodo = request.getMethod();

    if ("POST".equalsIgnoreCase(metodo)) {
        int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");

        Categoria categoria = new Categoria();
        categoria.setId(id);
        categoria.setNome(nome);

        boolean sucesso = dao.atualizar(categoria);
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <title>Atualização - ShopBase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light py-5">
<div class="container bg-white rounded shadow p-4" style="max-width: 600px;">
    <h1 class="text-primary mb-4">Atualização de Categoria</h1>
    <div class="alert <%= sucesso ? "alert-success" : "alert-danger" %>" role="alert">
        <%= sucesso ? "Categoria atualizada com sucesso!" : "Erro ao atualizar a categoria." %>
    </div>
    <a href="../views/Categorias.jsp" class="btn btn-primary">Voltar</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%
    } else {
        int id = Integer.parseInt(request.getParameter("id"));
        Categoria categoria = null;

        List<Categoria> lista = dao.consultar();
        if (lista != null) {
            for (Categoria c : lista) {
                if (c.getId() == id) {
                    categoria = c;
                    break;
                }
            }
        }

        if (categoria == null) {
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <title>Categoria Não Encontrada - ShopBase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light py-5 text-center">
<div class="container bg-white rounded shadow p-4" style="max-width: 600px;">
    <h1 class="text-primary mb-4">Atualização de Categoria</h1>
    <div class="alert alert-warning" role="alert">
        Categoria não encontrada.
    </div>
    <a href="../views/Categorias.jsp" class="btn btn-secondary">Voltar</a>
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
    <meta charset="UTF-8" />
    <title>Editar Categoria - ShopBase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light py-5">
<div class="container bg-white rounded shadow p-4" style="max-width: 600px;">
    <h1 class="text-primary mb-4">Editar Categoria</h1>
    <form action="AtualizarCategoria.jsp" method="post" id="formCategoria" novalidate>
        <input type="hidden" name="id" value="<%= categoria.getId() %>" />

        <div class="mb-3">
            <label for="nome" class="form-label fw-bold">Nome:</label>
            <input 
                type="text" 
                class="form-control" 
                id="nome" 
                name="nome" 
                value="<%= categoria.getNome() %>" 
                required
                maxlength="100"
            />
            <div class="invalid-feedback">
                Por favor, preencha o nome da categoria.
            </div>
        </div>

        <div class="d-flex justify-content-between">
            <button type="submit" class="btn btn-primary">Salvar Alterações</button>
            <a href="../views/Categorias.jsp" class="btn btn-secondary">Cancelar</a>
        </div>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    (() => {
        const form = document.getElementById('formCategoria');
        form.addEventListener('submit', (event) => {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        });
        window.onload = () => {
            document.getElementById('nome').focus();
        };
    })();
</script>
</body>
</html>
<%
        }
    }
%>