<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="gmbdao" class="dao.goodMembersDAO" scope="session"/>
<jsp:useBean id="gmb" class="vo.GoodMembers" scope="session"/>
<jsp:setProperty name="gmb" property="*"/>


<%
        int isOk = 0;
        isOk = gmbdao.joinAction(gmb);

        if (isOk >= 1){
                System.out.print("가입성공");
                response.sendRedirect("signright.jsp");
        } else {
                out.print("<script>alert('가입실패')</script>");
        }


%>
