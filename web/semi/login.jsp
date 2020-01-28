<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head lang="ko">
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://use.fontawesome.com/2350369b5c.js"></script>

    <title>로그인</title>
</head>
<body>
<div class="container">
    <header>
        <div class="row">
            <div class="col-md-6">
                <h1><a href="index.jsp">Lorem Ipsum</a></h1>
            </div>
            <div class="col-md-6 text-right" >
                <button type="button" class="btn btn-primary" id="loginbtn">로그인</button>
                <button type="button" class="btn btn-danger" id="joinbtn">회원가입</button>
            </div>
        </div>

        <nav class="nav navbar-expand-md navbar-dark bg-dark">
            <ul class="nav navbar-nav nav-fill w-100">
                <li class="nav-item"><a class="nav-link" href="../intro.jsp" style="color: white">프로젝트소개</a></li>
                <li class="nav-item"><a class="nav-link" href="../join.jsp" style="color: white">회원가입</a></li>
                <li class="nav-item"><a class="nav-link" href="../list.jsp" style="color: white">게시판</a></li>
                <li class="nav-item"><a class="nav-link" href="../plist.jsp" style="color: white">자료실</a></li>
                <li class="nav-item"><a class="nav-link" href="../glist.jsp" style="color: white">갤러리</a></li>
                <li class="nav-item"><a class="nav-link" href="../admin.jsp" style="color: white">관리자</a></li>
            </ul>
        </nav>
    </header>

    <div id="main">
        <form id="loginfrm" name="loginfrm" method="post" action="proclogin.jsp" style="margin-top: 100px;">
            <div class="form-group row text-center">
                <label for="userid" class="col-form-label col-4">아이디</label>
                <input type="text" id="userid" name="userid" class="form-control col-3">
            </div>
            <div class="form-group row text-center">
                <label for="passwd" class="col-form-label col-4">비밀번호</label>
                <input type="password" id="passwd" name="passwd" class="form-control col-3">
            </div>
            <div class="form-group row">
                <div class="col-4"></div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input">
                    <label class="form-check-label">로그인상태 유지</label>
                </div>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-danger">로그인</button>
                <button type="button" class="btn btn-success">아이디/비밀번호 찾기</button>
            </div>
        </form>
    </div>

    <footer>
        <p class="text-right bg-light">
            &copy;Lorem Ipsum 2019 created by LeeSeungHoon. All Rights Reserved</p>
    </footer>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script>
    $(function () {
        $('#joinbtn').on('click', function (e) {
            location.href='agree.jsp';
        })
    });
</script>

</body>
</html>
