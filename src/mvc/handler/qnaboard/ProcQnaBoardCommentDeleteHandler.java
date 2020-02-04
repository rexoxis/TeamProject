package mvc.handler.qnaboard;

import dao.QnaBoardDAO;
import mvc.handler.MVCHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcQnaBoardCommentDeleteHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viewPage = "1|/ttproMVC/error.jsp";

        int check = 0;
        int bdno = Integer.parseInt(request.getParameter("bdno"));
        int Comment_bdno = Integer.parseInt(request.getParameter("Comment_bdno"));

        QnaBoardDAO qnadao = new QnaBoardDAO();

        check = qnadao.deleteComment(Comment_bdno);

        if (check >= 1) {
            viewPage = "2|qnaView.do?bdno="+bdno;
        }

        return viewPage;
    }
}

