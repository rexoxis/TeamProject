package mvc.handler.reviewboard;

import dao.ReviewBoardDAO;
import mvc.handler.MVCHandler;
import vo.ReviewComments;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcReviewBoardCommentHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String viewPage = "1|/ttproMVC/error.jsp";

        int check = 0;

        // 현재 글의 게시판 번호
        int reviewBoard_bdno = Integer.parseInt(request.getParameter("bdno"));

        ReviewBoardDAO reviewdao = new ReviewBoardDAO();

        ReviewComments reviewComments = new ReviewComments();
        // 파라미터로 넘어온 댓글 작성자, 내용 vo클래ㅅ에 저장
        reviewComments.setComt_userid(request.getParameter("reviewCommnet_userid"));
        reviewComments.setComt_contents(request.getParameter("reviewComment_contents"));

        // 댓글등록 메소드 호출
        check = reviewdao.commentsWrite(reviewComments,reviewBoard_bdno);

        // 처리 결과에 따라 페이지 이동
        if (check >= 1) {
            viewPage = "2|reviewView.do?bdno="+reviewBoard_bdno;
        }

        return viewPage;
    }
}

