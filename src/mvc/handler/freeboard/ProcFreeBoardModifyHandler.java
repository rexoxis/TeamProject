package mvc.handler.freeboard;

import dao.FreeBoardDAO;
import mvc.handler.MVCHandler;
import vo.FreeBoard;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcFreeBoardModifyHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String viewPage = "1|/ttproMVC/error.jsp";

        int bdno = Integer.parseInt(request.getParameter("bdno"));

        int check = 0;


        FreeBoardDAO freedao = new FreeBoardDAO();

        FreeBoard freeBoard = new FreeBoard();

        freeBoard.setBdno(bdno);
        freeBoard.setTitle(request.getParameter("title"));
        freeBoard.setContents(request.getParameter("contents"));

        check = freedao.modifyBoard(freeBoard);

        if (check >= 1) {
            viewPage = "2|freeView.do?bdno="+bdno;
        }

        return viewPage;
    }
}

