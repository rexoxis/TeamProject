package mvc.handler.qnaboard;

import dao.QnaBoardDAO;
import mvc.handler.MVCHandler;
import vo.QnaBoard;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcQnaBoardModifyHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String viewPage = "1|/ttproMVC/error.jsp";

        int bdno = Integer.parseInt(request.getParameter("bdno"));

        int check = 0;


        QnaBoardDAO qnadao = new QnaBoardDAO();

        QnaBoard qnaBoard = new QnaBoard();

        qnaBoard.setBdno(bdno);
        qnaBoard.setTitle(request.getParameter("title"));
        qnaBoard.setContents(request.getParameter("contents"));

        check = qnadao.modifyQnaList(qnaBoard);

        if (check >= 1) {
            viewPage = "2|qnaView.do?bdno="+bdno;
        }

        return viewPage;
    }
}

