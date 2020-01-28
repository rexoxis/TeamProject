
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="rbdao" class="dao.ReviewBoardFactory" scope="session"/>

<%
    out.println("<script> alert('삭제하시겠습니까?'); </script>");

    int bdno = Integer.parseInt(request.getParameter("bdno"));


    int check = 0;
    check = rbdao.deleteView(bdno);

    if (check >= 1) {
        response.sendRedirect("revList.jsp");
    } else {
        System.out.println("삭제실패");
        response.sendRedirect("procRevDelete.jsp?bdno="+bdno);
    }

%>
