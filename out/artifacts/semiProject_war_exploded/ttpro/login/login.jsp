<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>착한아이</title>

</head>
<body style="width: 100%; margin: 0 auto;">
<div class="container">
<%@include file="../layout/header.jsp"%>
    <div id="main">
        <form id="loginfrm" name="loginfrm" action="proclogin.jsp" method="post" style="margin: 100px 0 0 18%;">
            <div class="form-group row text-center">
                <label for="uid" class="col-form-label col-4" style="text-align: right;">아이디</label>
                <input type="text" id="uid" name="userid" class="form-control col-3 " placeholder="아이디를 입력하세요">
                <div id="idmsg" class="col-md-12 text-center" style="color: #ff0000;"></div>
            </div>

            <div class="form-group row text-center">
                <label for="pwd" class="col-form-label col-4"style="text-align: right;">비밀번호</label>
                <input type="password" id="pwd" name="passwd" class="form-control col-3" placeholder="비밀번호를 입력하세요">
                <div id="pwmsg" class="col-md-12 text-center" style="color: #ff0000;"></div>
            </div>

            <div class="form-group row">
                <div class="col-4"></div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input">
                    <label class="form-check-label">로그인상태 유지</label>
                </div>
            </div>
            <div class="text-center" style="margin-right: 20%;">
                <button type="button" class="btn btn-danger" id="loginbtn">로그인</button>
                <button type="button" class="btn btn-success">아이디/비밀번호 찾기</button>
            </div>
        </form>
    </div>
    <%@include file="../layout/footer.jsp"%>

</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="../js/loginfrm.js"></script>

<script>
    <%--상단 로그인 버튼--%>
    $(function() {
        $('#mloginbtn').on('click',function(e) {location.href='/ttpro/login/login.jsp';});
    });
    $(function() {
        $('#joinbtn').on('click',function(e) {location.href='/ttpro/signup/signagree.jsp';});
    });
</script>

</body>
</html>