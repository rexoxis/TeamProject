<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="gmbdao" class="dao.goodMembersDAO" scope="session"/>
<jsp:useBean id="gmb" class="vo.GoodMembers" scope="session"/>
<jsp:setProperty name="gmb" property="*"/>


<%
//    String mycap = request.getParameter("cap");
//    String servercap = (String) session.getAttribute("cta");
//    System.out.println(mycap);
//    System.out.println(servercap);

//    if (mycap.equals(servercap)) {
        int isOk = 0;
        isOk = gmbdao.joinAction(gmb);

        if (isOk >= 1) {
            System.out.print("가입성공");
            response.sendRedirect("signright.jsp");
        } else {
            out.print("<script> alert('가입실패'); </script>");
            out.print("<script> history.go(-!); </script>");
        }
//    } else {
//        session.setAttribute("gmb",gmb);
//        response.sendRedirect("inputjoin.jsp");
//    }


%>
