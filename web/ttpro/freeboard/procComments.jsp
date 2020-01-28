<%@ page import="java.util.Map" %>
<%@ page import="service.FileUpDownUtil" %>
<%@ page import="vo.semilist1" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="rbdao" class="dao.bdDAO" scope="session"/>
<jsp:useBean id="rcvo" class="vo.FrvComments"/>
<jsp:setProperty name="rcvo" property="*"/>

<%
    int bdno = Integer.parseInt(request.getParameter("bdno"));
    rbdao.commentsWrite(rcvo,bdno);

    response.sendRedirect("fView.jsp?bdno="+bdno);

%>