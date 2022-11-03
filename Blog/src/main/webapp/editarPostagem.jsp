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
    <title>Editar Postagem</title>
</head>
<body>

    <%
    int id = Integer.parseInt(request.getParameter("id"));
    Postagem post = DAOPostagem.consultarPost(id);
    %>

    <div class="container">
        <%@ include file="header.jsp" %> 
        <h2>Editar Postagem</h2>
        <br>
        <form action="editarPostagem.jsp" method="post">
            <input type="text" id="id" name="id" class="form-control" hidden value=<% out.write(""+id); %>>
            <label for="titulo" class="form-label">Título:</label>
            <input type="text" name="titulo" id="titulo" class="form-control mb-2" placeholder="Digite o título" value="<% out.write(post.getTitulo()); %>">

            <label for="texto" class="form-label">Postagem:</label>
            <br>
            <textarea name="texto" id="texto" cols="100" rows="10"><% out.write(post.getTexto()); %></textarea>
            <br>

            <button class="btn btn-primary">Salvar Alteração</button>
        </form>

    </div>

<%
        if(request.getMethod() == "POST"){
            String titulo = request.getParameter("titulo");
            String texto = request.getParameter("texto");
            int idPost = Integer.parseInt(request.getParameter("id"));
            int idUser = user.getId();
            
            if((titulo != null) && (texto != null) && !titulo.isEmpty() && !texto.isEmpty()){
                post.setId(idPost);
                post.setTitulo(titulo);
                post.setTexto(texto);
                post.setIdUsuario(user.getId());
                DAOPostagem.alterar(post);
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