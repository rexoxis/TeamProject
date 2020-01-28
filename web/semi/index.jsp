<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="ko">
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://use.fontawesome.com/2350369b5c.js"></script>

    <title>세미프로젝트</title>
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
        <div class="col-md-12 text-center">
            <h1>웹 프로젝트 시작</h1>
            <p>어떤 걸 주제로 만들 것인가 고민되네 진짜</p>
            <img src="../img/splash.png" width="70%">
            <p><button type="button" class="btn btn-success" style="margin-top: 20px;">지금 바로 시작하기</button></p>
        </div>
        <hr>

        <div class="row">
            <div class="col-md-4">
                <h2>극비</h2>
                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable</p>
                <p><button class="btn btn-light">자세히 보기&blacktriangleright;</button> </p>
            </div>
            <div class="col-md-4">
                <h2>극비</h2>
                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable</p>
                <p><button class="btn btn-light">자세히 보기&blacktriangleright;</button> </p>
            </div>
            <div class="col-md-4">
                <h2>극비</h2>
                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable</p>
                <p><button class="btn btn-light">자세히 보기&blacktriangleright;</button> </p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <h2>극비</h2>
                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable</p>
                <p><button class="btn btn-light">자세히 보기&blacktriangleright;</button> </p>
            </div>
            <div class="col-md-4">
                <h2>극비</h2>
                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable</p>
                <p><button class="btn btn-light">자세히 보기&blacktriangleright;</button> </p>
            </div>
            <div class="col-md-4">
                <h2>극비</h2>
                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable</p>
                <p><button class="btn btn-light">자세히 보기&blacktriangleright;</button> </p>
            </div>
        </div>
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
        $('#loginbtn').on('click', function (e) {
            location.href='login.jsp';
        })
    });

    $(function () {
        $('#joinbtn').on('click', function (e) {
            location.href='agree.jsp';
        })
    })
</script>
</body>
</html>
