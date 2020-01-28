<%@ page contentType="text/html; charset=UTF-8" %>

<%
    request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head lang="ko">
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>착한아이</title>

</head>
<body>
<div class="container">
    <%@include file="../layout/header.jsp" %>
    <div class="main">
        <div style="padding:30px 0"><i class="fa fa-users fa-2x">회원가입</i></div>

        <nav aria-label="breadcrumb">
            <ul class="breadcrumb">
                <li class="breadcrumb-item active"><span class="badge badge-success" style="padding: 5px">이용약관</span>
                </li>
                <li class="breadcrumb-item active"><span class="badge badge-success" style="padding: 5px">실명확인</span>
                </li>
                <li class="breadcrumb-item active"><span class="badge badge-success" style="padding: 5px">정보입력</span>
                </li>
                <li class="breadcrumb-item"><span class="badge badge-light" style="padding: 5px">가입완료</span></li>
            </ul>
        </nav>

        <div style="margin: 55px 0 20px 0">
            <h2>회원정보입력</h2>
            <small class="text-muted">회원정보는 개인정보 취급방침에 따라 안전하게 보호되며, 회원님의 명백한 동의없이 공개 또는 제3자에게 제공되지 않습니다.</small>
        </div>

        <div class="card card-body bg-light" style="margin: 10px 30px 20px 50px">

            <h3>일반회원</h3>

            <form name="joinfrm" method="post" action="procsign.jsp">
                <div class="row" style="margin-top: 30px">
                    <div class="col"></div>
                    <div class="col-11">
                        <div class="form-group row">
                            <label for="name" class="col-2 col-form-label text-right">이름</label>
                            <input type="text" id="name" name="name" class="form-control col-2">
                        </div>

                        <div class="form-group row">
                            <label for="jumin1" class="col-2 col-form-label text-right">주민등록번호</label>
                            <input type="text" id="jumin1" name="jumin1" class="form-control col-2">
                            <label class="col-form-label">&nbsp;-&nbsp;</label>
                            <input type="password" id="jumin2" name="jumin2" class="form-control col-2">
                        </div>

                        <div class="form-group row">
                            <label for="userid" class="col-2 col-form-label text-right">아이디</label>
                            <input type="text" id="userid" maxlength="16" class="form-control col-3" name="userid">&nbsp;&nbsp;
                            <button type="button" class="btn btn-primary col-2" id="checkid">중복체크</button>
                            <label class="col-form-label col-4" style="font-size: 9pt; color: #ff0000">
                                * 6_16자의 영문 소문자, 숫자만 사용할 수 있습니다.
                            </label>
                        </div>

                        <div class="form-group row">
                            <label for="passwd" class="col-2 col-form-label text-right">비밀번호</label>
                            <input type="password" id="passwd" name="passwd" maxlength="16" class="form-control col-3">
                            <label class="col-form-label col-7" style="font-size: 9pt; color: #ff0000">
                                * 6_16자의 영문 대소문자,숫자 및 특수문자 사용할 수 있습니다.
                            </label>
                        </div>

                        <div class="form-group row">
                            <label for="repasswd" class="col-2 col-form-label text-right">비밀번호 확인</label>
                            <input type="password" id="repasswd" name="repasswd" maxlength="16"
                                   class="form-control col-3">
                            <label class="col-form-label col-7" style="font-size: 9pt; color: #ff0000">
                                * 이전 항목에서 입력했던 비밀번호를 한번 더 입력하세요.
                            </label>
                        </div>

                        <div class="form-group row">
                            <label for="zip" class="col-2 col-form-label text-right">우편번호</label>
                            <input type="text" id="zip" name="zip" class="form-control col-2">&nbsp;
                            <button class="btn btn-dark" type="button" id="zipcodefind">
                                <i class="fa fa-question-circle">&nbsp;우편번호 찾기</i>
                            </button>
                        </div>

                        <div class="form-group row">
                            <label for="addr1" class="col-2 col-form-label text-right">주소</label>
                            <input type="text" id="addr1" name="addr1" class="form-control col-4">
                            &nbsp;
                            <input type="text" id="addr2" name="addr2" class="form-control col-4" placeholder="상세 주소 입력">

                        </div>

                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" for="email1">
                                전자우편 주소
                            </label>
                            <input type="text" id="email1" name="email1" class="form-control col-2">
                            <div class="input-group-append">
                                <span style="margin-top: 6px">&nbsp;@&nbsp;</span>
                            </div>
                            <input type="text" id="email2" name="email2" class="form-control col-2" readonly>&nbsp;
                            <select class="form-control col-2" id="sendemail" name="sendemail">
                                <option>선택하세요</option>
                                <option value="naver.com">naver.com</option>
                                <option value="daum.net">daum.com</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="myemail">직접입력</option>
                            </select>

                        </div>

                        <div class="form-group row">
                            <label for="hp1" class="col-2 col-form-label text-right">개인 연락처</label>
                            <select id="hp1" name="tel1" class="form-control col-2">
                                <option>선택하세요</option>
                                <option value="011">011</option>
                                <option value="010">010</option>
                                <option value="019">019</option>
                            </select>&nbsp;
                            <label class="col-form-label">-</label>&nbsp;
                            <input type="text" id="hp2" name="tel2" class="form-control col-1">&nbsp;
                            <label class="col-form-label">-</label>&nbsp;
                            <input type="text" id="hp3" name="tel3" class="form-control col-1">

                        </div>

                        <div class="form-group row">
                            <iframe src="showcaptcha.jsp" frameborder="0" scrolling="no"
                                    style="margin-left: 158px;" id="capimg"></iframe>
                            <div style="margin: 40px 0 0 15px;">
                                <button type="button" class="btn btn-dark" id="recta">
                                    <i class="fa fa-refresh"></i> 다른 captcha 보기
                                </button>
                            </div>
                        </div>
                        <div class="form-group row" style="margin-top: -60px;">
                            <label for="cap" class="col-2 col-form-label text-right">자동 가입방지</label>
                            <input type="text" id="cap" name="cap" class="form-control col-4">&nbsp;
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-top:40px">
                    <div class="col-12 text-center">
                        <button type="button" id="newjoinbtn" class="btn btn-success"><i class="fa fa-check"> 입력완료</i></button>
                        <button type="button" class="btn btn-danger"><i class="fa fa-times"> 취소하기</i></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <%@include file="../layout/footer.jsp" %>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="../js/joinfrmcheck.js"></script>

