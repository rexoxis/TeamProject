<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="qnaf" class="dao.QnaBoardFactory" scope="session"/>

<%--단지 가져오는 부분 --%>
<jsp:useBean id="qb" class="vo.QnaBoard"/>
<% request.setCharacterEncoding("utf-8");%>
<%--여기서 id와 name 부분 --%>

<%--입력 받은 값들을 가져와서 쓰이는 부분
  입력받는 FORM 부분에 다 갇다 쓰겠다 따라서 VO 변수명과 input tag의 name이 갇아야함 --%>
<jsp:setProperty name="qb" property="*"/>

<%
    String selectbd = request.getParameter("selectbd");

    int isOk = 0;
    isOk = qnaf.writeAction(qb, selectbd);

    if (isOk >= 1){
        System.out.print("게시판업로드성공");
        response.sendRedirect("qList.jsp?cpage=1");
    } else {
        out.print("<script>alert('게시판업로드실패')</script>");
    }

%>