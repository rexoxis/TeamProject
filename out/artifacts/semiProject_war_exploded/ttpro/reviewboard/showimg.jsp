<%@ page import="java.io.File" %>
<%@ page import="java.io.BufferedInputStream" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");

    // 브라우저에 나타낼 이미지 경로 지정
    String f = request.getParameter("f");
    String fpath = request.getRealPath("ttpro/fileupload")+"/"+f;
    File imgFile = new File(fpath);
    // 이미지 출력을 위한 HTTP 헤더 지정
    response.setContentType("image/png");
    response.setHeader("Content-Disposition","inline; filename=" + imgFile);

    // 이미지 파일의 내용을 전송하기 위한 객체 생성
    BufferedInputStream bis = new BufferedInputStream(new FileInputStream(imgFile));
    ServletOutputStream sos = response.getOutputStream();

    // 이미지 파일의 내용을 스트링으로 전송
    byte buf[] = new byte[4*1024];
    int data = 0;
    while ((data = bis.read(buf)) != -1) {
        sos.write(buf, 0, data);
    }
    sos.flush();
    sos.close();
    bis.close();
%>