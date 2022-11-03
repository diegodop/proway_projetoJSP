<%@ page import="com.projeto.dao.DAOComentario" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    DAOComentario.rejeitar(id);
    response.sendRedirect("moderarComentarios.jsp");
%>