<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bd" class="dao.bdDAO"/>
<jsp:useBean id="vo" class="vo.semilist1"/>
<jsp:setProperty name="vo" property="*"/>

<%
    bd.modifyBoard(vo);
    response.sendRedirect("fList.jsp?cpage=1");
%>