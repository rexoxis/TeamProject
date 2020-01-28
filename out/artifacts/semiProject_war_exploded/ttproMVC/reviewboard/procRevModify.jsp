<%@ page import="java.util.Map" %>
<%@ page import="service.FileUpDownUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="rbdao" class="dao.ReviewBoardFactory" scope="session"/>

<%
    String realpath = request.getRealPath("ttpro/fileupload");
    Map<String, String> frmdata = FileUpDownUtil.procUpload(request, realpath);

    int bdno = Integer.parseInt(request.getParameter("bdno"));

    int check = 0;
    check = rbdao.modifyView(frmdata, bdno);

    if (check >= 1) {
        response.sendRedirect("revList.jsp?cpage=1");
    } else {
        out.print("<script>history.go(-1);</script>");
    }
%>