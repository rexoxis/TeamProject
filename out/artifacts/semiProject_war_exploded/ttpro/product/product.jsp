
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">



    <title></title>
    <link rel="stylesheet" href="//static.dogpre.com/skin_web/dogpre/president/css/dog.css?v=20200107092301" />
    <link type="text/css" href="/shop/css/nanoscroller.css?v=20200107092301" rel="stylesheet" />

    <link rel="apple-touch-icon" sizes="180x180" href="//img.dogpre.com/web/dogpre/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" href="http://img.dogpre.com/web/dogpre/favicon/favicon-32x32.png" sizes="32x32">
    <link rel="icon" type="image/png" href="http://img.dogpre.com/web/dogpre/favicon/favicon-16x16.png" sizes="16x16">
    <link rel="shortcut icon" href="//img.dogpre.com/web/dogpre/favicon/favicon.ico?1578356581">
    <link rel="shortcut icon" href="//img.dogpre.com/web/dogpre/favicon/favicon-32x32.ico?1578356581" sizes="32x32">
    <link rel="shortcut icon" href="//img.dogpre.com/web/dogpre/favicon/favicon-16x16.ico?1578356581" sizes="16x16">
    <link rel="manifest" href="//img.dogpre.com/web/dogpre/favicon/manifest.json">
    <link rel="mask-icon" href="//img.dogpre.com/web/dogpre/favicon/safari-pinned-tab.svg" color="#5bbad5">
    <meta name="msapplication-config" content="//img.dogpre.com/web/dogpre/favicon/browserconfig.xml">
    <meta name="theme-color" content="#ffffff">

    <style type="text/css">
        .ui-autocomplete {width: 398px; background-color: #FFFFFF; border: 1px solid #C8C8C8; -webkit-box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.13); box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.13); z-index: 2000;}
        .ui-autocomplete .ui-menu-item {overflow: hidden; line-height: 25px; padding: 3px 7px 0px 7px; cursor: pointer;}
        .ui-autocomplete .ui-menu-item:hover, .ui-autocomplete .ui-state-focus {background-color: #EEEEEE;}
        .ui-autocomplete .ui-menu-item a {color: #333333; font-size: 14px;}
        .ui-autocomplete .ui-menu-item a:hover {text-decoration: none;}
        .ui-autocomplete .cate{clear:both; border-bottom: 1px solid  #e3e3e3; padding: 0px; width:100%;}
        .searchImg{padding-left: 5px; margin-left:1px; margin-right: 2px; padding-right: 2px; padding-top:8px;}
        .searchCateColor{color: #cc6600;}
        #shop_login_small { width: 158px; height: 84px; padding: 2px 9px 0; top: 53px; left: -20px; }
        #shop_login_small .btn-yellow { width: 112px; }
        #shop_login_small .btn-yellow { margin-top: 15px; }
        #shop_login_small .bl-lybubble { left: 79px; }
        #shop_login_small p { padding: 12px 5px 12px; line-height: 14px; }
        #my_interest .p-bdr-top { padding: 30px 0 65px; margin: 0 10px 0; text-align: center; border-top: 1px solid #f5f5f5; }
        .nano-alarm > .nano-alarm-content { max-height: 424px; position: static; overflow-y: scroll; padding: 0; margin: 0px -20px 0px 0px; outline: none; }
    </style>



</head>
<body  style="width: 100%">
<div class="container" >
<%@include file="../layout/header.jsp"%>
<main role="main" class="goodsDetailInfo " style="margin-left: 300px" >

    <p class="cate-local-nav">

    <div class="row detail-basic">
        <div class="centr-box">
            <!-- 2017-11-14 다니엘 -->
            <span class="iconDiscount" id='discountLayer' style='display:none;' chkstatus='none;' chkstatus2='none;'>이벤트</span>
            <!-- 2017-11-14 다니엘 -->
            <div class="big-img"><img src="http://img.dogpre.com/web/dogpre/product/33/32909_detail_01566650.jpg"
                                      id="detail_image" width="470" height="470" alt="대표이미지" onerror="this.src='/shop/skin/president/img/common/noimg_500.gif'" /></div>

        </div>

        <!-- 상품 확대 보기 .big-img 이미지 클릭시 .zoom-view에 style = display:block; opacity: 1; z-index: 1000; 추가 -->

        <!--// 상품 확대 보기 -->
        <div class="info">
            <form name="frmView" method="post">
                <input type="hidden" name="goodsno" id="goodsno" value="32909" />
                <input type="hidden" name="price" value="8500" />
                <input type="hidden" name="supply" value="6930" />
                <input type="hidden" name="consumer" value="12000" />
                <input type="hidden" name="is_sess" id="is_sess" value="0" />
                <input type="hidden" name="event_sno" value="" />
                <input type="hidden" name="frmView_goodsno" id="frmView_goodsno" value="32909" />
                <input type="hidden" name="option_sno" value="" />
                <fieldset>
                <div style="float: left">
                    <legend class="screen-out">상품 상세 구매</legend>
                    <div class="mask"></div>
                    <div class="hd">
                        <h2 class="tit-shop-view">베토퀴놀 엔자덴트 엔지메틱 치약 닭고기맛 90g<span class="add-goods-name"></span></h2>
                        <p class="product_by"><span>by</span><span><a href="/shop/goods/goods_list.php?category=&search_word=&search_by_brand%5B%5D=383">베토퀴놀</a></span></p>
                        <div class="star">
                            <span class="ic-star">
                                <!-- 별점 width 값 입력 -->
                                <em style="width:80%">80점</em>
                            </span>
                            <em class="review-lnk"><a href="/shop/goods/goods_post.php?goodsno=32909"><em class="en">370</em>명 구매후기</a><span class="bar">|</span><a href="/shop/goods/goods_qna_list.php?goodsno=32909"><em class="en">3</em>개 질문/답변</a></em>
                        </div>
                    </div>
                </div>

                    <div class="cont">
                        <div class="price_info">



                            <table>
                                <caption>제품정보</caption>
                                <colgroup>
                                    <col />
                                    <col />
                                </colgroup>
                                <tbody>

                                <tr id='consumerZone' >
                                    <th scope="row"><span>정가:</span></th>
                                    <td><del><span class="consumer">12,000</span><span class="won">원</span></del></td>
                                </tr>
                                <tr>
                                    <th>판매가:</th>
                                    <td class="price_view"><span class="salling-price opt_price red">8,500<span class="red">원</span></span></td>
                                </tr>
                                <tr class="price discount " style="display:none;">
                                    <th>할인가:</th>
                                    <td><span class="opt_price red" style="display: inline-block;"></span><span class="discount-price red" style="display: inline-block;">0<span class="red">원</span></span> <span class="red" id="apopprice" style="display: inline-block;"/>

                                    </td>
                                </tr>
                                <tr class="price discounted">
                                    <th>할인받은 금액:</th>
                                    <td><span class="red"><span class="discounted-price">3,500</span><span class="red won">원</span> (<span class="discount-rate">29</span>%)</span></td>
                                </tr>

                                </tbody>
                            </table>
                        </div>

                        <div class="stock">
                            <dl>
                                <dt class="stock-state-text">
                                    재고있음                                </dt>
                                <dd>
                                    <!--
<a href="#" role="button" data-toggle="dropdown" class="bl-down-c">자세히 보기</a>
<div class="ly-bubble dropdown-menu ly-read" role="menu">
    <strong>업체배송 상품 구매시 읽어보세요.</strong>
    <ul>
        <li class="bl-list">본 상품은 공급업체에서 배송하는 업체배송 상품입니다.</li>
        <li class="bl-list">강아지대통령 빠른배송과 달리 업체배송의 배송기간은 1~3일 더<br>소요될 수 있습니다.</li>
        <li class="bl-list">주문제작의 경우 제작기간만큼 배송기간이 늘어 날 수 있습니다.</li>
        <li class="bl-list">주문한 상품 중 일부만 받으신 경우 업체배송상품이 포함되어 있는지<br>주문내역을 꼭 확인바랍니다.</li>
        <li class="bl-list">교환/반품은 상품 받은 날로부터 7일 이내에 신청해 주셔야 합니다. </li>
    </ul>
</div>
-->
                                    대통령발송 상품입니다.
                                </dd>
                                <dd class="delivery-time"  >
                                    <span id="remain_time"><strong>27분</strong> 이내에 주문시 <strong><strong>오늘</strong></strong> 발송</span>
                                </dd>

                            </dl>
                        </div>
                        <!-- 190718 무료배송 안내 -->
                        <div class="info_shipping_event">
                            <div id="item_shipping_info" class="item_shipping_info "><!--// [D]: 품절 시 클래스명 'soldout' 추가 -->
                                <p><strong>무료배송</strong> (30,000원 이상 구매시)</p>
                                <!--<p>그 외 배송비 3,000원</p>-->
                            </div>
                            <div class="item_event_info">
                                <p>
                                    <a href="/shop/goods/goods_event.php?sno=2284"> 									신규, 재구매 고객님께 최대 1만원 할인 쿠폰 지급! </a> 								</p>
                            </div>
                        </div>
                        <!--// 190718 무료배송 안내 -->
                        <div class="option" style="padding-top:0;margin-bottom:0px;margin-top: -7px;">
                            <dl>

                            </dl>
                        </div>



                        <div class="option" style="padding-top:0;margin-bottom:0px;margin-top:-6px;position:relative;">
                            <dl>
                                <dt class="quantity-area" style="height:18px; float: left">수량:</dt>
                                <dd class="sel-box quantity-area" style="">
                                    <label class="screen-out">선택</label>
                                    <select name="quantity" class="select-sort en" style="margin-bottom: 1px;">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                        <option value="16">16</option>
                                        <option value="17">17</option>
                                        <option value="18">18</option>
                                        <option value="19">19</option>
                                        <option value="20">20</option>
                                        <option value="21">21</option>
                                        <option value="22">22</option>
                                        <option value="23">23</option>
                                        <option value="24">24</option>
                                        <option value="25">25</option>
                                        <option value="26">26</option>
                                        <option value="27">27</option>
                                        <option value="28">28</option>
                                        <option value="29">29</option>
                                        <option value="30">30</option>
                                    </select>
                                </dd>
                            </dl>
                        </div>

                        <!-- 관심상품 추가 아오 롤백 2019.09.25-->
                        <!-- div class="add_wish_area">
                            <a href="#" class="btn-gray add-wishlist" data-sticker="">관심상품 추가</a>
                            <p class="not-allowed-txt dis-a3 error-message" style="display:none;">이미 관심상품으로<br>추가되었습니다.</p>
                            <div class="ly-tp-b wishlist-message">
                                <p class="p-msg">관심상품으로 추가하였습니다.</p>
                                <div class="foot"><button type="button" class="btn-yellow btn-wishlist-move"><span>관심상품 보기</span></button><button type="button" class="btn-gray btn-continue"><span>닫기</span></button></div>
                                <button type="button" class="pop_close btn-continue">창 닫기</button>
                            </div>
                        </div -->
                        <!--// 관심상품 추가  아오 롤백 2019.09.25-->


                        <ul class="prdc" style="margin-top: 4px;">
                            <li>타액에서 생성된 자연효소를 이용한 기능성 치약</li>
                            <li>OSCN 이온생성 촉진으로 치아와 치은질환 예방</li>
                            <li>Hyopthiocyanatie 분비를 촉진하여 구강내 미생물층 조절</li>
                            <li>닭고기 향으로 애완동물의 양치 거부감 최소화</li>
                        </ul>
                        <div class="goods-view-gift" style="padding-top:14px;">
                            <p>3만원 이상 구매하시면 스티커를 적립해 드립니다.<a href="/shop/order/order_gift_info.php"><span class="goods-view-link">스티커 적립보기</span></a></p>
                        </div>
                    </div>

                </fieldset>
            </form>

        </div>
    </div>

    <input type='hidden' name='with_goods_check' id='with_goods_check' value='N'>

    <div class="detail-cont text-center">
        <input type='hidden' name='gift_page' id='gift_page' value='1'>
        <input type='hidden' name='gift_total_page' id='gift_total_page' value=''>
        <input type='hidden' name='cartPrice' id='cartPrice' value=''>
        <div style="text-align: center; margin-left: -90%"><button class="btn btn-primary" type="button">구매하기</button></div>





<%@include file="../layout/footer.jsp"%>
    </div>
</main>
</div>
</body>
</html>
