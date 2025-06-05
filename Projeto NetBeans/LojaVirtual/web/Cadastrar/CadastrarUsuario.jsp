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
<%@page import="dao.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");

    Usuario usuario = new Usuario();
    usuario.setNome(nome);
    usuario.setEmail(email);
    usuario.setSenha(senha);

    UsuarioDAO usuarioDAO = new UsuarioDAO();
    boolean sucesso = usuarioDAO.inserir(usuario);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Usuário - ShopBase</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container d-flex align-items-center justify-content-center" style="min-height: 100vh;">
        <div class="card shadow-sm p-4" style="max-width: 400px; width: 100%;">
            <% if (sucesso) { %>
                <div class="alert alert-success text-center mb-4">
                    <h4 class="alert-heading">Conta registrada com sucesso!</h4>
                    <p>Agora você pode acessar sua conta usando seu e-mail e senha.</p>
                </div>
                <a href="../views/Login.jsp" class="btn btn-primary w-100">Ir para Login</a>
            <% } else { %>
                <div class="alert alert-danger text-center mb-4">
                    <h4 class="alert-heading">Erro ao cadastrar usuário!</h4>
                    <p>Não foi possível registrar sua conta. Tente novamente.</p>
                </div>
                <a href="../views/CadastroUsuarios.jsp" class="btn btn-primary w-100">Tentar Novamente</a>
            <% } %>
        </div>
    </div>
</body>
</html>