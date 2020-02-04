
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bd" class="dao.FreeBoardDAO"/>
<jsp:useBean id="vo" class="vo.FreeBoard"/>
<%
    int bdno = Integer.parseInt(request.getParameter("bdno"));
    int like = bd.LikeCnt(bdno);

    if (like >= 1){
        response.sendRedirect("freeView.jsp?bdno="+bdno);
        
    }else {
        out.print("<script> history.go(-1); </script>");
    }

%>