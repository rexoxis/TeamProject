<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.Boardv12" %>

<%@ include file="jdbc.jsp"%>


<%
    // JDBC 관련 객체
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String listSQL = "select bdno,title,userid,views,regdate from boardv12 order by bdno desc";
    String countSQL = "select count(bdno) from boardv12";
    String pagingSQL = " select * from (select bd.bdno, bd.title, bd.userid, bd.views, bd.regdate, rownum as rnum from " +
            " (select bdno, title, userid, views, regdate from boardv12 order by bdno desc) bd " +
            " where rownum <= ?) bd2 " +
            " where bd2.rnum >= ? ";
    // 1번이 rownum이 되어버림

    List<Boardv12> lists = null;
    int bdcnt = 0;

    // 게시판 리스트 처리 (1) - 전체 게시물 수를 표시

    try {
        Class.forName(DRV);
        conn = DriverManager.getConnection(URL, USR, PWD);
        pstmt = conn.prepareStatement(countSQL);
        rs = pstmt.executeQuery();

        if(rs.next()) bdcnt = rs.getInt(1);

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if(rs != null) rs.close();
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }


    // 게시판 리스트 처리 (3) - 하단 네비게이션 바 생성
    // 1. 전체 게시물 수를 계산
    // 2. 페이지당 보여줄 게시물 수를 지정
    // 3. 총 페이지 수를 계산

    int perPage = 10;
    int totalPage = bdcnt / perPage;

    if(bdcnt % perPage > 0) ++totalPage;

    // 4. 현제 페이지에 따라 보여줄 페이지 블럭을 결정함
    // Ex) cPage = 1 : 1 2 3 4 5 6 7 8 9 10
    // Ex) cPage = 11 : 11 12 13 14 15 16 17 18 19 20

    int cPage = Integer.parseInt(request.getParameter("cpage"));
    int startPage = ((cPage - 1)/10) * 10 + 1;
    int endPage = startPage + 10 - 1;

    if(cPage > totalPage){
        response.sendRedirect("listerror.jsp");
    }

    // 게시판 리스트 처리 (4) - 게시물 페이징 처리
    // 현재 페이지 번호에 맞게 게시물이 적절히 출력되어야 함
    // Ex) cp = 1 : bdno = 1, 25
    // Ex) cp = 2 : bdno = 26, 50
    // Ex) cp = 3 : bdno = 51, 65
    // 오라클에서 데이터 페이징을 하려면 row_number 함수나 rownum을 이용해야 함
    // mysql에서는 막강한 성능의 페이징 기능이 있어 손쉽게 구현가능(limit by 절)
    int startnum = ((cPage-1) * perPage) + 1;
    int endnum = startnum + perPage - 1;

    try {
        Class.forName(DRV);
        conn = DriverManager.getConnection(URL, USR, PWD);
        pstmt = conn.prepareStatement(pagingSQL);

        pstmt.setInt(1, endnum);
        pstmt.setInt(2, startnum);

        rs = pstmt.executeQuery();

        lists = new ArrayList<>();

        while (rs.next()) {
            Boardv12 b = new Boardv12();
            // SQL문에서 1번이 rownum이 되어버려서 하나씩 밀림
            b.setBdno(rs.getString(1));
            b.setTitle(rs.getString(2));
            b.setUserid(rs.getString(3));
            b.setViews(rs.getString(4));
            b.setRegdate(rs.getString(5));

            lists.add(b);
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if(rs != null) rs.close();
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }

    // 글번호 다시 계산
    int bdno = bdcnt - ((cPage-1) * perPage);
%>

<html>
<head>
<link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>게시판 - 목록출력</title>
</head>
<body>

	<jsp:include page="header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	<div class="container">
		<form >
			<div>
				<div class="text-right">
					<span class="badge badge-success">전체 <%=bdcnt%> 개 게시물</span>
					<span class="badge badge-success">전체 <%=totalPage%> 페이지</span>
				</div>
			</div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th width="13%">번호</th>
						<th>제목</th>
						<th width="15%">작성자</th>
						<th width="15%">작성일</th>
						<th width="10%">조회</th>
					</tr>
					<% for(Boardv12 b : lists) {%>
					<tr>
						<td><%=bdno--%></td>
						<td><a href="view.jsp?bdno=<%=b.getBdno()%>"><%=b.getTitle()%></a></td>
						<td><%=b.getUserid()%></td>
						<td><%=b.getRegdate().substring(0,10)%></td>
						<td><%=b.getViews()%></td>
					</tr>
					<% } %>
				</table>
			</div>
			<div align="center">
                <% if(cPage > 10) {
                    out.print("<span><a href='?cpage="+(startPage-10)+"'>" + "이전</a>&nbsp;</span>");
                }%>

                <% for(int i = startPage; i <= endPage; i++) { %>
                    <% if(i > totalPage) break;
                       if(cPage == i){
                           out.print("<span style='color:red; font-size:25px'>"+ i + "&nbsp;</span>");
                       } else {
                           out.print("<span><a href='?cpage="+i+"'>"+ i + "</a>&nbsp;</span>");
                       }
                    %>
				<% } %>

                <% if(endPage <= totalPage) {
                    out.print("<span><a href='?cpage="+ (endPage+1) +"'>" + "다음</a>&nbsp;</span>");
                }%>

			</div>
			<div align="left">
				<table>
					<tr>
						<td width="70%" align="left">&nbsp;&nbsp;

                            <select name="ftype" class="txt">
                                    <option value="title">제목에서</option>
                                    <option value="contents">본문에서</option>
                                    <option value="userid">글쓴이에서</option>
                            </select>

                            <input name="text" type="text" />
                            <button type="button" id="findbtn" class="btn btn-primary ">검색</button>

						</td>
						<td width="300px">
                            <div class="text-right">
                                <button type="button" id="newbtn" class="btn btn-danger">글쓰기</button>
                            </div>
						</td>
					</tr>
				</table>
			</div>
		</form>
		<hr>
	</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
</body>
</html>





