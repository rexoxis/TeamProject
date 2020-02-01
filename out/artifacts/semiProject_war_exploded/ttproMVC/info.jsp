<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>착한아이란?</title>
    <style>
        #a { color: #000000; text-decoration: none}
        #a :link { color: #000000}
    </style>

</head>

<body>
<div class="container">
    <%@ include file="layout/header.jsp"%>

    <div style=" margin-top: 50px">
        <h1 style="text-align: left; margin-left: 100px" >착한아이란?</h1> <br>
        <img src="https://drive.google.com/uc?export=view&id=1nVYc2lRu0GKniwbCBx-q_p7RMCYuHsAx" style="width: 700px;margin-left: 200px;"><br><br>
        <p style="text-align: left; margin-left: 200px">착한아이에 있는 모든 자견들은 주기적으로 건강검진과 예방접종을 하고있으며 자견의<br>
            건강에 힘쓰고 최선을 다하고 있습니다.
            <br><br>현 애완동물 피해규정인 15일을 철저하게 지키고있으며, 치사율 0%를 위해 1년 365일<br>
            자견의 건강관리와 사후관리에 노력하고 있습니다.<br>
            저희 착한아이 개발진 들은 동물들의 안전과 건전한 분양을 위해 최선을 다하도록 하겠습니다.<br><br>
            <a href= "javascript:a();" id="a" style="font-size: 9pt">착한아이 운영진 일동 ...</a></p>
        <div id="b" style="display: none; margin-left: 200px;">
            <img src="https://drive.google.com/uc?export=view&id=1HQKvY4Oe-8la9w8KHUSw7TLU9O5Yx3LD" style="width: 700px;">
        </div>
        <%@ include file="layout/footer.jsp"%>

    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        // 상단 로그인 버튼
        $(function() {
            $('#mloginbtn').on('click',function(e) {location.href='login/login.jsp';});
        });
        // 회원가입 버튼
        $(function() {
            $('#joinbtn').on('click',function(e) {location.href='signup/signAgree.jsp';});
        });

        var con = document.getElementById("b");
        function a() {
            if (con.style.display == 'none'){
                con.style.display = 'block';
            } else if (con.style.display == 'block'){
                con.style.display = 'none';
            }
        }
    </script>
</body>
</html>