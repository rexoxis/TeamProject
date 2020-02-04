package mvc.handler.qnaboard;


import dao.QnaBoardDAO;
import mvc.handler.MVCHandler;
import vo.QnaBoard;
import vo.QnaComments;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class QnaBoardViewHandler implements MVCHandler {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 인코딩 처리
        request.setCharacterEncoding("utf-8");


        HttpSession session = request.getSession();

        String viewPage = "1|/ttproMVC/qnaboard/qnaView.jsp";

        QnaBoardDAO qnadao = new QnaBoardDAO();

        int bdno = 0;

        if (request.getParameter("bdno") != null) {
            bdno = Integer.parseInt(request.getParameter("bdno"));
        }

        // 조회수 증가 메소드 호출
        qnadao.ReadCnt(bdno);

        // 글 상세보기 메소드 호출
        ArrayList<QnaBoard> qnaLists = qnadao.views(bdno);

        session.setAttribute("qnaLists", qnaLists);

        // 댓글 읽어오는 메소드 호출
        ArrayList<QnaComments> qnaCommentLists = qnadao.commentView(bdno);

        request.setAttribute("qnaCommentLists", qnaCommentLists);

        return viewPage;
    }
}
