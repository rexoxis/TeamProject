package mvc.handler.dogboard;

import dao.DogBoardFactory;
import mvc.handler.MVCHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DogBoardCommentDeleteHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viewPage = "1|/ttproMVC/error.jsp";

        int check = 0;
        int bdno = Integer.parseInt(request.getParameter("bdno"));
        int Comment_bdno = Integer.parseInt(request.getParameter("Comment_bdno"));

        DogBoardFactory dogdao = new DogBoardFactory();

        check = dogdao.deleteComment(Comment_bdno);

        if (check >= 1) {
            viewPage = "2|dogView.do?bdno="+bdno;
        }

        return viewPage;
    }
}

