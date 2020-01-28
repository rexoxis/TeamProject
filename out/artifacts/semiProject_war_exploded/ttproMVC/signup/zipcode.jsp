<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.ZipCode" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="gmdao" class="dao.goodMembersDAO"/>
<%
    request.setCharacterEncoding("utf-8");

    String findaddr = request.getParameter("findaddr");

    // 검색어 기본은 강남구로 설정
    if (findaddr == null){
        findaddr = "강남구";
    }
    // 우편번호 조회 메소드 호출
    ArrayList<ZipCode> ziplists = gmdao.searchZipCode(findaddr);

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

    <title>우편번호 찾기</title>
</head>
<body onresize="parent.resizeTo(700,750)" onload="parent.resizeTo(700,750)">
<div class="container">
    <h2 style="margin-top: 20px">우편번호 찾기</h2>
    <form id="zipcode" name="zipcode" action="zipcode.jsp" method="post">
        <div class="col-sm-12">
            <h4 class="text-left" style="font-size: 15pt; margin-left: -10px">검색하실 주소를 입력하세요</h4>
        </div>
        <div class="row">
            <div class="col-sm-7">
                <input type="text" id="findaddr" name="findaddr" class="form-control">
            </div>
            <div class="col-sm-4">
                <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> 검색하기</button>
            </div>
        </div>
    </form>
    <div class="row">
        <div class="col-sm-12">
            <span>지역의 구/동의 이름을 입력하신 후, <span style="font-weight: bold">[검색하기]</span> 버튼을 클릭하세요. <br></span>
            <span style="font-size: 9pt; color: red;">예1) 중구 필동, 예2) 강북구 미아동</span>
            <div class="row" style="margin:30px 0 0 1px;">
                <div>우편번호</div>
                <div style="margin-left: 2px;">시/도</div>
                <div style="margin-left: 2px;">구/군</div>
                <div style="margin-left: 13px;">동/리</div>
                <div style="margin-left: 40px;">번지</div>
            </div>
            <form id="zipcodefrm" name="zipcodefrm">
            <select id="ziplist" size="15">
            <% for (ZipCode z : ziplists) { %>
                <%
                    String ri = z.getRi();
                    String bunji = z.getBunji();

                    if(ri == null || ri.equals("")){
                        ri = "";
                    }

                    if(bunji == null || bunji.equals("")){
                        bunji = "";
                    }

                    String resultAddr = z.getZipcode()+" "+z.getSido()+" "+z.getGugun()+" "+z.getDong()+" "+ri+" "+bunji;
                %>

                <option value="<%=resultAddr%>"><%=resultAddr%></option>
            <% } %>
            </select>
                <div class="row" style="margin-left: 30%; margin-top: 30px;">
                    <button type="button" id="zipfix" class="btn btn-primary">선택하기</button>&nbsp;
                    <button type="button" id="nzipfix" class="btn btn-danger">취소하기</button>
                </div>
            </form>
        </div>
    </div>
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

    // 취소버튼
    $(function() {
        $('#nzipfix').on('click',function(e) {window.close()});
    });

    // 값을 선택했을때 회원가입창으로 선택한 값을 전달
    var zipfi = document.getElementById("zipfix");
    zipfi.addEventListener("click", zipcodefix);
    
    function zipcodefix() {
        var ziplist = document.getElementById("ziplist");
        var resultAddr = ziplist.options[ziplist.selectedIndex].value;
        var resultList = resultAddr.split(" ");

        // 선택한 주소 자동입력 (번지 제외)
        alert(resultList[1]+" "+resultList[2]+" "+resultList[3]+" "+resultList[4]);
        opener.document.joinfrm.zip.value = resultList[0]
        opener.document.joinfrm.addr1.value = resultList[1]+" "+resultList[2]+" "+resultList[3]+" "+resultList[4];
        self.close();
    }

</script>

</body>
</html>
