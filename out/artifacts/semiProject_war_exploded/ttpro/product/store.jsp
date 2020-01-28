
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .tit-prdc{
            width: 100px;
            overflow: hidden;
            word-break: break-all;
            font-size: 9pt;
            color: #000000;
        }
        .tit-prdc :hover {color: #0000ff}
        .prd{
            padding-right: 10px;
        }
        .prd > a :hover { text-decoration: underline;}
    </style>
</head>
<body style="width: 100%; margin: 0 auto;">

<div class="container">
    <%@include file="../layout/header.jsp"%>
    <div class="mprd" style="margin-left: 200px">
    <br><br>
    <h2 class="text-center "><span style="padding-right: 200px">이 상품을 추천합니다</span></h2>
    <div class="row">
        <div class="row prdc-list">


            <div class="prd">
                <a href="product.jsp">
                    <img src="http://img.dogpre.com/web/dogpre/product/33/32909_list_M1_01566650.jpg" width="120" height="120" alt="" onerror="#" />
                </a>
                <br>
                <a href="product.jsp">
                    <span class="tit-prdc">
                        베토퀴놀 엔자덴트 <br>엔지메틱 치약 닭고기맛 90g</span>
                </a><br><br>
                <em style="width:80%">80점</em>
                <em class="review-prdc">(<a href="/shop/goods/goods_post.php?goodsno=32909" style='text-decoration:none;'>367</a>)<i>리뷰</i></em>
                <br><span class="price-prdc en">&#8361;8,500</span>
                <div class="star">
                    <span class="ic-star">

                    </span>

                </div>

            </div>
            <div class="prd">
                <a href="product2.jsp">
                    <img src="http://img.dogpre.com/web/dogpre/product/13/12983_list_M1_1171.jpg" width="120" height="120" alt="" onerror="this.src='/shop/skin/president/img/common/noimg_130.gif'" />
                </a><br>
                <a href="product2.jsp">
                    <span class="tit-prdc">인 in 피모영양제 340g</span>
                </a><br><br><br>
                <em style="width:90%">90점</em>
                <em class="review-prdc">(<a href="/shop/goods/goods_post.php?goodsno=12983" style='text-decoration:none;'>372</a>)<i>리뷰</i></em>
                <br><span class="price-prdc en">&#8361;20,000</span>
                <div class="star">
                    <span class="ic-star">

                    </span>

                </div>

            </div>
            <div class="prd">
                <a href="product3.jsp">
                    <img src="http://img.dogpre.com/web/dogpre/product/46/45932_list_M1_01291889.jpg" width="120" height="120" alt="" onerror="this.src='/shop/skin/president/img/common/noimg_130.gif'" />
                </a><br>
                <a href="/shop/goods/goods_view.php?goodsno=45932">
                    <span class="tit-prdc">K9 내츄럴 도그<br> 치킨 피스트 캔 170g</span>
                </a><br><br>
                <em style="width:80%">80점</em>
                <em class="review-prdc">(<a href="/shop/goods/goods_post.php?goodsno=45932" style='text-decoration:none;'>46</a>)<i>리뷰</i></em>
                <br><span class="price-prdc en">&#8361;4,500</span>
                <div class="star">
                    <span class="ic-star">

                    </span>

                </div>

            </div>
            <div class="prd">
                <a href="/shop/goods/goods_view.php?goodsno=26150">
                    <img src="http://img.dogpre.com/web/dogpre/product/27/26150_list_M1_01011917.jpg" width="120" height="120" alt="" onerror="this.src='/shop/skin/president/img/common/noimg_130.gif'" />
                </a><br>
                <a href="/shop/goods/goods_view.php?goodsno=26150">
                    <span class="tit-prdc">흡수혁명 애견패드<br> 소형 50매</span>
                </a><br><br>
                <em style="width:100%">100점</em>
                <em class="review-prdc">(<a href="/shop/goods/goods_post.php?goodsno=26150" style='text-decoration:none;'>24,110</a>)<i>리뷰</i></em>
                <br><span class="price-prdc en">&#8361;7,200</span>
                <div class="star">
                    <span class="ic-star">

                    </span>

                </div>

            </div>
            <div class="prd">
                <a href="/shop/goods/goods_view.php?goodsno=51594">
                    <img src="http://img.dogpre.com/web/dogpre/product/52/51594_list_M1_01233333.jpg" width="120" height="120" alt="" onerror="this.src='/shop/skin/president/img/common/noimg_130.gif'" />
                </a><br>
                <a href="/shop/goods/goods_view.php?goodsno=51594">
                    <span class="tit-prdc">내추럴발란스 LID <br>감자&오리 포뮬라<br> 작은알갱이 3kg</span><br></a>
                    <em style="width:90%">90점</em>
                    <em class="review-prdc">(<a href="/shop/goods/goods_post.php?goodsno=51594" style='text-decoration:none;'>221</a>)<i>리뷰</i></em>
                    <br><span class="price-prdc en">&#8361;35,700</span>

                <div class="star">
                    <span class="ic-star">

                    </span>

                </div>

            </div>
            <div class="vline"></div>
            <div class="prd">
                <a href="/shop/goods/goods_view.php?goodsno=46697">
                    <img src="http://img.dogpre.com/web/dogpre/product/47/46697_list_M1_01374857.jpg" width="120" height="120" alt="" onerror="this.src='/shop/skin/president/img/common/noimg_130.gif'" />
                </a><br>
                <a href="/shop/goods/goods_view.php?goodsno=46697">
                    <span class="tit-prdc" style="padding-right: 50px">오마이도기 <br>동결건조 망고칩 20g</span>
                </a><br><br>
                <em style="width:90%">90점</em>
                <em class="review-prdc">(<a href="/shop/goods/goods_post.php?goodsno=46697" style='text-decoration:none;'>345</a>)<i>리뷰</i></em>
                <br><span class="price-prdc en">&#8361;3,500</span>
                <div class="star">
                    <span class="ic-star">

                    </span>

                </div>

            </div>
            <div class="prd">
                <a href="/shop/goods/goods_view.php?goodsno=21912">
                    <img src="http://img.dogpre.com/web/dogpre/product/22/21912_list_M1_8412.jpg" width="120" height="120" alt="" onerror="this.src='/shop/skin/president/img/common/noimg_130.gif'" />
                </a><br>
                <a href="/shop/goods/goods_view.php?goodsno=21912">
                    <span class="tit-prdc"style="padding-right: 40px">콜라겐홀릭 <br>말랑 돼지껍데기<br> 블루베리 20개입</span>
                </a><br>
                <em style="width:90%">90점</em>
                <em class="review-prdc">(<a href="/shop/goods/goods_post.php?goodsno=21912" style='text-decoration:none;'>1,605</a>)<i>리뷰</i></em>
                <br><span class="price-prdc en">&#8361;3,700</span>
                <div class="star">
                    <span class="ic-star">

                    </span>

                </div>

            </div>
            <div class="prd">
                <a href="/shop/goods/goods_view.php?goodsno=53919">
                    <img src="http://img.dogpre.com/web/dogpre/product/54/53919_list_M1_01497095.jpg" width="120" height="120" alt="" onerror="this.src='/shop/skin/president/img/common/noimg_130.gif'" />
                </a><br>
                <a href="/shop/goods/goods_view.php?goodsno=53919">
                    <span class="tit-prdc"style="padding-right: 70px">페페로니 <br>진짜 오메가3<br> 연어 180g</span>
                </a><br>
                <em style="width:90%">90점</em>
                <em class="review-prdc">(<a href="/shop/goods/goods_post.php?goodsno=53919" style='text-decoration:none;'>3,290</a>)<i>리뷰</i></em>
                <br><span class="price-prdc en">&#8361;5,500</span>
                <div class="star">
                    <span class="ic-star">

                    </span>

                </div>

            </div>
            <div class="prd">
                <a href="/shop/goods/goods_view.php?goodsno=25758">
                    <img src="http://img.dogpre.com/web/dogpre/product/26/25758_list_M1_01042796.jpg" width="120" height="120" alt="" onerror="this.src='/shop/skin/president/img/common/noimg_130.gif'" />
                </a><br>
                <a href="/shop/goods/goods_view.php?goodsno=25758">
                    <span class="tit-prdc">네이처스 버라이어티<br> 인스팅트 치킨 1.8kg</span>
                </a><br><br>
                <em style="width:90%">90점</em>
                <em class="review-prdc">(<a href="/shop/goods/goods_post.php?goodsno=25758" style='text-decoration:none;'>64</a>)<i>리뷰</i></em>
                <br><span class="price-prdc en">&#8361;30,600</span>
                <div class="star">
                    <span class="ic-star">

                    </span>

                </div>

            </div>
            <div class="prd">
                <a href="/shop/goods/goods_view.php?goodsno=22488">
                    <img src="http://img.dogpre.com/web/dogpre/product/23/22488_list_M1_01120200.jpg" width="120" height="120" alt="" onerror="this.src='/shop/skin/president/img/common/noimg_130.gif'" />
                </a><br>
                <a href="/shop/goods/goods_view.php?goodsno=22488">
                    <span class="tit-prdc">[ 1 + 1 ] 건강백서<br> 야들야들 <br>쫀득한 소고기 120g</span>
                </a><br>
                <em style="width:90%">90점</em>
                <em class="review-prdc">(<a href="/shop/goods/goods_post.php?goodsno=22488" style='text-decoration:none;'>2,070</a>)<i>리뷰</i></em>
                <br><span class="price-prdc en">&#8361;4,700</span>
                <div class="star">
                    <span class="ic-star">

                    </span>

                </div>

            </div>
        </div>
    </div>
    <br><br><br><br><br>
    <h2 class="tit-txt-m tit-line secondWrap text-center"><span style="padding-right: 200px">새로 들어온 상품입니다</span><a href="/shop/goods/new_list.php" class="link_view_all" style="margin-left:15px;"></a></h2>
    <div class="row">
        <div class="row prdc-list">
            <div class="prd">
                <a href="/shop/goods/goods_view.php?goodsno=67828">
                    <img src="http://img.dogpre.com/web/dogpre/product/68/67828_list_M1_01868102.jpg" width="120" height="120" alt="" onerror="this.src='/shop/skin/president/img/common/noimg_130.gif'" />
                </a><br>
                <a href="/shop/goods/goods_view.php?goodsno=67828">
                    <span class="tit-prdc"style="padding-right: 50px">반려소반 오늘도<br> 산양해 산양유 껌 90g</span>
                </a>


                <div class="star">
                    <span class="ic-star">
                        <em style="width:100%">100점</em>
                    </span>
                    <em class="review-prdc">(<a href="/shop/goods/goods_post.php?goodsno=67828" style='text-decoration:none;'>3</a>)<i>리뷰</i></em>
                </div>
                <span class="price-prdc en">&#8361;4,720</span>

            </div>
            <div class="prd">
                <a href="/shop/goods/goods_view.php?goodsno=67897">
                    <img src="http://img.dogpre.com/web/dogpre/product/68/67897_list_M1_01872615.jpg" width="120" height="120" alt="" onerror="this.src='/shop/skin/president/img/common/noimg_130.gif'" />
                </a><br>
                <a href="/shop/goods/goods_view.php?goodsno=67897">
                    <span class="tit-prdc"style="padding-right: 10px">네츄럴코어 <br>네츄럴터키 3개입</span>
                </a>


                <div class="star">
                    <span class="ic-star">
                        <em style="width:100%">100점</em>
                    </span>
                    <em class="review-prdc">(<a href="/shop/goods/goods_post.php?goodsno=67897" style='text-decoration:none;'>4</a>)<i>리뷰</i></em>
                </div>
                <span class="price-prdc en">&#8361;5,200</span>

            </div>
            <div class="prd">
                <a href="/shop/goods/goods_view.php?goodsno=66655">
                    <img src="http://img.dogpre.com/web/dogpre/product/67/66655_list_M1_01887299.jpg" width="120" height="120" alt="" onerror="this.src='/shop/skin/president/img/common/noimg_130.gif'" />
                </a><br>
                <a href="/shop/goods/goods_view.php?goodsno=66655">
                    <span class="tit-prdc"style="padding-right: 50px">카루 데일리 디쉬<br> 칠면조 스튜 354g</span>
                </a>


                <div class="star">
                    <span class="ic-star">
                        <em style="width:80%">80점</em>
                    </span>
                    <em class="review-prdc">(<a href="/shop/goods/goods_post.php?goodsno=66655" style='text-decoration:none;'>1</a>)<i>리뷰</i></em>
                </div>
                <span class="price-prdc en">&#8361;5,500</span>

            </div>
            <div class="prd">
                <a href="/shop/goods/goods_view.php?goodsno=66361">
                    <img src="http://img.dogpre.com/web/dogpre/product/67/66361_list_M1_01649774.jpg" width="120" height="120" alt="" onerror="this.src='/shop/skin/president/img/common/noimg_130.gif'" />
                </a><br>
                <a href="/shop/goods/goods_view.php?goodsno=66361">
                    <span class="tit-prdc">스텔라앤츄이스 <br>디너패티 치킨 397g</span>
                </a>


                <div class="star">
                    <span class="ic-star">
                        <em style="width:0%">0점</em>
                    </span>
                    <em class="review-prdc">(<a href="/shop/goods/goods_post.php?goodsno=66361" style='text-decoration:none;'>0</a>)<i>리뷰</i></em>
                </div>
                <span class="price-prdc en">&#8361;58,000</span>

            </div>
            <div class="prd">
                <a href="/shop/goods/goods_view.php?goodsno=66370">
                    <img src="http://img.dogpre.com/web/dogpre/product/67/66370_list_M1_01755795.jpg" width="120" height="120" alt="" onerror="this.src='/shop/skin/president/img/common/noimg_130.gif'" />
                </a><br>
                <a href="/shop/goods/goods_view.php?goodsno=66370">
                    <span class="tit-prdc">펫츠프라임 건강한하루<br> 닭고기&황태 소프트 1kg</span>
                </a>


                <div class="star">
                    <span class="ic-star">
                        <em style="width:100%">100점</em>
                    </span>
                    <em class="review-prdc">(<a href="/shop/goods/goods_post.php?goodsno=66370" style='text-decoration:none;'>5</a>)<i>리뷰</i></em>
                </div>
                <span class="price-prdc en">&#8361;11,000</span>

            </div>
            <div class="vline"></div>
            <div class="prd">
                <a href="/shop/goods/goods_view.php?goodsno=66430">
                    <img src="http://img.dogpre.com/web/dogpre/product/67/66430_list_M1_01530731.jpg" width="120" height="120" alt="" onerror="this.src='/shop/skin/president/img/common/noimg_130.gif'" />
                </a><br>
                <a href="/shop/goods/goods_view.php?goodsno=66430">
                    <span class="tit-prdc">닥터바이 브레인츄 130g</span>
                </a>


                <div class="star">
                    <span class="ic-star">
                        <em style="width:0%">0점</em>
                    </span>
                    <em class="review-prdc">(<a href="/shop/goods/goods_post.php?goodsno=66430" style='text-decoration:none;'>0</a>)<i>리뷰</i></em>
                </div>
                <span class="price-prdc en">&#8361;12,900</span>

            </div>
            <div class="prd">
                <a href="/shop/goods/goods_view.php?goodsno=66898">
                    <img src="http://img.dogpre.com/web/dogpre/product/67/66898_list_M1_01654401.jpg" width="120" height="120" alt="" onerror="this.src='/shop/skin/president/img/common/noimg_130.gif'" />
                </a><br>
                <a href="/shop/goods/goods_view.php?goodsno=66898">
                    <span class="tit-prdc">펫파더 북어트릿 120g</span>
                </a>


                <div class="star">
                    <span class="ic-star">
                        <em style="width:100%">100점</em>
                    </span>
                    <em class="review-prdc">(<a href="/shop/goods/goods_post.php?goodsno=66898" style='text-decoration:none;'>1</a>)<i>리뷰</i></em>
                </div>
                <span class="price-prdc en">&#8361;15,000</span>

            </div>
            <div class="prd">
                <a href="/shop/goods/goods_view.php?goodsno=67216">
                    <img src="http://img.dogpre.com/web/dogpre/product/68/67216_list_M1_01302430.jpg" width="120" height="120" alt="" onerror="this.src='/shop/skin/president/img/common/noimg_130.gif'" />
                </a><br>
                <a href="/shop/goods/goods_view.php?goodsno=67216">
                    <span class="tit-prdc">고독한 미식견 <br>초유입은 고구마큐브 120g</span>
                </a>


                <div class="star">
                    <span class="ic-star">
                        <em style="width:0%">0점</em>
                    </span>
                    <em class="review-prdc">(<a href="/shop/goods/goods_post.php?goodsno=67216" style='text-decoration:none;'>0</a>)<i>리뷰</i></em>
                </div>
                <span class="price-prdc en">&#8361;4,900</span>

            </div>
            <div class="prd">
                <a href="/shop/goods/goods_view.php?goodsno=66508">
                    <img src="http://img.dogpre.com/web/dogpre/product/67/66508_list_M1_01131767.jpg" width="120" height="120" alt="" onerror="this.src='/shop/skin/president/img/common/noimg_130.gif'" />
                </a><br>
                <a href="/shop/goods/goods_view.php?goodsno=66508">
                    <span class="tit-prdc">눈물싹싹 눈물자국<br> 영양제 120g</span>
                </a>


                <div class="star">
                    <span class="ic-star">
                        <em style="width:80%">80점</em>
                    </span>
                    <em class="review-prdc">(<a href="/shop/goods/goods_post.php?goodsno=66508" style='text-decoration:none;'>8</a>)<i>리뷰</i></em>
                </div>
                <span class="price-prdc en">&#8361;29,000</span>

            </div>
            <div class="prd">
                <a href="/shop/goods/goods_view.php?goodsno=66265">
                    <img src="http://img.dogpre.com/web/dogpre/product/67/66265_list_M1_02631232.jpg" width="120" height="120" alt="" onerror="this.src='/shop/skin/president/img/common/noimg_130.gif'" />
                </a><br>
                <a href="/shop/goods/goods_view.php?goodsno=66265">
                    <span class="tit-prdc">리안펫 비비 유모차<br> 다크네이비</span>
                </a>


                <div class="star">
                    <span class="ic-star">
                        <em style="width:0%">0점</em>
                    </span>
                    <em class="review-prdc">(<a href="/shop/goods/goods_post.php?goodsno=66265" style='text-decoration:none;'>0</a>)<i>리뷰</i></em>
                </div>
                <span class="price-prdc en">&#8361;220,000</span>

            </div>
        </div>
    </div>
    </div>
    <%@include file="../layout/footer.jsp"%>

</div>

</body>
</html>
