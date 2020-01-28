<%@ page import="dao.LoginDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="login" class="dao.LoginDAO"/>

<%

    String uid = request.getParameter("userid");
    String pwd = request.getParameter("passwd");

    int check = login.loginAction(uid, pwd);

    if (check == 1) {
        session.setAttribute("userid", uid);
        response.sendRedirect("/ttpro/index.jsp");
    } else if (check == 0){
        response.sendRedirect("/ttpro/login/loginfail.jsp");
    } else {
        System.out.println("회원정보 없음");
    }
    System.out.println(check);

%>
