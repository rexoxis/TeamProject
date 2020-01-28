
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bd" class="dao.bdDAO"/>
<%
    int bdno = Integer.parseInt(request.getParameter("bdno"));
    int isok = bd.deletelist(bdno);


    if (isok >= 1){

        response.sendRedirect("fList.jsp");

    }else {
        out.print("<script>history.go(-1)</script>");
    }

%>