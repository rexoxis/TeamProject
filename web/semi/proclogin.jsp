<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vo.Member" %>

<jsp:useBean id="mbf" class="dao.MemberFactory" scope="session"/>
<jsp:useBean id="mb" class="vo.Member" scope="session"/>

<%
    String uid = request.getParameter("userid");
    String pwd = request.getParameter("passwd");
    String goPage = "";
    String ispwd = mbf.getPwdByUid(uid);

    if(ispwd != null && ispwd.equals(pwd)) {
        Member smb = mbf.getMemberById(uid);
        session.setAttribute("smb",smb);
        goPage = "index.jsp";
        out.print(ispwd);
    } else {
        goPage = "loginfail.jsp";
    }

    response.sendRedirect(goPage);
%>