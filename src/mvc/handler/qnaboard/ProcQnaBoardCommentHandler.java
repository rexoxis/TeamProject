package mvc.handler.qnaboard;

import dao.QnaBoardDAO;
import mvc.handler.MVCHandler;
import vo.QnaComments;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcQnaBoardCommentHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String viewPage = "1|/ttproMVC/error.jsp";

        int check = 0;

        // 현재 글의 게시판 번호
        int qnaBoard_bdno = Integer.parseInt(request.getParameter("bdno"));

        QnaBoardDAO qnadao = new QnaBoardDAO();

        QnaComments qnaComments = new QnaComments();

        // 파라미터로 넘어온 댓글 작성자, 내용 vo클래ㅅ에 저장
        qnaComments.setComt_userid(request.getParameter("qnaCommnet_userid"));
        qnaComments.setComt_contents(request.getParameter("qnaComment_contents"));

        // 댓글등록 메소드 호출
        check = qnadao.commentsWrite(qnaComments,qnaBoard_bdno);

        // 처리 결과에 따라 페이지 이동
        if (check >= 1) {
            viewPage = "2|qnaView.do?bdno="+qnaBoard_bdno;
        }

        return viewPage;
    }
}

