<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bd" class="dao.bdDAO"/>
<jsp:useBean id="vo" class="vo.semilist1"/>
<jsp:setProperty name="vo" property="*"/>

<%
    String selectbd = request.getParameter("selectbd");
    bd.writeboard(vo,selectbd);
    response.sendRedirect("fList.jsp?cpage=1");
%>
