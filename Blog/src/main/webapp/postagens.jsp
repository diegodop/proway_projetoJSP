<%@ page import="com.projeto.entidades.Postagem" %>
<%@ page import="com.projeto.dao.DAOPostagem" %>
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

        <button class="btn btn-primary mb-3" onclick=location.href='cadastrarPostagem.jsp'>Cadastrar Postagem</button>

        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Titulo</th>
                    <th>Texto</th>
                    <th>Data/Hora</th>
                    <th>Usuário</th>
                    <th>Ação</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Postagem> lista = DAOPostagem.consultar();
                    for(Postagem p : lista){
                        out.write("<tr>");
                            out.write("<td>"+p.getId()+"</td>");
                            out.write("<td>"+p.getTitulo()+"</td>");
                            out.write("<td>"+p.getTexto().substring(0,15)+"... </td>");
                            out.write("<td>"+p.getDatahora()+"</td>");
                            out.write("<td>"+DAOUsuario.localizarUsuario(p.getIdUsuario()).getNome()+"</td>");
                            out.write("<td><a href='verPost.jsp?id="+p.getId()+"'>Ver</a> <a href='editarPostagem.jsp?id="+p.getId()+"'>Editar</a> <a href='excluirPostagem.jsp?id="+p.getId()+"'>Excluir</a></td>");
                        out.write("</tr>");
                    }
                %>
    
            </tbody>
    
        </table>
        
    </div>
    

</body>
</html>

