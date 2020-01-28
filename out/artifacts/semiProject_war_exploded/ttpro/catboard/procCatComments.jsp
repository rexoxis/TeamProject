
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="catfdoa" class="dao.CatBoardFactory" scope="session"/>
<jsp:useBean id="rcc" class="vo.RevCatComments"/>
<jsp:setProperty name="rcc" property="*"/>   <!-- 변수명을 vo 에서 불러오기 때문에 view페이지 name 값이 vo 변수명과 같아야 함 --!>

<%
    int bdno = Integer.parseInt(request.getParameter("bdno"));
    catfdoa. commentsCatWrite(rcc,bdno);

    response.sendRedirect("catView.jsp?bdno="+bdno);

%>