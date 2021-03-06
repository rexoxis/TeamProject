package mvc.handler.catboard;

import dao.CatBoardDAO;
import mvc.handler.MVCHandler;
import vo.CatComments;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcCatBoardCommentHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String viewPage = "1|/ttproMVC/error.jsp";

        int check = 0;

        // 현재 글의 게시판 번호
        int catBoard_bdno = Integer.parseInt(request.getParameter("bdno"));

        CatBoardDAO catdao = new CatBoardDAO();

        CatComments catComments = new CatComments();
        // 파라미터로 넘어온 댓글 작성자, 내용 vo클래ㅅ에 저장
        catComments.setCatc_userid(request.getParameter("catCommnet_userid"));
        catComments.setCatc_contents(request.getParameter("catComment_contents"));

        // 댓글등록 메소드 호출
        check = catdao.commentsCatWrite(catComments,catBoard_bdno);

        // 처리 결과에 따라 페이지 이동
        if (check >= 1) {
            viewPage = "2|catView.do?bdno="+catBoard_bdno;
        }

        return viewPage;
    }
}

