<%@ page contentType="text/html; charset=UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/ttpro/css/bootstrap-4.3.1-dist/css/bootstrap.min.css">





<link rel="stylesheet" href="/common/css/sub.css?v=20190228" />
    <link rel="stylesheet" href="css/idxstyle.css">
    <title>찾아오시는길</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyAEliRFsZc8brfUFrvzy4ytB0NSz6xRtmU" ></script>
    <style>
        #map_ma {width:100%; height:350px; clear:both;}
    </style>
</head>
<body style="width: 100% ;margin:0 auto; text-align: center;">
<div class="container">
<%@include file="../layout/header.jsp"%>

<div class="text-left" style="float: left">

    <b style="color: darkslategrey;font-weight: bold;font-size: 50px">착한아이 동물분양센터</b>
    <p style="font-weight: bold;font-size: 25px">대표자: 김지섭<span>|</span>주소 : 서울특별시 종로구 삼일대로 17길 51, 3,4,5층(관철동, 스타골드빌딩)</p>


    <p style="font-weight: bold;font-size: 25px">착한아이 동물분양센터
    <strong><span>종각점</span>02.1234.1234</strong></p>
</div>
<div id="map_ma"></div>

    <%@include file="../layout/footer.jsp"%>


</div>

<script type="text/javascript">
    $(document).ready(function() {
        var myLatlng = new google.maps.LatLng(37.570754, 126.989117); // 위치값 위도 경도
        var Y_point			= 37.570754;		// Y 좌표
        var X_point			= 126.989117;		// X 좌표
        var zoomLevel		= 18;				// 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
        var markerTitle		= "서울특별시";		// 현재 위치 마커에 마우스를 오버을때 나타나는 정보
        var markerMaxWidth	= 300;				// 마커를 클릭했을때 나타나는 말풍선의 최대 크기

// 말풍선 내용
        var contentString	= '<div>' +
                '<h2>서울특별시</h2>'+
                '<p>안녕하세요. 더조은 컴퓨터아트학원입니다.</p>' +

                '</div>';
        var myLatlng = new google.maps.LatLng(Y_point, X_point);
        var mapOptions = {
            zoom: zoomLevel,
            center: myLatlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: markerTitle
        });
        var infowindow = new google.maps.InfoWindow(
                {
                    content: contentString,
                    maxWizzzdth: markerMaxWidth
                }
        );
        google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map, marker);
        });
    });




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


    // 새글쓰기
    $(function() {
        $('#newbtn').on('click',function(e)  {location.href='qWrite.jsp';});
    });

</script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="../../js/loginfrm.js"></script>
</body>
</html>
