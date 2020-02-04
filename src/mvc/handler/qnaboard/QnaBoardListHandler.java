package mvc.handler.qnaboard;


import dao.FreeBoardDAO;
import mvc.handler.MVCHandler;
import vo.FreeBoard;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class QnaBoardListHandler implements MVCHandler {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 인코딩 처리
        request.setCharacterEncoding("utf-8");

        String viewPage = "1|/ttproMVC/freeboard/freeList.jsp";

        String searchText = request.getParameter("searchText");

        if (searchText == null || searchText.equals("")) {
            searchText = "baselist";
        }


        // 페이징 부분

        FreeBoardDAO freedao = new FreeBoardDAO();

        int boardCount = freedao.countBoard();

        int perPage = 10;
        int totalPage = boardCount / perPage;

        if(boardCount % perPage > 0) ++totalPage;

        int cPage = Integer.parseInt(request.getParameter("cpage"));

        int startPage = ((cPage - 1)/10) * 10 + 1;
        int endPage = startPage + 10 - 1;

        if(cPage > totalPage){
            viewPage = "1|/ttproMvc/error.jsp";
        }

        int startnum = ((cPage-1) * perPage) + 1;
        int endnum = startnum + perPage - 1;

        // 글번호 계산
        int boardNumber = boardCount - ((cPage-1) * perPage);

        ArrayList<FreeBoard> freeLists = freedao.viewList(searchText, startnum, endnum);

        request.setAttribute("freeLists", freeLists);

        request.setAttribute("totalPage", totalPage);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("cPage", cPage);
        request.setAttribute("boardNumber", boardNumber);

        return viewPage;
    }
}
