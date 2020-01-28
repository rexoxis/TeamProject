<%@ page import="dao.LoginDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% request.setCharacterEncoding("utf-8"); %>

<%--<jsp:useBean id="loginf" class="dao.LoginDAO" scope="session"/>--%>

<%
    LoginDAO login = new LoginDAO();

    String uid = request.getParameter("userid");
    String pwd = request.getParameter("passwd");

    int check = login.loginAction(uid, pwd);

    if (check == 1) {
        session.setAttribute("userid", uid);
        response.sendRedirect("/project/index.jsp");
    } else if (check == 0){
        response.sendRedirect("loginfail.jsp");
    } else {
        System.out.println("회원정보 없음");
    }

%>
