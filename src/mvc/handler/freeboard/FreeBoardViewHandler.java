package mvc.handler.freeboard;


import dao.DogBoardDAO;
import dao.FreeBoardDAO;
import mvc.handler.MVCHandler;
import vo.DogBoard;
import vo.DogComments;
import vo.FreeBoard;
import vo.FreeComments;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class FreeBoardViewHandler implements MVCHandler {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 인코딩 처리
        request.setCharacterEncoding("utf-8");


        HttpSession session = request.getSession();

        String viewPage = "1|/ttproMVC/freeboard/freeView.jsp";

        FreeBoardDAO freedao = new FreeBoardDAO();

        int bdno = 0;

        if (request.getParameter("bdno") != null) {
            bdno = Integer.parseInt(request.getParameter("bdno"));
        }

        // 조회수 증가 메소드 호출
        freedao.viewUP(bdno);

        // 글 상세보기 메소드 호출
        ArrayList<FreeBoard> freeLists = freedao.viewcontents(bdno);

        session.setAttribute("freeLists", freeLists);

        // 댓글 읽어오는 메소드 호출
        ArrayList<FreeComments> freeCommentLists = freedao.commentView(bdno);

        request.setAttribute("freeCommentLists", freeCommentLists);

        return viewPage;
    }
}
