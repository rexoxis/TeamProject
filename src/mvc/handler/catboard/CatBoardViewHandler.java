package mvc.handler.catboard;


import dao.CatBoardFactory;
import mvc.handler.MVCHandler;
import vo.CatBoard;
import vo.CatComments;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class CatBoardViewHandler implements MVCHandler {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 인코딩 처리
        request.setCharacterEncoding("utf-8");


        HttpSession session = request.getSession();

        String viewPage = "1|/ttproMVC/catboard/catView.jsp";

        CatBoardFactory catdao = new CatBoardFactory();

        int bdno = 0;

        if (request.getParameter("bdno") != null) {
            bdno = Integer.parseInt(request.getParameter("bdno"));
        }

        System.out.println("catView bdno : " + bdno);

        // 조회수 증가 메소드 호출
        catdao.viewsUp(bdno);

        // 글 상세보기 메소드 호출
        ArrayList<CatBoard> catLists = catdao.catView(bdno);

        session.setAttribute("catLists", catLists);

        // 댓글 읽어오는 메소드 호출
        ArrayList<CatComments> catCommentLists = catdao.catcommentView(bdno);

        request.setAttribute("catCommentLists", catCommentLists);

        return viewPage;
    }
}
