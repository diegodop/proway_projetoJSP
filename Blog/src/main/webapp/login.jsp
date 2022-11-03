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
    <title>Login</title>
</head>
<body>

    <div class="container">
        <h2>Login</h2>
        <form action="login.jsp" method="post">
            <label for="email" class="form-label">E-mail:</label>
            <input type="email" name="email" id="email" class="form-control mb-2" placeholder="Digite seu e-mail">

            <label for="senha" class="form-label">Senha:</label>
            <input type="password" name="senha" id="senha" class="form-control mb-3" placeholder="Digite sua senha">
            <button class="btn btn-primary">Logar</button>          
        </form>

        <button class="btn btn-primary mt-4" onclick=location.href='cadastrarUsuario.jsp'>Cadastrar</button>
        <button class="btn btn-secondary mt-4" onclick=location.href='index.jsp'>Página Inicial</button>  
    </div>

    <%
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
         
        if((email != null) && (senha != null) && !email.isEmpty() && !senha.isEmpty()){
            Usuario retorno = DAOUsuario.logar(email, senha);
            if(retorno != null){            
                session.setAttribute("loginJSP", retorno);
                response.sendRedirect("index.jsp"); 
            }
        }          
    %>
    
</body>
</html>