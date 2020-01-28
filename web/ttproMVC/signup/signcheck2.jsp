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
<body>
<jsp:include page="../layout/header.jsp"/>
    <div class="container">
        <div class="main">
            <div style="padding:30px 0"><i class="fa fa-users fa-2x">회원가입</i></div>
            <nav aria-label="breadcrumb">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item active"><span class="badge badge-success" style="padding: 5px">이용약관</span></li>
                    <li class="breadcrumb-item active"><span class="badge badge-success" style="padding: 5px">실명확인</span></li>
                    <li class="breadcrumb-item"><span class="badge badge-light" style="padding: 5px">정보입력</span></li>
                    <li class="breadcrumb-item"><span class="badge badge-light" style="padding: 5px">가입완료</span></li>
                </ul>
            </nav>
            <div style="margin: 50px 0 20px 0">
                <h2>가입인증</h2>
                <small class="text-muted">안전한 회원가입을 위해 휴대폰 인증을 진행해 주세요.</small>
            </div>

            <div class="alert alert-danger" role="alert" style="margin: 10px 30px 20px 50px">
                <ul style="margin: 0 0 -5px -15px">
                    <li style="list-style: none; margin: -10px 0 0 -20px;"><span class="badge badge-danger">중요한 내용!</span></li>
                    <li>극소수 익명 사용자의 대량가입으로 인한 피해를 방지하기 위하여 가입인증을 시행하고 있습니다.</li>
                    <li>통신사의 사정으로 휴대폰 인증을 위한 메시지가 지연 발송될 수도 있습니다.</li>

                </ul>
            </div>
            <!--휴대폰번호 입력-->
            <div class="card card-body bg-ligt" style="margin: 10px 30px 20px 50px">
                <h3><span class="badge badge-pill badge-danger">1</span>휴대폰 정보</h3>
                <form>
                    <div class="row">
                        <div class="col"></div>
                        <div class="col-5" style="margin-top: 20px">
                            <div class="form-group row">
                                <label for="hp1" class="col-4 col-form-label">휴대폰 번호</label>
                                <select id="hp1" class="col-3 form-control"><option>국번</option>
                                    <option>010</option><option>011</option><option>017</option></select>&nbsp;
                                <label class="col-form-label">&dash;</label>&nbsp;
                                <input type="text" class="form-control col-2" name="hp2">&nbsp;
                                <label class="col-form-label">&dash;</label>&nbsp;
                                <input type="text" class="form-control col-2" name="hp3">
                            </div>
                        </div>
                        <div class="col-5">
                            <ul>
                                <li>메시지 수신 가능한 휴대폰으로 인증번호를 받을 수 있습니다.</li>
                                <li>휴대폰 번호 입력 후 '인증번호 요청하기' 버튼을 눌러 주세요.</li>
                            </ul>
                        </div>
                        <div class="col"></div>
                    </div>
                    <div class="row">
                        <div class="col-12 text-center">
                            <button type="button" class="btn btn-warning"><i class="fa fa-check"> 인증번호 요청하기</i></button>
                        </div>
                    </div>
                </form>
            </div>

            <!--인증번호 입력-->
            <div class="card card-body bg-ligt" style="margin: 10px 30px 20px 50px">
                <h3><span class="badge badge-pill badge-danger">2</span>휴대폰 가입인증</h3>
                <form>
                    <div class="row">
                        <div class="col"></div>
                        <div class="col-5" style="margin-top: 70px">
                            <div class="form-group row">
                                <label for="vcode" class="col-4 col-form-label">인증번호</label>
                                <input type="text" id="vcode" class="form-control col-3">
                            </div>

                        </div>
                        <div class="col-5">
                            <ul>
                                <li>휴대폰으로 받은 인증번호 입력 후 확인을 눌러주세요.</li>
                                <li>인증번호가 도착하지 않는다면 재이증을 시도해 주십시오.</li>
                                <li>재인증 실패시 통신사에 문의하시기 바랍니다.</li>
                                <li>통신사 문의 전 스팸문자함, 메세지함 용량 초과 여부, 차단설정을 확인해 주십시오.</li>
                            </ul>
                        </div>
                        <div class="col"></div>
                    </div>
                    <div class="row">
                        <div class="col-12 text-center">
                            <button type="button" id="signbtn2" class="btn btn-success"><i class="fa fa-check"> 입력완료</i></button>
                            <button type="button" class="btn btn-danger"><i class="fa fa-times"> 취소하기</i></button>
                        </div>
                    </div>
                </form>
            </div>

        </div>

    </div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="../../js/loginfrm.js"></script>
<script>
    $(function() {
        $('#signbtn2').on('click',function(e) {location.href='inputjoin.jsp';});
    });
</script>
</body>
</html>