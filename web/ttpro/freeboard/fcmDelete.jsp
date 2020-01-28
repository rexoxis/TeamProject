<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bd" class="dao.bdDAO"/>
<%
    int bdno = Integer.parseInt(request.getParameter("bdno"));
    int comt_bdno = Integer.parseInt(request.getParameter("comt_bdno"));

    int isok2 = bd.deleteComment(comt_bdno);

    System.out.println("게시글 번호 : " + bdno);
    System.out.println("댓글 번호 : " + comt_bdno);

    if (isok2 >= 1){

        response.sendRedirect("fView.jsp?bdno=" + bdno);

    }else {
        out.print("<script>history.go(-1)</script>");
    }

%>