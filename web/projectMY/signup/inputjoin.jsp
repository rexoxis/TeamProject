<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--<link rel="stylesheet" href="../bs4/css/bootstrap.css">-->
    <!--<link rel="stylesheet" href="../bs4/fontawesome4/css/font-awesome.min.css">-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>착한아이</title>
    <!--<link rel="stylesheet" href="index.css">-->

</head>
<body>
<jsp:include page="../layout/header.jsp"/>
<div class="container">
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

            <form name="joinfrm" method="post" action="procjoin.jsp">
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
                            <label class="col-form-label">-</label>
                            <input type="password" id="jumin2" name="jumin2" class="form-control col-2">

                        </div>


                        <div class="form-group row">
                            <label for="userid" class="col-2 col-form-label text-right">아이디</label>
                            <input type="text" id="userid" maxlength="16" class="form-control col-3" name="userid">
                            <label class="col-form-label col-7">
                                6_16자의 영문 소문자, 숫자와 특수기호(_)만 사용할 수 있습니다.
                            </label>

                        </div>
                        <div class="form-group row">
                            <label for="passwd" class="col-2 col-form-label text-right">비밀번호</label>
                            <input type="password" id="passwd" name="passwd" maxlength="16" class="form-control col-3">
                            <label class="col-form-label col-7">
                                6_16자의 영문 대소문자,숫자 및 특수문자 사용할 수 있습니다.
                            </label>
                        </div>

                        <div class="form-group row">
                            <label for="repasswd" class="col-2 col-form-label text-right">비밀번호 확인</label>
                            <input type="password" id="repasswd" name="repasswd" maxlength="16" class="form-control col-3">
                            <label class="col-form-label col-7">
                                이전 항목에서 입력했던 비밀번호를 한번 더 입력하세요.
                            </label>
                        </div>

                        <div class="form-group row">
                            <label for="zip1" class="col-2 col-form-label text-right">우편번호</label>
                            <input type="text" id="zip1" name="zip1" class="form-control col-1">
                            <label class="col-form-label">-</label>
                            <input type="text" id="zip2" name=zip2 class="form-control col-1">&nbsp;
                            <button class="btn btn-dark" type="button" data-toggle="modal" data-target="#zipcode">
                                <i class="fa fa-question-circle">&nbsp;우편번호 찾기</i>
                            </button>
                        </div>

                        <div class="form-group row">
                            <label for="addr1" class="col-2 col-form-label text-right">주소</label>
                            <input type="text" id="addr1" name="addr1" class="form-control col-4">
                            &nbsp;
                            <input type="text" id="addr2" name="addr2" class="form-control col-4">

                        </div>

                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right " for="email1">
                                전자우편 주소
                            </label>
                            <input type="text" id="email1" name="email1" class="form-control col-2">
                            <div class="input-group-append">
                                <span class="input-group-text">@</span>
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
                            </select>
                            <label class="col-form-label">-</label>
                            <input type="text" id="hp2" name="tel2" class="form-control col-1">
                            <label class="col-form-label">-</label>
                            <input type="text" id="hp3" name="tel3" class="form-control col-1">

                        </div>

                        <div class="form-group row">
                            <label for="cap" class="col-form-label col-2">
                                자동 가입방지
                            </label>
                            <img src="../img/captcha.png" width="50%" style="margin-bottom: 10px">
                            <input type="text" id="cap" class="form-control col-4" style="margin-left: 155px">&nbsp;
                            <button class="btn btn-dark">
                                <i class="fa fa-refresh"></i> 다른 captcha 보기
                            </button>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-top:85px">
                    <div class="col-12 text-center">
                        <button type="button" id="newjoinbtn" class="btn btn-success"><i class="fa fa-check"> 입력완료</i>
                        </button>
                        <button type="button" class="btn btn-danger"><i class="fa fa-times"> 취소하기</i></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <%@include file="../layout/footer.jsp"%>
</div>
<%--우편번호 찾기 모달창--%>
<div id="zipcode" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">우편번호 찾기</h3>
                    <button type="button" class="btn btn-light" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row" style="margin-top: 10px">
                            <div class="col-1"></div> <!-- 의도적으로 띄워놓은 부분-->
                            <div class="col-3">
                                <label for="dong" class="text-right" style="margin-top: -5px">
                                    검색하실 주소의<br> 동이름을 입력하세요
                                </label>
                            </div>
                            <div class="col-4">
                                <input type="text" id="dong" class="form-control">
                            </div>
                            <div class="col-3">
                                <button type="button" class="btn btn-primary"><i class="fa fa-search"></i>검색하기</button>
                            </div>
                            <div class="col-1"></div> <!-- 의도적으로 띄워놓은 부분-->
                        </div>
                        <hr class="my-3">
                        <div class="row">
                            <div class="col"></div>
                            <div class="col-10">
                                <p>지역의 읍/면/동의 이름을 공백없이 입력하신 후, [검색하기] 버튼을 클릭하세요</p>
                                <select id="ziplist" size="5" class="form-control col-11">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                    <option>6</option>
                                    <option>7</option>
                                    <option>8</option>
                                    <option>9</option>
                                    <option>10</option>
                                </select>
                            </div>
                            <div class="col"></div>

                        </div>

                    </form>

                </div> <!--https://www.google.com/recaptcha/intro/v3.html-->

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
<script src="../js/joinfrmcheck.js"></script>

<script>
    $(function () {
        $('#newjoinbtn').on('click',joinfrmcheck);
    });
</script>


</body>
</html>