<script>
    $(function() {
        $('#newjoinbtn').on('click',joinfrmcheck)
    });
</script>
<script>
    //우편번호 찾기 클릭시 팝업창 띄움
    var zipcodefind = document.getElementById("zipcodefind");
    zipcodefind.addEventListener("click", zipcodepopup);

    function zipcodepopup() {
        var url = "/ttpro/signup/zipcode.jsp";
        window.open(url,"zipcode","width=700,height=500");
    }
</script>

<script>
    // 버튼 클릭시 captcha 이미지 새로고침 하는 코드
    var ctaloadbtn = document.getElementById("recta");
    ctaloadbtn.addEventListener("click", reloadcta);

    function reloadcta() {

        var url = "showcaptcha.jsp";
        $('#capimg').attr('src',url);
    }

</script>

<script>
    // 아이디 중복체크

    var checkbtn = document.getElementById("checkid");
    checkbtn.addEventListener("click", frmcheckid);

    function frmcheckid() {
        var inputID = frm.userid.value;
        var url = "/ttpro/signup/checkid.jsp?inputID=" + inputID;

        if (inputID == "") {
            alert('아이디를 먼저 입력해주세요.');
        } else if (!joinuidrex.test(inputID)) {
            alert('올바른 형식이 아닙니다.');
        } else {
            window.open(url,"checkid","width=350,height=150,left=885,top=465");
        }
    }

    // 상단 로그인 버튼
    $(function () {
        $('#mloginbtn').on('click', function (e) {
            location.href = '/ttpro/login/login.jsp';
        });
    });
</script>

</body>
</html>

