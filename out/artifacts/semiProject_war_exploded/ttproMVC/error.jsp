<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>착한아이</title>

</head>
<body style="width: 100%; margin: 0 auto;">
<div class="container">
<%@include file="layout/header.jsp"%>
    <div id="main">
        <div class="row" style="min-height: 350px;">
            <div class="col-md-12 text-center">
                <h1 class="display-3" style="margin-top: 50px;">찾으시려는 페이지가 없습니다. </h1>
                <h1 class="display-3" style="margin-top: 50px;">잘못된 접근입니다. </h1>
            </div>
        </div>
    </div>
<%@include file="layout/footer.jsp"%>

</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script>
    $(function() {
        $('#loginbtn').on('click',function(e) {location.href='login.jsp';});
    });
    $(function () {
        $('#relogin').on('click', function (e) {location.href='login.jsp';});
    });
</script>

</body>
</html>
