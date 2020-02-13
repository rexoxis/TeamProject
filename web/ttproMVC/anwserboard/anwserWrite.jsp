<%@ page contentType="text/html; charset=UTF-8" %>
<%
    int qnaBoard_bdno = Integer.parseInt(request.getParameter("qnaBoard_bdno"));
%>

<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Anwser New</title>
</head>
<style>
    body {
        width: 100%;
        margin: 0 auto;
    }
</style>

<body>
<div class="container">
    <%@ include file="../layout/header.jsp" %>

    <div class="main">  <!--https://glyphicons.com/-->
        <div class="col-8" style="font-size: 45px; margin: 0 20px 0 40px ; padding:30px 0 20px 0;">
            <i class="fa fa-exclamation-circle"> Anwser</i></div>


        <div class="row" style="margin: 10px 30px 20px 30px">
            <div class="col-6">
                <h4><i class="fa fa-plus-circle"></i> 새글쓰기</h4>
            </div>

            <div class="col-6 text-right">
                <button type="button" class="btn btn-success" id="listbtn">
                    <i class="fa fa-list"> 목록으로</i>
                </button>
            </div>
        </div> <!--버튼-->

        <div class="row" style="margin: 10px 30px 20px 30px">
            <form method="post" action="procAnwserWrite.do?qnaBoard_bdno=<%=qnaBoard_bdno%>" name="writefrm" class="card card-body bg-light">
                <div class="form-group row">
                    <label class="col-form-label col-2 text-right" for="wtitle">작성자</label>
                    <input type="text" id="userid" name="userid" class="form-control col-1" value="<%=uid%>" readonly>
                </div>

                <div class="form-group row">
                    <label class="col-form-label col-2 text-right" for="wtitle">제목</label>
                    <input type="text" name="title" id="wtitle" class="form-control col-9">
                </div>

                <div class="form-group row">
                    <label class="col-form-label col-2 text-right">본문내용</label>
                    <textarea rows="20" name="contents" id="wcontents" class="form-control col-9"></textarea>
                </div>

                <div class="form-group row">
                    <div class="col-12 text-center"
                         style="border-top: 1px solid #000000; margin-top: 35px;padding-top: 25px">
                        <button type="button" id="okbtn" class="btn btn-primary"><i class="fa fa-check"> 작성완료</i>
                        </button>
                        <button type="button" class="btn btn-danger" id="cancelbtn"><i class="fa fa-times"> 취소하기</i>
                        </button>
                    </div>
                </div>

            </form>
        </div>
    </div>
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
<script src="/ttproMVC/js/writefrmcheck.js"></script>
<script src="/ttproMVC/js/button.js"></script>

<script>
    // 작성취소 버튼
    $(function () {
        $('#cancelbtn').on('click', function (e) {
            location.href = 'qnaList.do';
        });
    });

    // 목록 버튼
    $(function () {
        $('#listbtn').on('click', function (e) {
            location.href = 'qnaList.do';
        });
    });

    // 미로그인시 접근제한
    var uid = <%=uid%>;

    if (uid === "" || uid == null) {
        alert('로그인 후 사용해주세요!');
        location.href='login.do';
    }

</script>


</div>
</body>
</html>