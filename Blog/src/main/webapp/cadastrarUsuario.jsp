<%@ page import="com.projeto.dao.DAOUsuario" %>
<%@ page import="com.projeto.entidades.Usuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <title>Cadastro de Usuário</title>
</head>
<body>

    <div class="container">
        <h2>Página de Cadastro de Usuário</h2>
        <br>
        <form action="cadastrarUsuario.jsp" method="post">
            <label for="nome" class="form-label">Nome:</label>
            <input type="nome" name="nome" id="nome" class="form-control mb-2" placeholder="Digite seu nome">

            <label for="email" class="form-label">E-mail:</label>
            <input type="email" name="email" id="email" class="form-control mb-2" placeholder="Digite seu e-mail">

            <label for="senha" class="form-label">Senha:</label>
            <input type="password" name="senha" id="senha" class="form-control mb-4" placeholder="Digite sua senha">

            <button class="btn btn-primary">Cadastrar</button>
        </form>

        <button class="btn btn-secondary mt-4" onclick=location.href='index.jsp'>Página Inicial</button>
    </div>

<%
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
         
        if((nome != null) && (email != null) && (senha != null) && !nome.isEmpty() && !email.isEmpty() && !senha.isEmpty()){
            if(!DAOUsuario.verificarEmailCadastrado(email)){
                Usuario usuario = new Usuario();
                usuario.setNome(nome);
                usuario.setEmail(email);
                usuario.setSenha(senha);
                DAOUsuario.salvar(usuario);
                session.setAttribute("loginJSP", usuario);
                response.sendRedirect("index.jsp"); 

            } else { 
%>
                <script>
                    alert('O e-mail informado já existe na base de dados.');
                </script>
<%          
            }
        }          
%>


    
</body>
</html>