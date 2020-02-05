<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.FreeBoard" %>
<%@ page import="vo.FreeComments" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");

    ArrayList<FreeBoard> freeLists = (ArrayList)session.getAttribute("freeLists");

    ArrayList<FreeComments> freeCommentLists = (ArrayList)request.getAttribute("freeCommentLists");

%>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>자유게시판 글보기</title>
</head>
<style>
    body {
        width: 100%;
        margin: 0 auto;
    }

    .list {
        float: left
    }

    .list > h3 {
        margin: 10px 0 10px 30px;
        font-weight: bold
    }

    .list > ul {
        list-style: none;
        text-align: left;
        text-decoration-line: none;
    }

    .list > ul > li {
        text-align: left;
        margin-left: 8px;
    }

    .list > ul > li > a {
        color: #000000
    }
</style>
<body>
<div class="container">
    <%@ include file="../layout/header.jsp" %>

    <div class="main">
        <div class="row">
            <div class="col-6" style="font-size: 45px; margin: 0 20px 0 60px ; padding:30px 0 20px 0;">
                <i class="fa fa-comments fa"> 자유게시판</i>
            </div>
            <div class="col-5">
                <button type="button" class="btn btn-success" id="newbtn" style="margin:45px 10px 15px 45%; ">
                    <i class="fa fa-plus-circle"> 새글쓰기</i>
                </button>
                <button type="button" class="btn btn-warning" onclick="location.href='qnaList.do'" style="margin:45px 0 15px 0; color: white">
                    <i class="fa fa-list" aria-hidden="true"> 목록으로</i>
                </button>
            </div>
        </div>

        <div class="row" style="margin: 10px 0 20px 0">
            <div class="list col-sm-3">
                <h3><i class="fa fa-assistive-listening-systems" aria-hidden="true"></i> 게시판</h3>
                <ul>
                    <%--해당 카테고리 a태그는 지워고 색깔 바꿔주세요--%>
                    <li style="color:#919191"> &block;&nbsp;&nbsp;자유게시판</li>
                    <li><a href="QnA.do">&block;&nbsp;&nbsp;자주하는 질문</a></li>
                    <li><a href="qnaList.do">&block;&nbsp;&nbsp;QnA</a></li>
                </ul>
            </div>
            <%-- 왼쪽 카테고리부분 --%>

            <div class="col-sm-9" style="height: auto; border: 0.3mm solid #cfcfcf; border-radius: 10px; padding: 20px">
                <% for (FreeBoard freeBoard : freeLists) { %>
                <div class="row">
                    <div class="col-sm-12">
                        <h1 id="title" style="text-align: center"><%=freeBoard.getTitle()%>
                        </h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div id="name" style="text-align: right; margin: 20px 20px 20px 0; color: #404040">
                            <%=freeBoard.getUserid()%> &#124;
                            <button type="button" class="btn btn-outline-danger"
                                    onclick="location.href='freeThumbsUP.do?bdno=<%=freeBoard.getBdno()%>'">
                                <i class="fa fa-thumbs-o-up" aria-hidden="true"></i></button>
                        </div>
                    </div>
                </div>
                <hr color="#cfcfcf">
                <div class="col-sm-12" style="margin-left: 15%">
                    <div id="contents" style="margin-top: 5px"><%=freeBoard.getContents()%></div>
                </div>
            </div>
        </div>
        <%-- 메인내용 부분 --%>

    </div>
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-9" style="margin: 20px 0 30px 0">
            <%--uid부분은 로그인한 사용자의 아이디를 표시할 부분--%>
            <form action="procfreeComment.do?bdno=<%=freeBoard.getBdno()%>" method="post">
                <div class="row" style="margin: 20px 0 30px 0">
                    <div style="margin-left: 15px">
                        <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                        <%=uid%>
                        <div class="user"></div>
                    </div>
                    <%-- 아이콘 뒤에 로그인된 아이디가 들어갔으면 좋겠어요 --%>
                    <input type="hidden" name="freeCommnet_userid" value="<%=uid%>">
                    <input type="text" id="comentWr" name="freeComment_contents" style="width: 70%; margin: 0 15px 0 35px ">
                    <button type="submit" class="btn btn-outline-success" id="comentOk"> 등록</button>
                </div>
                <%-- 댓글 입력창 --%>
            </form>
            <%-- 입력한 댓글이 있으면 댓글을 불러옴--%>
            <% for (FreeComments freeComments : freeCommentLists) { %>
            <% if (freeComments.getComt_contents() != null || !(freeComments.getComt_contents().equals(""))) {%>
            <div class="row">
                <div class="col-sm-2">
                    <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                    <%=freeComments.getComt_userid()%>
                    <div class="user"></div>
                </div>
                <%-- 아이콘 뒤에 로그인된 아이디가 들어갔으면 좋겠어요 --%>
                <div class="col-sm-7">
                    <div id="coment1"><%=freeComments.getComt_contents()%></div>
                    <div id="coment2" style="font-size: 10pt"><%=freeComments.getComt_regdate()%></div>
                    <%-- 대댓글은 시간상 언급하는 식으로 들어가는게 나을꺼 같아요 --%>
                </div>
                <a href="procfreeCommentDelete.do?Comment_bdno=<%=freeComments.getComt_bdno()%>&bdno=<%=freeBoard.getBdno()%>"
                   class="btn btn-outline-danger" style="height: 35px; margin-left: 65px;">
                    <i class="fa fa-trash-o" aria-hidden="true"></i></a>
            </div>
            <%}%>
            <%}%>
        </div>
    </div>
    <%-- 댓글부분 --%>

    <div class="row" style="margin: 0 0 0 53%">
        <div>
            <button type="button" class="btn btn-info" onclick="location.href='freeModify.do'"><i class="fa fa-pencil"
                                                                                                   aria-hidden="true"></i>
                수정하기
            </button>
        </div>&nbsp;
        <div class="text-right">
            <a href="procfreeDelete.do?bdno=<%=freeBoard.getBdno()%>" class="btn btn-danger"><i class="fa fa-trash-o"
                                                                                  aria-hidden="true"></i> 삭제하기</a>
        </div>
    </div>
    <%-- 수정/삭제 버튼 --%>
    <%}%>

    <%@ include file="../layout/footer.jsp" %>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script src="/ttproMVC/js/button.js"></script>


<script>

    // 새글쓰기
    $(function () {
        $('#newbtn').on('click', function (e) {
            location.href = 'freeWrite.do';
        });
    });

    // 미로그인시 접근제한
    var uid = <%=uid%>;

    if (uid === "" || uid == null) {
        alert('로그인 후 사용해주세요!');
        location.href='login.do';
    }
</script>
</body>
</html>