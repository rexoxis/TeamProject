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
            <div style="margin: 55px 0 20px 0">
                <h2>가입인증</h2>
                <small class="text-muted">회원으로 가입하는 방법에는 2가지 방법이 있습니다. 아래에서 원하는 방법을 선택해주세요.<br>
                    입력하신 정보는 가입완료 전까지 본 사이트에 저장되지 않습니다</small>
             </div>

            <div class="card card-body bg-light" style="margin: 10px 30px 20px 50px">
                <h3  style="padding: 0 0 15px 0">실명확인 회원가입</h3>
                <form>
                    <div class="row">
                        <div class="col"></div>
                        <div class="col-5" style="margin-top:30px">
                            <div class="form-group row">
                                <label for="male" class="col-4"  >고객유형</label>
                                <div class= "custom-control custom-radio" style="margin-right: 10px">
                                    <input type= "radio" id="custom1" name="male" class="custom-control-input" name="gender" value="m">
                                    <label for="custom1" class="custom-control-label">개인</label>
                                </div>

                                <div class="custom-control custom-radio" name="fmale">
                                    <input type="radio" id="custom2" class="custom-control-input" name="gender" value="f">
                                    <label for="custom2" class="custom-control-label">개인사업자</label>
                                </div>

                                <div class="custom-control custom-radio" name="fmale">
                                    <input type="radio" id="custom3" class="custom-control-input" name="gender" value="f">
                                    <label for="custom3" class="custom-control-label">법인사업자</label>
                                </div>


                            </div>






                            <div class="form-group row">
                                <label for="name" class="col-4 col-form-label">
                                    이름
                                </label>
                                <input type="text" id="name2" class="form-control col-6">
                            </div>

                            <div class="form-group row">
                                <label for="byear" class="col-4 col-form-label">
                                    생년월일
                                </label>
                                <select id="byear" class="form-control col-3" style="margin-right:6px "><option>년도</option><option>2019</option><option>2018</option><option>2017</option><option>2016</option></select>&nbsp;
                                <select id="bmonth" class="form-control col-2" style="margin-right:6px"><option>월</option><option>12</option><option>1</option><option>2</option><option>3</option></select>&nbsp;
                                <select id="bday" class="form-control col-2"><option>일</option><option>01</option><option>02</option><option>03</option><option>04</option></select>
                            </div>

                            <div class="form-group row">
                                <label for="male" class="col-4" >성별</label>
                                <div class= "custom-control custom-radio" style="margin-right: 10px">
                                    <input type= "radio" id="male" name="male" class="custom-control-input" name="gender" value="m">
                                    <label for="male" class="custom-control-label">남자</label>
                                </div>

                                <div class="custom-control custom-radio" name="fmale">
                                    <input type="radio" id="female" class="custom-control-input" name="gender" value="f">
                                    <label for="female" class="custom-control-label">여자</label>
                                </div>


                            </div>



                            <div class="form-group row">
                                <label for="jumin1" class="col-4 col-form-label">
                                    주민번호
                                </label>
                                <input type="text" id="jumin1" class="form-control col-3">&nbsp;
                                <label class="col-form-label">&mdash;</label>&nbsp;
                                <input type="text" id="jumin2" class="form-control col-3">
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-4"></label>
                                <div class= "custom-control custom-checkbox">
                                    <input type= "checkbox" id="usejm" name="usejm" class="custom-control-input" >
                                    <label for="usejm" class="custom-control-label">주민등록번호 처리에 동의 합니다</label>
                                </div>
                            </div>

                        </div>
                        <div class="col-5">
                            <ul>
                                <li>실명확인 외원가입시 공개 게시판 이용이 가능합니다</li>
                                <li>타인의 주민등록번호를 임의로 사용하면'주민등록법'에 의해 3년 이해의 징역 도는 1천만원 이하의 벌금이 부과될 수 있습니다.</li>
                                <li><span style="color: red"> 입력하신 주민등록번호는</span> 별도 저장되지 않으며 신용평가가관을 통한 실명확인용으로만 이요됨니다</li>
                                <li><span style="color: red"> 개인정보보호법에 따라</span> 이용 동의를 받습니다.</li>
                            </ul>
                        </div>
                        <div class="col"></div>
                    </div>
                    <div class="row">
                        <div class="col-12 text-center">
                            <button class="btn btn-primary"type="button" id="okbtn"><i class="fa fa-check"> 가입인증</i></button>
                            <button class="btn btn-danger"type="button"><i class="fa fa-remove"> 취소하기</i></button>
                        </div>
                    </div>
                </form>
            </div>



        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script>
            $(function() { /*함수실행 -> 조인btn에서 클릭이 발생되면 어그리html로 이동해라*/
                $('#okbtn').on('click', function(e) {location.href='signcheck2.jsp';});
            });

        </script>



    </div>











</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>



