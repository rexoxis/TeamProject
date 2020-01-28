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
    <link rel="stylesheet" href="css/idxstyle.css">

</head>
<body>
<div class="container">
    <%@include file="layout/header.jsp"%>
    <div id="main">
        <div class="ttext">
            <h1 id="h11">착한아이 홈페이지에<br> 오신 것을 환영합니다</h1>
            <h5 id="h51"> 오늘 변화를 만들어보세요</h5>
        </div>

        <div class="row">
            <div class="banner">
                <ul>
                    <li><img src="https://drive.google.com/uc?export=view&id=1s9ucxHDCmHCscnaspxUhpKuYNJX0j8Ub" width="900" height="450px"></li>
                    <li><img src="https://drive.google.com/uc?export=view&id=1OVyd8NyOZdxK0w9_MM3-4MBMeEkErBmp" width="900" height="450px"></li>
                    <li><img src="https://drive.google.com/uc?export=view&id=1sfD09zQUtYtFq4JxGjkL5kUuaZO15dHb" width="900" height="450px"></li>
                    <li><img src="https://drive.google.com/uc?export=view&id=19MBgICx2bN73scdMGn_v6812q24yJVEB" width="900" height="450px"></li>
                    <li><img src="https://drive.google.com/uc?export=view&id=1lLWyEwFYUhBDIuD-GY5kLlv_F9ylSRF9" width="900" height="450px"></li>
                </ul>
            </div>
        </div>

        <div class="row">
            <div id="intr1">
                <h3>착한아이 한 눈에 살펴보기</h3>
                <p style="">착한아이에서는 세상을 바꾸는 데 필요한 것은
                    단순히 작은 도움의 손길이라는 것을 알게 되었습니다. 2000년에 설립된 이후, 긍정적인
                    영향력을 행사하기 위해 노력해왔습니다. 우리 활동의 핵심은 우리가 가진 새로운 아이디어와
                    열정을 다양한 활동에 접목하는 것입니다.
                    우리가 기울이는 모든 노력을 통해 우리의 신념 뒤에 숨겨진 확신을 보여주고자 합니다.</p>
            </div>
            <div id="intrimg">
                <img src="https://drive.google.com/uc?export=view&id=1FLVaTskaIo7Si4jtdICslIgXvnhV9x4D" width="500px" height="500px">
            </div>
        </div>


        <div class="ttext">
            <h1 class="h12">분양게시판</h1>
            <h5 class="h52">함께 세상을 바꿔요.</h5>
            <div>
                <input type="text" id="searchbox" placeholder=" 검색하실 품종/이름을 입력해주세요">
                <span class="btn btn1" id="searchbtn"> 검색</span>
            </div>
        </div>

        <div class="row">
            <div class="prclist">
                <div class="prclstti"><p>동물 보호소</p></div>
                <div class="prclstctn"><img src="https://drive.google.com/uc?export=view&id=1MhV4gaqIq1jRoERTqEDF9sgJ0aniwoiJ" width="290" height="290"></div>
            </div> &nbsp; &nbsp;
            <div class="prclist">
                <div class="prclstti">동물 구조 및 관리</div>
                <div class="prclstctn"><img src="https://drive.google.com/uc?export=view&id=1WWpAL6QuTpxN57c1zjB_EP44QGw2453w" width="290" height="290"></div>
            </div> &nbsp; &nbsp;
            <div class="prclist">
                <div class="prclstti">수의학 서비스</div>
                <div class="prclstctn"><img src="https://drive.google.com/uc?export=view&id=1EWpSJlaj6JtbmzxHVXCm0mkhLGESqWZs" width="290" height="290"></div>
            </div>
        </div>

        <div class="img">
            <div class="content" >
                "선한 일을 하다가 낙심하지 말라" <br><br>마틴 루터
            </div>
            <div class="img-cover"></div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <h1 class="qstn">문의</h1>
                <p>서울특별시 종로구 안국동 OO-OO, 110-240<br><br>
                    micres89@gmail.com<br><br>
                    02-0000-0000
                </p>
            </div>
            <div class="col-sm-6">
                <input type="text" placeholder="  이름" id="name">
                <input type="text" placeholder="  주소" id="add">
                <input type="text" placeholder="  이메일" id="email">
                <input type="text" placeholder="  전화번호" id="phon">
                <input type="text" placeholder="  제목" id="title">
                <textarea placeholder="  메세지를 입력하세요" cols="50" rows="4" id="msg">

                </textarea>
                <span class="btn btn1" id="submsbtn" >제출</span>
            </div>
        </div>
    </div>
    <%@include file="layout/footer.jsp"%>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script language="JavaScript">

    $(document).ready(function() {
        //사용할 배너
        var $banner = $(".banner").find("ul");

        var $bannerWidth = $banner.children().outerWidth();//배너 이미지의 폭
        var $bannerHeight = $banner.children().outerHeight(); // 높이
        var $bannerLength = $banner.children().length;//배너 이미지의 갯수
        var rollingId;

        //정해진 초마다 함수 실행
        rollingId = setInterval(function() { rollingStart(); }, 3000);//다음 이미지로 롤링 애니메이션 할 시간차

        //마우스 오버시 롤링을 멈춘다.
        $banner.mouseover(function(){
            //중지
            clearInterval(rollingId);
            $(this).css("cursor", "pointer");
        });
        //마우스 아웃되면 다시 시작
        $banner.mouseout(function(){
            rollingId = setInterval(function() { rollingStart(); }, 3000);
            $(this).css("cursor", "default");
        });

        function rollingStart() {
            $banner.css("width", $bannerWidth * $bannerLength + "px");
            $banner.css("height", $bannerHeight + "px");
            //alert(bannerHeight);
            //배너의 좌측 위치를 옮겨 준다.
            $banner.animate({left: - $bannerWidth + "px"}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
                //첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
                $(this).append("<li>" + $(this).find("li:first").html() + "</li>");
                //뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
                $(this).find("li:first").remove();
                //다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
                $(this).css("left", 0);
                //이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
            });
        }
    });

</script>

<script>
    // 상단 로그인 버튼
    $(function() {
        $('#mloginbtn').on('click',function(e) {location.href='/project/login/login.jsp';});
    });
    // 회원가입 버튼
    $(function() {
        $('#joinbtn').on('click',function(e) {location.href='/project/signup/signagree.jsp';});
    });
</script>

</body>
</html>