
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="dogfdoa" class="dao.DogBoardFactory" scope="session"/>
<jsp:useBean id="rdc" class="vo.RevDogComments"/>
<jsp:setProperty name="rdc" property="*"/>   <!-- 변수명을 vo 에서 불러오기 때문에 view페이지 name 값이 vo 변수명과 같아야 함 --!>

<%
    int bdno = Integer.parseInt(request.getParameter("bdno"));
    dogfdoa. commentsDogWrite(rdc,bdno);

    response.sendRedirect("dogView.jsp?bdno="+bdno);

%>