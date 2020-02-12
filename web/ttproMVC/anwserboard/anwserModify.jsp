<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.AnwserBoard" %>
<%@ page contentType="text/html; charset=utf-8"%>

<%
    ArrayList<AnwserBoard> anwserLists = (ArrayList)session.getAttribute("anwserLists");
%>
<html>
<head>
    <link rel ="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Anwser 수정하기</title>
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
            <% for (AnwserBoard anwserBoard : anwserLists) { %>
            <form method="post" action="procAnwserModify.do?bdno=<%=anwserBoard.getAnwser_bdno()%>" name="qnaModifyfrm" class="card card-body bg-light">
                <input type="hidden" id="userid" name="userid" class="form-control col-9" value="<%=anwserBoard.getAnwser_userid()%>">
                <div class="form-group row">
                    <label class="col-sm-2 control-label" >이름</label>
                    <div class="col-sm-3">
                        <div name="name"><%=anwserBoard.getAnwser_userid()%></div>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 control-label" >제목</label>
                    <input name="title" class="form-control col-sm-9"><%=anwserBoard.getAnwser_title()%>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 control-label" >내용</label>
                        <textarea cols="30" rows="15" name="contents" class="form-control col-sm-9"><%=anwserBoard.getAnwser_contents()%></textarea>
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
    // 작성취소 버튼
    $(function () {
        $('#cancelbtn').on('click', function (e) {
            history.back();
        });
    });
    // 목록 버튼
    $(function () {
        $('#listbtn').on('click', function (e) {
            location.href = 'qnaList.do';
        });
    });

    // 수정 권한 제한
    var uid = "";

    if ("<%=uid%>" != null) {
        uid = "<%=uid%>";
    }

    var writer = document.qnaModifyfrm.userid.value;

    if (uid != writer) {
        alert('수정 권한이 없습니다.');
        history.back();
    }

</script>
</body>
</html>
