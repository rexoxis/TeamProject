<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 현재 접속중인 브라우저에 대해 세션객체 제거
    session.invalidate();

    // 지정한 페이지로 이동
    response.sendRedirect("/ttpro/index.jsp");
%>