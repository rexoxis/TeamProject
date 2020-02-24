<%@ page pageEncoding="UTF-8" %>
<%-- 절대경로 설정 --%>
<% String baseurl = "/ttproMVC"; %>

<%
    String uid = (String)session.getAttribute("userid");

    boolean islogin = false;

    if (session.getAttribute("userid") != null) {
        islogin = true;
    }
%>

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

<style>
    header {
        width: 100%;
        margin: 0 auto;
        font-size: 11pt;
        padding: 0;
        text-align: center;
        font-family: 'Jeju Gothic', sans-serif;
    }

    body {
        font-family: 'Jeju Gothic', sans-serif;
    }

    footer {
        font-family: 'Jeju Gothic', sans-serif;
    }

    .menubar {
        margin: 0 auto;
        width: 100%;
    }

    .menubar ul {
        list-style: none;
    }

    .menubar ul li {
        font-size: 15px;
        float: left;
        text-align: left;
        margin-right: 85px;
        text-decoration: none;
    }

    .menubar li ul {
        background-color: rgba(150, 255, 240, 0.5);
        display: none;
        height: auto;
        position: absolute;
        width: 250px;
        z-index: 200;
        list-style: none;
    }

    .menubar li:hover ul {
        display: block;
    }

    .menubar a:link {
        color: #000000
    }

    .menubar a:visited {
        color: #000000
    }

</style>
<header>
    <div>
        <h2 style="text-align: center; margin: 30px 0; font-size: 35px">
            <a href="<%=baseurl%>/index.jsp" style="color: #000000; text-decoration-line:none">착한아이</a></h2>
        <div class="text-right">
            <% if (islogin) {%>
            <button type="button" class="btn btn-primary" id="logoutbtn">로그아웃</button>
            <% } else {%>
            <button type="button" class="btn btn-primary" id="mloginbtn">로그인</button>
            <button type="button" class="btn btn-danger" id="joinbtn">회원가입</button>
            <% } %>
        </div>
        <hr color="#000000">
        <div class="menubar">
            <div class="row col-sm-12" style="margin: 0 0 30px 65px">
                <ul class="nav nav-tabs">
                    <li class="nav-item"><a class="nav-link" href="index.do">착한아이</a></li>
                    <li class="nav-item"><a class="nav-link" href="info.do">소개</a></li>
                    <li class="nav-item"><a class="nav-link" href="catList.do" id="parcel">분양</a>
                        <ul>
                            <li><a class="nav-link" href="catList.do">Cat's</a></li>
                            <li><a class="nav-link" href="dogList.do">Dog's</a></li>
                            <li><a class="nav-link" href="reviewList.do">분양후기</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="freeList.do?" id="list">게시판</a>
                        <ul>
                            <li><a class="nav-link" href="freeList.do">자유게시판</a></li>
                            <li><a class="nav-link" href="QnA.do">자주하는질문</a></li>
                            <li><a class="nav-link" href="qnaList.do">QnA</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="<%=baseurl%>/product/store.jsp" id="product">상품</a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="<%=baseurl%>/findmap/mapexample.jsp">찾아오시는 길</a></li>
                </ul>
            </div>
        </div>
    </div>

</header>

