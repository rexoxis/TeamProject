<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="qnaf" class="dao.QnaBoardFactory" />
<jsp:useBean id="qb" class="vo.QnaBoard"/>
<jsp:setProperty name="qb" property="*" />

<%
    qnaf.modifyQnaList(qb);
    response.sendRedirect("qList.jsp?cpage=1");
%>