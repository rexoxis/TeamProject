<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    int deleteBdno = Integer.parseInt(request.getParameter("bdno"));

    out.println("<script> alert('이미 삭제된 게시물입니다.'); </script>");

    if (deleteBdno != 0){
        response.sendRedirect("reviewList.jsp?cpage=1");
    }
%>
