<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.projeto.entidades.Usuario" %>

<%
    Usuario user = (Usuario) session.getAttribute("loginJSP");
    boolean logado = true;
    if(user == null){
        logado = false;
    }
%>

<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li class="nav-link px-2 link-dark"><a href="index.jsp">Página Inicial</a></li>
        <% if(logado && user.isModerador()) { %>
        <li class="nav-link px-2 link-dark"><a href="moderarComentarios.jsp">Moderar Comentários</a></li>
        <li class="nav-link px-2 link-dark"><a href="postagens.jsp">Gerenciar Postagens</a></li>
        <% } %>
    </ul>

    <div class="col-md-3 text-end">
        <% if(!logado) { %>
        <button class="btn btn-outline-primary me-2" onclick="location.href='login.jsp'">Logar</button>
        <button class="btn btn-primary" onclick="location.href='cadastrarUsuario.jsp'">Cadastrar</button>
        <% } else { %>
        <button class="btn btn-outline-primary" onclick="location.href='logout.jsp'">Deslogar</button>   
        <% } %>
    </div>

</header>