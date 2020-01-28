<%@ page contentType="text/html; charset=UTF-8"%>

<%
    request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        body {width: 100% ;margin: 0 auto; text-align: center;}
        h3 {color: #85144b; font-size: 14pt; margin:10px auto; padding: 10px;}

        .menubar { margin:0 auto; width: 100%;}
        .menubar ul{ list-style: none; }
        .menubar ul li { font-size: 15px; float: left; text-align: left; margin-right: 85px; text-decoration: none; }
        .menubar li ul { background-color: rgba( 150, 150, 150, 0.5 ); display:none;
            height:auto; position:absolute; width:220px; z-index:200;
            list-style: none;}
        .menubar li:hover ul { display:block; }
        .menubar a:link {color: #000000}
        .menubar a:visited {color: #000000}

        .ttext {text-align: center; margin-left: 40px}
        .ttext #h11 {font-weight: bold; font-size: 70px; line-height: 95px; margin: 50px 0 20px}
        .ttext #h51 {font-weight: bold; margin-bottom: 20px}

        .ttext .h12 {font-weight: bold; font-size: 40px; line-height: 95px; margin: 50px 0 10px}
        .ttext .h52 {font-weight: bold; margin-bottom: 20px}

        .ttext #searchbox {width: 850px; height: 50px; margin-bottom: 20px; border: 3px solid #000033;}

        #searchbtn {width: 80px; height: 50px; font-weight: bold; color: #ffffff; border: 1px solid #000000 ;
                    border-radius: 10px; background-color: #000000; margin-right: 30px; padding: 12px 23px}
        #searchbtn > a {color: #ffffff}
        #searchbtn > a :link {color: #ffffff}

        #submsbtn {width: 60px; height: 25px; color: #ffffff; font-size: 10pt;
                    border-radius: 5px; background-color: #f0dc00; margin-right: 13px; padding : 0}
        #submsbtn > a {color: #ffffff}
        #submsbtn > a :link {color: #ffffff}

        #intr1 {width: 400px; height: 400px; background-color: #d3d3d3; position: relative; top: 50px; left:150px ; z-index: 2; }
        #intr1 h3 {font-weight: bold;font-size: 45px; padding: 20px;text-align: left;color: #000000;}
        #intr1 p {font-size: 17px;padding: 20px}
        #intrimg {width: 500px; height: 500px; border: 1px solid #000000; position: relative; top: 0; left: 65px}

        .prclist {float: left;}
        #prclist {margin-left: 123px;}
        .prclstti {width: 290px; height: 100px; background-color: #d3d3d3; font-size: 23px; font-weight: bold; padding-top: 30px;}
        .prclstctn {width: 290px; height: 290px; border: 1px solid #000000;}

        .banner {position: relative; left: 120px;  width: 900px; height: 450px; border: solid 0.1mm #ededed ;  padding:0; overflow: hidden;}
        .banner ul {position: absolute; margin: 0; padding:0; list-style: none; }
        .banner ul li {float: left; width: 900px; height: 450px; margin:0; padding:0;}

        .img{position: relative; background-image: url("https://drive.google.com/uc?export=view&id=1Gmm6_D7xp1ktNUlVOEKSz-BAfeU7OVdS"); height: 450px; background-size: cover;
            margin: 50px 0; }
        .img-cover{ position: absolute; height: 450px; width: 100%; background-color: rgba(0, 0, 0, 0.7); z-index:1; }
        .img .content{ position: absolute; top:50%; left:50%; transform: translate(-50%, -50%); font-size:1.5rem; color: white; z-index: 2; text-align: center; font-weight: bold; }

        .qstn {font-weight: bold; margin-bottom: 40px}

        #msg {}
    </style>
    <title>착한아이</title>

</head>
<body>
<div class="container">
    <%@include file="layout/header.jsp"%>
    <div id="main">
        <div class="ttext">
            <h1 id="h11">착한아이 홈페이지에<br> 오신 것을 환영합니다</h1>
            <h5 id="h51"> 오늘 변화를 만들어보세요</h5>
        </div>

        <div class="row col-12">
            <div class="banner" style="width: 900px;">
                <ul style="width: 500px">
                    <li><img src="https://drive.google.com/uc?export=view&id=1s9ucxHDCmHCscnaspxUhpKuYNJX0j8Ub" width="100%" height="auto"></li>
                    <li><img src="https://drive.google.com/uc?export=view&id=1OVyd8NyOZdxK0w9_MM3-4MBMeEkErBmp" width="100%" height="auto"></li>
                    <li><img src="https://drive.google.com/uc?export=view&id=1sfD09zQUtYtFq4JxGjkL5kUuaZO15dHb" width="100%" height="auto"></li>
                    <li><img src="https://drive.google.com/uc?export=view&id=19MBgICx2bN73scdMGn_v6812q24yJVEB" width="100%" height="auto"></li>
                    <li><img src="https://drive.google.com/uc?export=view&id=1lLWyEwFYUhBDIuD-GY5kLlv_F9ylSRF9" width="100%" height="auto"></li>
                </ul>
            </div>
        </div>


        <div class="ttext">
            <h1 class="h12">분양게시판</h1>
            <h5 class="h52">함께 세상을 바꿔요.</h5>

            <div>
                <input type="text" name="searchbox" id="searchbox" placeholder=" 검색하실 품종/이름을 입력해주세요">
                <span class="btn" name="searchbox" id="searchbtn"><a href="procNaver.jsp"> 검색 </a></span>
            </div>

        </div>

        <div class="row">
            <div class="prclist" id="prclist">
                <div class="prclstti"><p>동물 보호소</p></div>
                <div class="prclstctn"><img src="https://drive.google.com/uc?export=view&id=1MhV4gaqIq1jRoERTqEDF9sgJ0aniwoiJ" width="290" height="290" ></div>
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
            <div class="col-sm-12">
                <h1 class="qstn">문의</h1>
                <p>서울특별시 종로구 삼일대로 17길 51<br><br>
                    micres89@gmail.com<br><br>
                    02-0000-0000
                </p>
            </div>
        </div>
        <form class="row">
            <div class="col-sm-9"></div>
            <div class="col-sm-3" style="position: fixed; bottom: 20px; right: -90px; z-index: 999">
                <div class="form-group" style=" text-align: left; ">
                    <span style="width:150px; margin: 0 0 10px -10px; padding: 4px; background-color: #ffea00; border-radius: 3px; font-size: 11pt">
                    무엇이든 물어보세요
                    </span>
                </div>
                <div class="form-group" style="">
                    <span id="client" style="width:150px; margin: 0 10px 0 0; padding: 4px; background-color: #f7ffff; border-radius: 3px; font-size: 11pt">
                        클라이언트 내용입니다.
                    </span>
                </div>
                <div class="form-group" style=" text-align: left; ">
                    <span id="server" style="width:150px; margin: 0 0 10px -10px; padding: 4px; background-color: #ffea00; border-radius: 3px; font-size: 11pt">
                    무엇이든 물어보세요
                    </span>
                </div>
                <div class="row  form-group" style="">
                    <textarea placeholder="  메세지를 입력하세요" cols="30" rows="2" id="msg"
                              style="width: 200px; height:80px; margin-bottom: 10px; border: 1px solid #bbbbbb; margin-right: 10px"></textarea>
                    <span class="btn" id="submsbtn"><a href="#">보내기</a></span>
                </div>
            </div>
        </form>   <%-- 채팅창 --%>

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
    $(function () {
        $('#mloginbtn').on('click', function (e) {
            location.href = '/ttpro/login/login.jsp';
        });
    });
    // 회원가입 버튼
    $(function () {
        $('#joinbtn').on('click', function (e) {
            location.href = '/ttpro/signup/signagree.jsp';
        });
    });
</script>

</body>
</html>