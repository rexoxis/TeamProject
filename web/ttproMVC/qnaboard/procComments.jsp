
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="qnaf" class="dao.QnaBoardDAO" scope="session"/>
<jsp:useBean id="qb" class="vo.QnaComments"/>
<jsp:setProperty name="qb" property="*" />

<%
    int bdno = Integer.parseInt(request.getParameter("bdno"));
    qnaf.commentsWrite(qb,bdno);

    response.sendRedirect("qView.jsp?bdno="+bdno);
%>