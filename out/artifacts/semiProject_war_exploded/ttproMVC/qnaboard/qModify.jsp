<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.QnaBoard" %>
<%@ page contentType="text/html; charset=utf-8"%>
<jsp:useBean id="qb" class="dao.QnaBoardFactory"  scope="session"/>

<%
    ArrayList<QnaBoard> qnalists = (ArrayList)session.getAttribute("q");
%>
<html>
<head>
    <link rel ="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>QnA 수정하기</title>
</head>
<body>
<div class="container">
    <%@ include file = "../layout/header.jsp"%>

    <div class="main">  <!--https://glyphicons.com/-->
        <div class="col-8" style="font-size: 45px; margin: 0 20px 0 40px ; padding:30px 0 20px 0;">
            <i class="fa fa-question-circle"> QnA</i></div>



        <div class="row" style="margin: 10px 30px 20px 30px">
            <div class="col-6">
                <h4><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 수정하기</h4>
            </div>

            <div class="col-6 text-right">
                <button type="button" class="btn btn-success" id="listbtn">
                    <i class="fa fa-list"> 목록으로</i>
                </button>
            </div>
        </div> <!--버튼-->

        <div class="row" style="margin: 10px 30px 20px 30px">
            <% for (QnaBoard qna : qnalists) { %>
            <form method="post" action="procQnaModify.jsp?bdno=<%=qna.getBdno()%>" name="bdfrm" class="card card-body bg-light">
                <div class="form-group row">
                    <label class="col-sm-2 control-label" >이름</label>
                    <div class="col-sm-3">
                        <div name="name"><%=qna.getUserid()%></div>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 control-label" >제목</label>
                    <div class="col-sm-5">
                        <textarea name="title" class="form-control col-sm-5"><%=qna.getTitle()%></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 control-label" >내용</label>
                    <div class="col-sm-8" style="word-break: break-all;">
                        <textarea cols="30" rows="15" name="contents" class="form-control col-sm-5"><%=qna.getContents()%></textarea>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-12 text-center" style="border-top: 1px solid #000000; margin-top: 35px;padding-top: 25px">
                        <button type="submit" id="okbtn" class="btn btn-primary"><i class="fa fa-check"> 작성완료</i></button>
                        <button type="button" class="btn btn-danger" id="cancelbtn"><i class="fa fa-times"> 취소하기</i></button>
                    </div>
                </div>
                <% } %>
            </form>
        </div>
    </div>

    <%@ include file = "../layout/footer.jsp"%>
</div>
<script>
    // 상단 로그아웃 버튼
    $(function () {
        $('#logoutbtn').on('click', function (e) {
            location.href = '/ttpro/login/logout.jsp';
        });
    });
</script>
</body>
</html>
