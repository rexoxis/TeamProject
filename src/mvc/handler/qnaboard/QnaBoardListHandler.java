package mvc.handler.qnaboard;


import dao.QnaBoardDAO;
import mvc.handler.MVCHandler;
import vo.QnaBoard;

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

        String viewPage = "1|/ttproMVC/qnaboard/qnaList.jsp";

        String searchText = request.getParameter("searchText");

        if (searchText == null || searchText.equals("")) {
            searchText = "baselist";
        }


        // 페이징 부분

        QnaBoardDAO qnadao = new QnaBoardDAO();

        int boardCount = qnadao.countBoard();

        int cPage = 1;
        int perPage = 15;
        int pageBlock = 10;
        int totalPage = boardCount / perPage;

        if (request.getParameter("cpage") != null){
            cPage = Integer.parseInt(request.getParameter("cpage"));
        }

        if(boardCount % perPage > 0) ++totalPage;

        int startPage = ((cPage - 1)/pageBlock) * pageBlock + 1;
        int endPage = startPage + pageBlock - 1;

        if(cPage > totalPage){
            viewPage = "1|/ttproMvc/error.jsp";
        }

        int startnum = ((cPage-1) * perPage) + 1;
        int endnum = startnum + perPage - 1;

        // 글번호 계산
        int boardNumber = boardCount - ((cPage-1) * perPage);

        ArrayList<QnaBoard> qnaLists = qnadao.qnalist(searchText, startnum, endnum);

        request.setAttribute("qnaLists", qnaLists);

        request.setAttribute("totalPage", totalPage);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("cPage", cPage);
        request.setAttribute("boardNumber", boardNumber);

        return viewPage;
    }
}
