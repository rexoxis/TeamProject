<%@ page import="java.util.Map" %>
<%@ page import="service.FileUpDownUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="catfdao" class="dao.CatBoardFactory" scope="session"/>

<%
    // 파일 업로드 절대경로
    String realpath = request.getRealPath("ttpro/fileupload");
    System.out.println(realpath);

    Map<String, String> frmdata = FileUpDownUtil.procUpload(request, realpath);

    String selectbd = frmdata.get("selectbd");

    int check = catfdao.catWrite(frmdata, selectbd);

    if (check >= 1) {
        session.setAttribute("frmdata", frmdata);
        response.sendRedirect("catList.jsp?cpage=1");
    } else {
        System.out.println("글쓰기 실패");
    }

%>