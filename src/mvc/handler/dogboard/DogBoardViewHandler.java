package mvc.handler.dogboard;


import dao.DogBoardFactory;
import mvc.handler.MVCHandler;
import vo.DogBoard;
import vo.DogComments;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class DogBoardViewHandler implements MVCHandler {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 인코딩 처리
        request.setCharacterEncoding("utf-8");


        HttpSession session = request.getSession();

        String viewPage = "1|/ttproMVC/dogboard/dogView.jsp";

        DogBoardFactory dogdao = new DogBoardFactory();

        int bdno = 0;

        if (request.getParameter("bdno") != null) {
            bdno = Integer.parseInt(request.getParameter("bdno"));
        }

        System.out.println("dogView bdno : " + bdno);

        // 조회수 증가 메소드 호출
        dogdao.viewsUp(bdno);

        // 글 상세보기 메소드 호출
        ArrayList<DogBoard> dogLists = dogdao.dogView(bdno);

        session.setAttribute("dogLists", dogLists);

        // 댓글 읽어오는 메소드 호출
        ArrayList<DogComments> dogCommentLists = dogdao.dogcommentView(bdno);

        request.setAttribute("dogCommentLists", dogCommentLists);

        return viewPage;
    }
}
