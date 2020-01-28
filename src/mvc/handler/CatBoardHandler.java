package mvc.handler;


import dao.CatBoardFactory;
import vo.CatBoard;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

public class CatBoardHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 인코딩 처리
        request.setCharacterEncoding("utf-8");

        String viewPage = "1|catList.do";

        String colname = request.getParameter("colname");
        String findtext = request.getParameter("findtext");

        if (colname == null || colname.equals("selected") || findtext.equals("")){
            colname = "selected";
            findtext = "";
        }

        HashMap<String, String> searchList = new HashMap<>();

        searchList.put(colname, findtext);

        CatBoardFactory catdao = new CatBoardFactory();

        // 페이징 부분

        int boardCount = catdao.countBoard();

        int perPage = 16;
        int totalPage = boardCount / perPage;

        if(boardCount % perPage > 0) ++totalPage;

        int cPage = Integer.parseInt(request.getParameter("cpage"));

        int startPage = ((cPage - 1)/10) * 10 + 1;
        int endPage = startPage + 10 - 1;

        if(cPage > totalPage){
            response.sendRedirect("listerror.jsp");
        }

        int startnum = ((cPage-1) * perPage) + 1;
        int endnum = startnum + perPage - 1;

        // 글번호 계산
        int boardNumber = boardCount - ((cPage-1) * perPage);

        ArrayList<CatBoard> catLists = catdao.catList(searchList, startnum, endnum);

        request.setAttribute("catLists", catLists);

        request.setAttribute("boardCount", boardCount);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("cPage", cPage);
        request.setAttribute("boardNumber", boardNumber);


        return viewPage;
    }
}
