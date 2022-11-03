<%@ page import="com.projeto.entidades.Postagem" %>
<%@ page import="com.projeto.entidades.Comentario" %>
<%@ page import="com.projeto.dao.DAOPostagem" %>
<%@ page import="com.projeto.dao.DAOComentario" %>
<%@ page import="com.projeto.dao.DAOUsuario" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página Inicial</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>

<body>

    
    <div class="container">
        <%@ include file="header.jsp" %> 

        <%
        int id = Integer.parseInt(request.getParameter("id"));
        Postagem post = DAOPostagem.consultarPost(id);
        
        %>
        <h2><% out.write(post.getId()+ " - "+post.getTitulo()); %></h2>
        <p><% out.write(post.getTexto()); %></p>

        <hr>
        <% if(logado){ %>
            <% if(!user.isModerador()) { %>
        <form action="verPost.jsp" method="post">
            <input type="text" id="id" name="id" class="form-control" hidden value=<% out.write(""+id); %>>
            <p>Faça o seu comentário:</p>
            <textarea name="comentario" id="comentario" cols="50" rows="5"></textarea>
            <br>
            <button class="btn btn-primary">Salvar</button>
        </form>
            <% } %>
        <% } else { %>
            <p style="color: red;">Para comentar é necessário efetuar o login!</p>
        <% } %>

        <h4>Comentários</h4>

        <table class="table">
            <thead>
                <tr></tr>
                    <th>Usuário</th>
                    <th>Comentário</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Comentario> lista = DAOComentario.listarComentariosAtivosPorPost(Integer.parseInt(request.getParameter("id")));
                    for(Comentario c : lista){
                        out.write("<tr>");
                            out.write("<td>"+DAOUsuario.localizarUsuario(c.getIdUsuario()).getNome()+"</td>");
                            out.write("<td>"+c.getTexto()+"</td>");
                        out.write("</tr>");
                    }
                %>
    
                </tbody>
        </table>

    </div>

    <%
        if(request.getMethod() == "POST"){

            Comentario comentario = new Comentario();
            String texto = request.getParameter("comentario");
            int idPost = Integer.parseInt(request.getParameter("id"));
            int idUser = user.getId();

            comentario.setTexto(texto);
            comentario.setIdPostagem(idPost);
            comentario.setIdUsuario(idUser);
            
            DAOComentario.salvar(comentario);
            response.sendRedirect("verPost.jsp?id="+idPost);

        }    

    %>
    

</body>
</html>

