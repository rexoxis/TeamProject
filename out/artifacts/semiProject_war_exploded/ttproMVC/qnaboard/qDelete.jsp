<%@ page import="vo.TestBoard" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="qb" class="dao.QnaBoardFactory"/>
<%
    int bdno = Integer.parseInt(request.getParameter("bdno")); //view2.jsp 삭제버튼에 idx ,,,이 페이지에서 다시 써야 하니까 다씨도 int bdno애 담는다

    qb.deleteqnaList(bdno); //위에 int bdno를 또 가져 서 쓴다
    response.sendRedirect("qList.jsp");
%>


