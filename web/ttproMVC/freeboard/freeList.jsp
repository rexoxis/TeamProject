<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="vo.FreeBoard" %>
<%@ page import="java.util.ArrayList" %>

<%
    request.setCharacterEncoding("utf-8");

    ArrayList<FreeBoard> freeLists = (ArrayList)request.getAttribute("freeLists");

    int totalPage = (int)request.getAttribute("totalPage");
    int startPage = (int)request.getAttribute("startPage");
    int endPage = (int)request.getAttribute("endPage");
    int cPage = (int)request.getAttribute("cPage");

%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <title>자유게시판</title>

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

    <div class="main">  <!--https://glyphicons.com/-->
        <div class="row">
            <div class="col-8" style="font-size: 25px; margin: 0 45px 0 50px ; padding:30px 0 20px 0;">
                <i class="fa fa-comments fa-2x"> 자유게시판</i></div>
            <div class="col-3">
                <button type="button" class="btn btn-success" id="newbtn" style="margin:40px 0 15px 110px; ">
                    <i class="fa fa-plus-circle"> 새글쓰기</i>
                </button>
            </div>
        </div>

        <div class="row" style="margin: 10px 0 20px 0">
            <div class="list col-sm-3">
                <h3><i class="fa fa-assistive-listening-systems" aria-hidden="true"></i> 게시판</h3>
                <ul>
                    <%--해당 카테고리 a태그는 지워고 색깔 바꿔주세요--%>
                    <li style="color:#919191"> &block;&nbsp;&nbsp;자유게시판</li>
                    <li><a href="QnA.do">&block;&nbsp;&nbsp;자주하는 질문</a></li>
                    <li><a href="qnaList.do"> &block;&nbsp;&nbsp;QnA</a></li>
                </ul>
            </div>
            <!--게시판 목록-->
            <div class="col-sm-9">
                <form action="freeList.do" method="post">
                    <div class="row">
                        <span style="margin-left: 2%; font-weight: bold; color: #2c2cbd">&block;&nbsp;&nbsp;자유롭게 이야기해보세요!</span>
                        <!-- 검색 창 -->
                        <div class="box text-align" style="margin-left: 41%">
                            <div class="container-1" style=" margin:0 0 10px 0">
                                <input id="searchInput" name="searchText" placeholder="Search..." style="padding: 3px"/>
                                <button type="submit" class="btn" id="searchbtn" style="height: 35px"><i
                                        class="fa fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                </form>
                <table class="table table-striped"
                       style="margin-left:-18px; border-top: 0.5mm solid #000000; border-bottom: 0.5mm solid #000000">
                    <thead style="background-color: #c8e6e1; text-align: center">
                    <tr>
                        <th style="width: 7%">번호</th>
                        <th>제목</th>
                        <th style="width: 10%">작성자</th>
                        <th style="width: 15%">작성일</th>
                        <th style="width: 7%">추천</th>
                        <th style="width: 9%">조회수</th>
                    </tr>

                    </thead>
                    <tbody>
                    <tr STYLE="color: red">
                        <th>공지</th>
                        <th><span class="badge badge-danger"> HOT</span> '귀여운 강아지 사지 말고 분양 받으세요 !</th>
                        <th>운영자</th>
                        <th>2012-07-15</th>
                        <th>10</th>
                        <th>128</th>
                    </tr>
                    <% for (FreeBoard freeBoard : freeLists) {%>
                    <tr>
                        <td><a><%=freeBoard.getBdno()%>
                        </a></td>
                        <td><a href="freeView.do?bdno=<%=freeBoard.getBdno()%>"><%=freeBoard.getTitle()%>
                        </a></td>
                        <td><a><%=freeBoard.getUserid()%>
                        </a></td>
                        <td><a><%=freeBoard.getRegdate().substring(0, 10)%>
                        </a></td>
                        <td><a><%=freeBoard.getThumbs()%>
                        </a></td>
                        <td><a><%=freeBoard.getViews()%>
                        </a></td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row" style="margin: 10px 30px 20px 30px">
            <!--페이지네이션-->
            <div class="col-12">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <% if(cPage > 10) { %>
                        <li class="page-item">
                            <a class="page-link" href="freeList.jsp?cpage=<%=(startPage-10)%>" aria-label="Previous">
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
                        <li class="page-item"><a class="page-link" href="freeList.jsp?cpage=<%=i%>"><%=i%></a></li>
                        <% } %>
                        <% } %>

                        <% if(endPage <= totalPage) { %>
                        <li class="page-item">
                            <a class="page-link" href="freeList.jsp?cpage=<%=(endPage+1)%>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                        <% } %>
                    </ul>
                </nav>
            </div>
        </div>

        <%@ include file="../layout/footer.jsp" %>
    </div>
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
<script src="../../js/loginfrm.js"></script>


<script>

    // 새글쓰기
    $(function () {
        $('#newbtn').on('click', function (e) {
            location.href = 'freeWrite.do';
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

</script>
</body>
</html>