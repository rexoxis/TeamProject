package mvc.handler.freeboard;

import dao.FreeBoardDAO;
import mvc.handler.MVCHandler;
import vo.FreeBoard;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcFreeBoardWriteHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String viewPage = "1|/ttproMVC/freeboard/freeWrite.jsp";

        int check = 0;

        FreeBoardDAO freedao = new FreeBoardDAO();

        FreeBoard freeBoard = new FreeBoard();

        freeBoard.setUserid(request.getParameter("userid"));
        freeBoard.setTitle(request.getParameter("title"));
        freeBoard.setContents(request.getParameter("contents"));

        String selectbd = request.getParameter("selectbd");

        check = freedao.writeboard(freeBoard, selectbd);

        if (check >= 1) {
            viewPage = "2|freeList.do";
        } else {
            System.out.println("글쓰기 실패");
        }

        return viewPage;
    }
}

