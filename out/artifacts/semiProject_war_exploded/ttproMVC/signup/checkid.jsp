<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="gmdao" class="dao.goodMembersDAO"/>

<%
    request.setCharacterEncoding("utf-8");
    // 자바스크립트를 통해 url로 넘어온 inputID
    String inputID = request.getParameter("inputID");
    System.out.println("자바스크립트로 넘어온 ID : " + inputID);
    String resultID = gmdao.checkID(inputID);

    System.out.println("checkID메소드 실행 후 ID : " + resultID);

%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/ttpro/css/bootstrap-4.3.1-dist/css/bootstrap.min.css">

    <title>아이디 중복 확인</title>
</head>
<body onresize="parent.resizeTo(500,300)" onload="parent.resizeTo(500,300)">

    <div class="container">
        <div style="text-align: center; margin-top: 40px">
            <% if (resultID.equals(inputID)) { %>
            <div>
                <h4><span style="color: red">중복된</span> 아이디입니다.</h4>
                <span>다른 아이디를 확인해 주시기 바랍니다.</span>
            </div>
            <button type="button" class="btn btn-danger" id="closebtn">닫기</button>
            <% } else { %>
            <div>
                <h4><span style="color: red">사용 가능</span>한 아이디입니다.</h4>
                <span>"<span style="font-weight: bold"><%=inputID%></span>" 를 사용하시겠습니까?</span>
            </div>
            <input type="hidden" id="useid" value="<%=inputID%>">
        </div>

        <div class="row" style="margin: 20px 0 0 20%">
            <button type="button" class="btn btn-primary" id="useidbtn">입력한 아이디 사용하기</button> &nbsp;&nbsp;
            <button type="button" class="btn btn-danger" id="closebtn">닫기</button>
        </div>
        <% } %>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
    $(function() {
        $('#closebtn').on('click',function(e) {
            opener.document.joinfrm.userid.value = "";
            self.close()
        });
    });


    var useidbtn = document.getElementById("useidbtn");
    useidbtn.addEventListener("click", inputuseid);

    function inputuseid() {
        var useid = document.getElementById("useid").value;

        opener.document.joinfrm.userid.value = useid;

        self.close();
    }
</script>

</body>
</html>