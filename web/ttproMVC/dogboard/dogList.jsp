<%@ page import="vo.CatBoard" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.DogBoard" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");


    ArrayList<DogBoard> dogLists = (ArrayList)request.getAttribute("dogLists");

    int totalPage = (int)request.getAttribute("totalPage");
    int startPage = (int)request.getAttribute("startPage");
    int endPage = (int)request.getAttribute("endPage");
    int cPage = (int)request.getAttribute("cPage");

%>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <title>Dog's</title>
    <style>
        body {
            width: 100%;
            margin: 0 auto;
        }

        .list {
            float: left
        }

        .list > h3 {
            margin: 10px 0 10px 30px;
            font-weight: bold
        }

        .list > ul {
            list-style: none;
            text-align: left;
            text-decoration-line: none;
        }

        .list > ul > li {
            text-align: left;
            margin-left: 8px;
        }

        .list > ul > li > a {
            color: #000000
        }
    </style>
</head>

<body>
<div class="container">

    <%@include file="../layout/header.jsp" %>

    <div class="main">
        <div class="row">
            <div class="col-8" style="font-size: 25px; margin: 0 45px 0 50px ; padding:30px 0 20px 0;">
                <i class="fa fa-comments fa-2x"> Dog's</i></div>
            <div class="col-3">
                <button type="button" class="btn btn-success" id="newbtn" style="margin:40px 0 15px 110px; ">
                    <i class="fa fa-plus-circle"> 새글쓰기</i>
                </button>
            </div>
        </div>

        <div class="row" style="margin: 10px 0 20px 0">
            <div class="list col-sm-3">
                <h3><i class="fa fa-handshake-o" aria-hidden="true"></i> 분양</h3>
                <ul>
                    <%--해당 카테고리 a태그는 지워고 색깔 바꿔주세요--%>
                    <li><a href="catList.do">&block;&nbsp;&nbsp;Cat's</a></li>
                    <li style="color:#919191">&block;&nbsp;&nbsp;Dog's</li>
                    <li><a href="reviewList.do">&block;&nbsp;&nbsp;분양후기</a></li>
                </ul>
            </div>

            <div class="col-sm-9 row">
                <%for (int i = 0; i < dogLists.size(); i++) { %>
                <div style="width: 150px; height: 150px; margin: 20px;">
                    <div class="thumbnail bootsnipp-thumb" style="padding:0;">
                        <div class="imgwrap" style="height: 100px;">
                            <a href="dogView.do?bdno=<%=dogLists.get(i).getBdno()%>">
                                <img class="danlazy" src="showimg.do?f=<%=dogLists.get(i).getFile1()%>" width="100%" height="100%">
                            </a>
                        </div>
                        <%--제목,날짜,조회수 표시할 부분--%>
                        <div style="width: 150px;">
                            <div>
                                <span class="text-left"
                                      style="overflow: hidden ; text-overflow: ellipsis; white-space: nowrap;  width: 150px; height: auto; display: inline-block;  ">
                                    <%--게시글 상세보기로 넘어가는 링크작성--%>
                                    <a href="dogView.do?bdno=<%=dogLists.get(i).getBdno()%>"><%=dogLists.get(i).getTitle()%></a>
                                </span>
                            </div>
                            <div class="text-leftx" style="font-size: 10pt">
                                <span>조회수 <%=dogLists.get(i).getViews()%> |</span>
                                <span>추천수 <%=dogLists.get(i).getLikes()%></span>
                                <span><%=dogLists.get(i).getRegdate().substring(0, 10)%></span>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>

        <%--검색창--%>
        <form name="revlist" method="post" action="dogList.do">
            <div align="center">
                <table>
                    <tr>
                        <td width="70%" align="center">&nbsp;&nbsp;
                            <select name="colname" class="txt">
                                <option value="selected" selected>검색</option>
                                <option value="title">제목</option>
                                <option value="contents">본문</option>
                                <option value="userid">글쓴이</option>
                            </select>

                            <input name="findtext" id="searchInput" type="text"/>

                            <button type="submit" id="findbtn" class="btn btn-primary ">검색</button>
                        </td>
                    </tr>
                </table>
            </div>
        </form>

        <div class="row" style="margin: 10px 30px 20px 30px">
            <!--페이지네이션-->
            <div class="col-12">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <% if(cPage > 10) { %>
                        <li class="page-item">
                            <a class="page-link" href="dogList.do?cpage=<%=(startPage-10)%>" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                        <% } %>

                        <% for(int i = startPage; i <= endPage; i++) { %>
                        <% if(i > totalPage) break;
                            if(cPage == i) { %>
                        <li class="page-item"><a class="page-link" style="color: red"><%=i%></a></li>
                        <% } else { %>
                        <li class="page-item"><a class="page-link" href="dogList.do?cpage=<%=i%>"><%=i%></a></li>
                        <% } %>
                        <% } %>

                        <% if(endPage <= totalPage) { %>
                        <li class="page-item">
                            <a class="page-link" href="dogList.do?cpage=<%=(endPage+1)%>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                        <% } %>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <%@include file="../layout/footer.jsp" %>
</div>

<%--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"--%>
        <%--integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"--%>
        <%--crossorigin="anonymous"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script src="../js/loginfrm.js"></script>

<script>
    // 상단 로그인 버튼
    $(function () {
        $('#mloginbtn').on('click', function (e) {
            location.href = 'login.do';
        });
    });
    // 회원가입 버튼
    $(function () {
        $('#joinbtn').on('click', function (e) {
            location.href = 'signagree.do';
        });
    });

    $(function () {
        $('#newbtn').on('click', function (e) {
            location.href = 'dogWrite.do';
        });
    });

    $(function() {    //화면 다 뜨면 시작
        var searchSource = ["푸들","골든리트리버","시츄","페키니즈","시바","포메","폼스키","말티즈",
            "라가머핀","노르웨이숲","데본렉스","샴","페르시아","강아지용품","강아지사료","고양이용품","고양이사료"]; // 배열 형태로
        $("#searchInput").autocomplete({  //오토 컴플릿트 시작
            source : searchSource,    // source 는 자동 완성 대상
            select : function(event, ui) {    //아이템 선택시
                console.log(ui.item);
            },
            focus : function(event, ui) {    //포커스 가면
                return false;//한글 에러 잡기용도로 사용됨
            },
            minLength: 1,// 최소 글자수
            autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
            classes: {    //잘 모르겠음
                "ui-autocomplete": "highlight"
            },
            delay: 500,    //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
//            disabled: true, //자동완성 기능 끄기
            position: { my : "right top", at: "right bottom" },    //잘 모르겠음
            close : function(event){    //자동완성창 닫아질때 호출
                console.log(event);
            }
        });

    });
    // 상단 로그아웃 버튼
    $(function () {
        $('#logoutbtn').on('click', function (e) {
            location.href = 'logout.do';
        });
    });
</script>

</body>
</html>
