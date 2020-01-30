<%@ page import="java.util.Map" %>
<%@ page import="service.FileUpDownUtil" %>
<%@ page import="vo.ReviewBoard" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="rbdao" class="dao.ReviewBoardFactory" scope="session"/>
<jsp:useBean id="rcvo" class="vo.ReviewComments"/>
<jsp:setProperty name="rcvo" property="*"/>

<%
    int bdno = Integer.parseInt(request.getParameter("bdno"));
    rbdao.commentsWrite(rcvo,bdno);

    response.sendRedirect("reviewView.jsp?bdno="+bdno);

%>