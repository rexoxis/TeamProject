<%@ page contentType="text/html; charset=UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <link rel ="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {width: 100%; margin: 0 auto;}

        .list {float: left}
        .list > h3 {margin: 10px 0 10px 30px; font-weight: bold}
        .list > ul {list-style: none; text-align: left; text-decoration-line: none;}
        .list > ul > li {text-align: left; margin-left: 8px;}
        .list > ul > li > a {color: #000000}

        .faqs > h4 {width: 550px; text-align: left; font-weight: bold; font-size: 25px; color: #000030; border-bottom: 0.3mm solid #000030; padding:3px; margin-bottom: 20px}
        .faqs > div > ul {width: 700px ;text-align: left; margin:-8px 0 0 15px ;padding: 20px 30px 20px 40px}
        .faqs > div > ul > li {list-style-type: none; margin-bottom: 5px}
        .faqs > div > ul > li :hover {list-style-type: none; margin-bottom: 5px; padding: 5px ;background-color: rgba(0, 0, 150, 0.2);}
        .faqs > div > ul > li > a {color: #000000}

        .answer { display: none}
        .answer > h3 {width: 550px; text-align: left; font-weight: bold; font-size: 25px; color: #000030; border-bottom: 0.3mm solid #000030; padding:3px; margin: 30px 0 30px 0}
        .answer > .more > p {width: 550px; text-align: left; font-weight: bold; font-size: 20px; color: #000030; background-color: rgba(255,30,0,0.3) ;padding:5px 5px 5px 10px; margin: 30px 0 30px 15px}
        .answer > .more > .topbtn {margin: 30px 0 0 100px; position: fixed; bottom: 20px; right: 150px; z-index: 999;}
        .answer > .more > .topbtn > i > span {font-size: 8pt;}
        .answer > .more > p > a {color: #ff0000; font-weight: bold; border-bottom: 0.5mm solid #ff0000}
        .answer > .more > p > a:link {color: #ff0000;}
        .answer > .more > p > a:visited {color: #ff0000; text-decoration: none}

        #answer1 > div > p {width: 550px; text-align: center; font-size: 11pt; margin-top: 5px}
        #answer1 > div > img {width: 550px; height: auto; border: 1px solid #cdcdcd;}

        .ansimg1 > .img1 {width: 270px; height: auto; margin: 0 5px 0 19px; border: 1px solid #cdcdcd;}
        .ansimg1 > .img2 {width: 270px; height: auto; border: 1px solid #cdcdcd;}
        .ansimg2 {margin-top: 5px}
        .ansimg2 > .img1 {width: 270px; height: auto; margin: 0 5px 0 19px; border: 1px solid #cdcdcd;}
        .ansimg2 > .img2 {width: 270px; height: auto; border: 1px solid #cdcdcd;}

        #tip > a {color: #000000; text-decoration: none}
        #tip > a :link {color: #000000; text-decoration: none}
     </style>


    <title>자주하는질문 - FAQs</title>

</head>

<body>
<div class="container">

    <%@include file="../layout/header.jsp"%>

    <div id="main">
        <div class="row">
            <div style="font-size: 15px; margin: 30px 45px 20px 50px ; padding: 20px 0 30px 0;">
                <i class="fa fa-question-circle fa-3x"> 자주하는 질문 FAQs</i> </div>
        </div>  <%-- 자주하는 질문 --%>
        <div class="row">
            <div class="list col-sm-3">
                <h3><i class="fa fa-assistive-listening-systems" aria-hidden="true"></i> 게시판</h3>
                <ul>
                    <%--해당 카테고리 a태그는 지워고 색깔 바꿔주세요--%>
                    <li><a href="<%=baseurl%>/freeboard/fList.jsp"> &block;&nbsp;&nbsp;자유게시판</a></li>
                    <li style="color:#919191 ">&block;&nbsp;&nbsp;자주하는 질문</li>
                    <li><a href="<%=baseurl%>/qnaboard/qList.jsp"> &block;&nbsp;&nbsp;QnA</a></li>
                </ul>
            </div>   <%-- 왼쪽 분류 --%>
            <div class="col-sm-9">
                <div class="faqs row">
                    <h4>1. 질문 카테고리를 선택해주세요.</h4>
                    <div class="row">
                        <ul>
                            <li><a href= "javascript:faqs1();">1. 분양소 시설 및 위생상태는 어떤가요? </a></li>
                            <li><a href= "javascript:faqs2();">2. 분양 절차는 어떻게 되나요? </a></li>
                            <li><a href= "javascript:faqs3();">3. 아이들 건강 상태는 괜찮은가요? </a></li>
                            <li><a href= "javascript:faqs4();">4. 어린 아이들은 생후 몇개월 인가요? </a></li>
                            <li><a href= "javascript:faqs5();">5. 아이들 가서 직접 봐보고 정해도 되나요? </a></li>
                        </ul>
                    </div>
                </div>   <%-- 질문 부분 --%>

                <div>
                    <div class="answer row" id="answer1">
                        <h3>2. 관련 FAQ를 확인해주세요.</h3>
                        <div>
                            <img src="https://drive.google.com/uc?export=view&id=1DnpIDJH0-L7hg7hjVjsvNvp-UjE36fwx"
                                 onclick="imgPopup('https://drive.google.com/uc?export=view&id=1DnpIDJH0-L7hg7hjVjsvNvp-UjE36fwx')">
                            <p>&nbsp;&lt; 병원 외부 사진 &gt;</p>
                            <div class="row ansimg1">
                                <img src="https://drive.google.com/uc?export=view&id=1sVet28TbFlC_2G_8n6eIPz1uZAej0Pmg" class="img1"
                                     onclick="imgPopup('https://drive.google.com/uc?export=view&id=1sVet28TbFlC_2G_8n6eIPz1uZAej0Pmg')">
                                <img src="https://drive.google.com/uc?export=view&id=1FUFw05MFe2tOxmrKvsIWc6PEgjrfpGxR" class="img2"
                                     onclick="imgPopup('https://drive.google.com/uc?export=view&id=1FUFw05MFe2tOxmrKvsIWc6PEgjrfpGxR')">
                            </div>
                            <div class="row ansimg2">
                                <img src="https://drive.google.com/uc?export=view&id=1tJg-LOLstcLSn20jysLug6MjorHH_Rsx" class="img1"
                                     onclick="imgPopup('https://drive.google.com/uc?export=view&id=1tJg-LOLstcLSn20jysLug6MjorHH_Rsx')">
                                <img src="https://drive.google.com/uc?export=view&id=1ieVBKSGco8tag2l3j7dV6ued1qsp-_56" class="img2"
                                     onclick="imgPopup('https://drive.google.com/uc?export=view&id=1ieVBKSGco8tag2l3j7dV6ued1qsp-_56')">
                            </div>
                            <p>저희 착한아이는 전문 수의사님과 함께 아이들의 건강을 책임 지고 있습니다.<br>
                                주기적으로 아이들의 건강을 검사하고 체크하여 <br> 가족이 분양받는다 생각하며 꼼꼼히 분양을 준비해 드립니다.</p>
                        </div>     <%--분양소 시설 및 위생상태--%>
                        <div class="row more">
                            <p>3. 궁금한 사항이 더 있을 시 <a href="<%=baseurl%>/qnaboard/qList.jsp">QnA</a>에 남겨주시기 바랍니다.</p>
                            <button type="button" class="btn topbtn">
                                <i class="fa fa-angle-double-up fa-2x" aria-hidden="true"><span><br>맨위로</span></i></button>
                        </div>     <%-- 더 궁금한 사항--%>
                    </div><%--분양소 시설 및 위생상태--%>
                    <div class="answer row" id="answer2">
                        <h3>2. 관련 FAQ를 확인해주세요.</h3>
                        <div>
                            <img src="https://drive.google.com/uc?export=view&id=1z1Twd9pmKA_6LUMYwMdthXki4PJn9s7P">
                        </div>     <%--분양 절차--%>
                        <div class="row more">
                            <p>3. 궁금한 사항이 더 있을 시 <a href="<%=baseurl%>/qnaboard/qList.jsp">QnA</a>에 남겨주시기 바랍니다.</p>
                            <button type="button" class="btn topbtn">
                                <i class="fa fa-angle-double-up fa-2x" aria-hidden="true"><span><br>맨위로</span></i></button>
                        </div>     <%-- 더 궁금한 사항--%>
                    </div><%--분양 절차--%>
                    <div class="answer row" id="answer3">
                        <h3>2. 관련 FAQ를 확인해주세요.</h3>
                        <div>
                            <span>저희는 전문 수의사님의 후원과 함께 분양을 진행 합니다.<br>
                                주기적인 상태 확인과 건강검진으로 아이들은 모두 건강합니다.</span>

                        </div>
                        <div class="row more">
                            <p>3. 궁금한 사항이 더 있을 시 <a href="<%=baseurl%>/qnaboard/qList.jsp">QnA</a>에 남겨주시기 바랍니다.</p>
                            <button type="button" class="btn topbtn">
                                <i class="fa fa-angle-double-up fa-2x" aria-hidden="true"><span><br>맨위로</span></i></button>
                        </div>     <%-- 더 궁금한 사항--%>
                    </div><%--아이들 건강 상태--%>
                    <div class="answer row" id="answer4">
                        <h3>2. 관련 FAQ를 확인해주세요.</h3>
                        <div>건강 상태</div>
                        <div class="row more">
                            <p>3. 궁금한 사항이 더 있을 시 <a href="<%=baseurl%>/qnaboard/qList.jsp">QnA</a>에 남겨주시기 바랍니다.</p>
                            <button type="button" class="btn topbtn">
                                <i class="fa fa-angle-double-up fa-2x" aria-hidden="true"><span><br>맨위로</span></i></button>
                        </div>     <%-- 더 궁금한 사항--%>
                    </div><%--어린 아이들은 생후 몇개월--%>
                    <div class="answer row" id="answer5">
                        <h3>2. 관련 FAQ를 확인해주세요.</h3>
                        <div>아이들은 생후</div>
                        <div class="row more">
                            <p>3. 궁금한 사항이 더 있을 시 <a href="<%=baseurl%>/qnaboard/qList.jsp">QnA</a>에 남겨주시기 바랍니다.</p>
                            <button type="button" class="btn topbtn">
                                <i class="fa fa-angle-double-up fa-2x" aria-hidden="true"><span><br>맨위로</span></i></button>
                        </div>     <%-- 더 궁금한 사항--%>
                    </div> <%--직접 봐보고 정해--%>
                </div>   <%-- 답변 부분 --%>

            </div>
        </div>
    </div>
    <%@include file="../layout/footer.jsp"%>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
    var con1 = document.getElementById("answer1");
    var con2 = document.getElementById("answer2");
    var con3 = document.getElementById("answer3");
    var con4 = document.getElementById("answer4");
    var con5 = document.getElementById("answer5");


    function faqs1 (){
        con1.style.display = 'block';
        con2.style.display = 'none';
        con3.style.display = 'none';
        con4.style.display = 'none';
        con5.style.display = 'none';
    }

    function faqs2 (){
        con1.style.display = 'none';
        con2.style.display = 'block';
        con3.style.display = 'none';
        con4.style.display = 'none';
        con5.style.display = 'none';
    }

    function faqs3 (){
        con1.style.display = 'none';
        con2.style.display = 'none';
        con3.style.display = 'block';
        con4.style.display = 'none';
        con5.style.display = 'none';
    }

    function faqs4 (){
        con1.style.display = 'none';
        con2.style.display = 'none';
        con3.style.display = 'none';
        con4.style.display = 'block';
        con5.style.display = 'none';
    }

    function faqs5 (){
        con1.style.display = 'none';
        con2.style.display = 'none';
        con3.style.display = 'none';
        con4.style.display = 'none';
        con5.style.display = 'block';
    }

    function faqs6 (){
        con1.style.display = 'none';
        con2.style.display = 'none';
        con3.style.display = 'none';
        con4.style.display = 'none';
        con5.style.display = 'none';
    }

</script>   <%-- 질문 누르면 답변 보기이 --%>

<script>
    function imgPopup(img){
        img1= new Image();
        img1.src=(img);
        imgControll(img);
    }

    function imgControll(img){
        if((img1.width!=0)&&(img1.height!=0)){
            viewImage(img);
        }
        else{
            controller="imgControll('"+img+"')";
            intervalID=setTimeout(controller,20);
        }
    }

    function viewImage(img){
        W=img1.width;
        H=img1.height;
        O="width="+W+",height="+H+",scrollbars=yes";
        imgWin=window.open("","",O);
        imgWin.document.write("<html><head><title>이미지 확대보기</title></head>");
        imgWin.document.write("<body topmargin=0 leftmargin=0>");
        imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
        imgWin.document.close();
    }
</script> <%-- 이미지 팝업창으로 크게보기 효과 --%>

<script>
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('.topbtn').fadeIn();
            } else {
                $('.topbtn').fadeOut();
            }
        });

        $(".topbtn").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });
</script>   <%-- 맨위로 버튼 --%>

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
</script>   <%-- 로그인 / 회원가입 버튼 --%>

</body>
</html> 