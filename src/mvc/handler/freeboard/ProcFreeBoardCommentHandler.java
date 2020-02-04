package mvc.handler.freeboard;

import dao.FreeBoardDAO;
import mvc.handler.MVCHandler;
import vo.FreeComments;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcFreeBoardCommentHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String viewPage = "1|/ttproMVC/error.jsp";

        int check = 0;

        // 현재 글의 게시판 번호
        int freeBoard_bdno = Integer.parseInt(request.getParameter("bdno"));

        FreeBoardDAO freedao = new FreeBoardDAO();

        FreeComments freeComments = new FreeComments();

        // 파라미터로 넘어온 댓글 작성자, 내용 vo클래ㅅ에 저장
        freeComments.setComt_userid(request.getParameter("freeCommnet_userid"));
        freeComments.setComt_contents(request.getParameter("freeComment_contents"));

        // 댓글등록 메소드 호출
        check = freedao.commentsWrite(freeComments,freeBoard_bdno);

        // 처리 결과에 따라 페이지 이동
        if (check >= 1) {
            viewPage = "2|freeView.do?bdno="+freeBoard_bdno;
        }

        return viewPage;
    }
}

