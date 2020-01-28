<%@ page contentType="image/png"%>
<%@ page import="service.CaptchaUtil" %>

<%
    CaptchaUtil.getCaptcha(request, response);
%>

