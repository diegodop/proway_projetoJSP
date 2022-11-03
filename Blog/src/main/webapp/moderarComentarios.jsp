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
    <title>Moderação de Comentários</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>

<body>
    <div class="container">

        <%@ include file="header.jsp" %>
        <%  if (!logado) {
                response.sendRedirect("index.jsp");
            }
            if (logado && !user.isModerador()) {
                response.sendRedirect("index.jsp");
            }
        
        %>
        
        <h2>Página de Moderação de Comentários</h2>
        <br>

        <table class="table">
            <thead>
                <tr>
                    <th>ID da Postagem</th>
                    <th>Titulo da Postagem</th>
                    <th>Comentário</th>
                    <th>Usuário</th>
                    <th>Ação</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Comentario> lista = DAOComentario.listarComentariosInativos();
                    for(Comentario c : lista){
                        Postagem p = DAOPostagem.consultarPost(c.getIdPostagem());
                        out.write("<tr>");
                            out.write("<td>"+p.getId()+"</td>");
                            out.write("<td>"+p.getTitulo()+"</td>");
                            out.write("<td>"+c.getTexto()+"</td>");
                            out.write("<td>"+DAOUsuario.localizarUsuario(c.getIdUsuario()).getNome()+"</td>");
                            out.write("<td><a href='aprovarComentario.jsp?id="+c.getId()+"'>Aprovar</a> <a href='rejeitarComentario.jsp?id="+c.getId()+"'>Rejeitar</a></td>");
                        out.write("</tr>");
                    }
                %>

    
            </tbody>
    
        </table>
    </div>
    

</body>
</html>

