<%@ page import="com.projeto.entidades.Postagem" %>
<%@ page import="com.projeto.dao.DAOPostagem" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <title>Nova Postagem</title>
</head>
<body>

    <div class="container">
        <%@ include file="header.jsp" %> 
        <h2>Nova Postagem</h2>
        <br>
        <form action="cadastrarPostagem.jsp" method="post">
            <label for="titulo" class="form-label">Título:</label>
            <input type="text" name="titulo" id="titulo" class="form-control mb-2" placeholder="Digite o título">

            <label for="texto" class="form-label">Postagem:</label>
            <br>
            <textarea name="texto" id="texto" cols="100" rows="10"></textarea>

            <button class="btn btn-primary">Cadastrar</button>
        </form>

    </div>

<%
        if(request.getMethod() == "POST"){
            String titulo = request.getParameter("titulo");
            String texto = request.getParameter("texto");
            
            if((titulo != null) && (texto != null) && !titulo.isEmpty() && !texto.isEmpty()){
                Postagem post = new Postagem();
                post.setTitulo(titulo);
                post.setTexto(texto);
                post.setIdUsuario(user.getId());
                DAOPostagem.salvar(post);
                response.sendRedirect("postagens.jsp");
            } else {
%>
        <script>
            alert('Os campos são de preenchimento obrigatório.');
        </script>
<%          
            } 
        }        
%>


    
</body>
</html>