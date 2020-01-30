package mvc.handler.reviewboard;


import dao.ReviewBoardFactory;
import mvc.handler.MVCHandler;
import vo.ReviewBoard;
import vo.ReviewComments;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class ReviewBoardViewHandler implements MVCHandler {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 인코딩 처리
        request.setCharacterEncoding("utf-8");


        HttpSession session = request.getSession();

        String viewPage = "1|/ttproMVC/reviewboard/reviewView.jsp";

        ReviewBoardFactory reviewdao = new ReviewBoardFactory();

        int bdno = 0;

        if (request.getParameter("bdno") != null) {
            bdno = Integer.parseInt(request.getParameter("bdno"));
        }

        System.out.println("reviewView bdno : " + bdno);

        // 조회수 증가 메소드 호출
        reviewdao.viewsUp(bdno);

        // 글 상세보기 메소드 호출
        ArrayList<ReviewBoard> reviewLists = reviewdao.boardView(bdno);

        session.setAttribute("reviewLists", reviewLists);

        // 댓글 읽어오는 메소드 호출
        ArrayList<ReviewComments> reviewCommentLists = reviewdao.commentView(bdno);

        request.setAttribute("reviewCommentLists", reviewCommentLists);

        return viewPage;
    }
}
