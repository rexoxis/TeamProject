package mvc.handler.anwserboard;


import dao.AnwserBoardDAO;
import mvc.handler.MVCHandler;
import vo.AnwserBoard;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class AnwserBoardViewHandler implements MVCHandler {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 인코딩 처리
        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();

        String viewPage = "1|/ttproMVC/anwserboard/anwserView.jsp";

        AnwserBoardDAO anwserdao = new AnwserBoardDAO();

        int bdno = 0;

        if (request.getParameter("bdno") != null) {
            bdno = Integer.parseInt(request.getParameter("bdno"));
        }

        System.out.println("AnwserBoardViewHandler bdno : " + bdno);

        // 조회수 증가 메소드 호출
        anwserdao.anwserViewUp(bdno);

        // 글 상세보기 메소드 호출
        ArrayList<AnwserBoard> anwserLists = anwserdao.AnwserView(bdno);

        if (anwserLists == null) {
            viewPage = "1|/ttproMVC/error.jsp";
        } else {
            session.setAttribute("anwserLists", anwserLists);
        }

        return viewPage;
    }
}
