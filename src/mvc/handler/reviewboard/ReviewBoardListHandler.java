package mvc.handler.reviewboard;


import dao.ReviewBoardDAO;
import mvc.handler.MVCHandler;
import vo.ReviewBoard;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

public class ReviewBoardListHandler implements MVCHandler {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 인코딩 처리
        request.setCharacterEncoding("utf-8");

        String viewPage = "1|/ttproMVC/reviewboard/reviewList.jsp";

        String colname = request.getParameter("colname");
        String findtext = request.getParameter("findtext");

        if (colname == null || colname.equals("selected") || findtext.equals("")){
            colname = "selected";
            findtext = "";
        }

        HashMap<String, String> searchList = new HashMap<>();

        searchList.put(colname, findtext);

        ReviewBoardDAO reviewdao = new ReviewBoardDAO();

        // 페이징 부분

        int boardCount = reviewdao.countBoard();

        int perPage = 16;
        int pageBlock = 10;
        int cPage = 1;

        if (request.getParameter("cpage") != null){
            cPage = Integer.parseInt(request.getParameter("cpage"));
        }

        int totalPage = boardCount / perPage;

        if(boardCount % perPage > 0) ++totalPage;


        int startPage = ((cPage - 1)/pageBlock) * pageBlock + 1;
        int endPage = startPage + pageBlock - 1;

        if(cPage > totalPage){
            viewPage = "1|/ttproMVC/error.jsp";
        }

        int startnum = ((cPage-1) * perPage) + 1;
        int endnum = startnum + perPage - 1;

        // 글번호 계산
        int boardNumber = boardCount - ((cPage-1) * perPage);

        ArrayList<ReviewBoard> reviewLists = reviewdao.boardList(searchList, startnum, endnum);

        request.setAttribute("reviewLists", reviewLists);

        request.setAttribute("totalPage", totalPage);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("cPage", cPage);
        request.setAttribute("boardNumber", boardNumber);

        return viewPage;
    }
}
