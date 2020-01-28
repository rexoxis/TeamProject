
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bd" class="dao.bdDAO"/>
<jsp:useBean id="vo" class="vo.semilist1"/>
<%
    int bdno = Integer.parseInt(request.getParameter("bdno"));
    int like = bd.LikeCnt(bdno);

    if (like >= 1){
        response.sendRedirect("fView.jsp?bdno="+bdno);
        
    }else {
        out.print("<script> history.go(-1); </script>");
    }

%>