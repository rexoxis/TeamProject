<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="gmbdao" class="dao.goodMembersDAO" scope="session"/>
<jsp:useBean id="gmb" class="vo.GoodMembers" scope="page"/>
<jsp:setProperty name="gmb" property="*"/>


<%
        gmbdao.joinAction(gmb);

        System.out.print("가입성공");

        response.sendRedirect("signright.jsp");

%>
