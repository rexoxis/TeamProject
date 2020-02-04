<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.ReviewBoard" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ArrayList<ReviewBoard> reviewLists = (ArrayList)session.getAttribute("reviewLists");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="../css/bootstrap-4.3.1-dist/css/bootstrap.css">

    <title>ReviewBoard</title>
</head>

<body>
<div class="container">
    <%@include file="../layout/header.jsp" %>

    <div class="main">
        <div class="row">
            <div class="col-8 text-left" style="font-size: 25px; margin: 0 45px 0 50px ; padding:30px 0 20px 0;">
                <i class="fa fa-comments fa-2x"> Review</i></div>
            <div class="col-3">
                <button type="button" class="btn btn-success" id="listbtn" style="margin:40px 0 15px 110px; ">
                    <i class="fa fa-plus-circle"> 목록으로</i>
                </button>
            </div>
        </div>

        <div class="row" style="margin: 10px 30px 20px 50px">
            <%for(ReviewBoard reviewBoard : reviewLists) {%>
            <form class="card card-body bg-light" name="rbfrm" action="procReviewModify.do?bdno=<%=reviewBoard.getBdno()%>" method="post" enctype="multipart/form-data">
                <div class="form-group row">
                    <input type="hidden" id="userid" name="userid" class="form-control col-9" value="<%=reviewBoard.getUserid()%>">
                    <label class="col-sm-2 control-label text-right" >이름</label>
                    <div class="col-sm-3">
                        <div name="name"><%=reviewBoard.getUserid()%></div>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-form-label col-2 text-right" for="title">제목</label>
                    <input type="text" id="title" name="title" class="form-control col-9" value="<%=reviewBoard.getTitle()%>">
                </div>
                <div class="form-group row">
                    <label class="col-form-label col-2 text-right" for="contents">본문내용</label>
                    <textarea rows="20" type="text" id="contents" name="contents"
                              class="form-control col-9"><%=reviewBoard.getContents()%></textarea>
                </div>
                <div class="form-group row">
                    <label class="col-form-label col-2 text-right" for="contents">파일첨부1</label>
                    <input type="file" name="file1" value="<%=reviewBoard.getFile1()%>">
                    <label class="col-form-label col-2 text-right" for="contents">파일첨부2</label>
                    <input type="file" name="file2" value="<%=reviewBoard.getFile2()%>">
                    <label class="col-form-label col-2 text-right" for="contents">파일첨부3</label>
                    <input type="file" name="file3" value="<%=reviewBoard.getFile3()%>">
                    <label class="col-form-label col-2 text-right" for="contents">파일첨부4</label>
                    <input type="file" name="file4" value="<%=reviewBoard.getFile4()%>">
                    <label class="col-form-label col-2 text-right" for="contents">파일첨부5</label>
                    <input type="file" name="file5" value="<%=reviewBoard.getFile5()%>">
                </div>
                <% } %>
                <div class="form-group row">
                    <div class="col-12 text-center"
                         style="border-top: 1px solid #000000; padding-top: 20px; ">
                        <button type="submit" class="btn btn-primary" id="newbtn"><i class="fa fa-check"> 입력완료</i></button>
                        <button type="button" class="btn btn-danger" id="cancelbtn"><i class="fa fa-times"> 취소하기</i></button>
                    </div>
                </div>
            </form>
        </div>
    </div>


</div>
<%@include file="../layout/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
            location.href = 'reviewList.do';
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
