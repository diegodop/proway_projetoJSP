<%@ page import="com.projeto.dao.DAOPostagem" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    DAOPostagem.excluir(id);
    response.sendRedirect("postagens.jsp");
%>