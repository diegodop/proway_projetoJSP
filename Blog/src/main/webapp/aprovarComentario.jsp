<%@ page import="com.projeto.dao.DAOComentario" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    DAOComentario.aprovar(id);
    response.sendRedirect("moderarComentarios.jsp");
%>