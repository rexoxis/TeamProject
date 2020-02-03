package mvc.handler.catboard;

import dao.CatBoardFactory;
import mvc.handler.MVCHandler;
import vo.CatComments;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcCatBoardCommentDeleteHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viewPage = "1|/ttproMVC/error.jsp";

        int check = 0;
        int bdno = Integer.parseInt(request.getParameter("bdno"));
        int Comment_bdno = Integer.parseInt(request.getParameter("comment_bdno"));

        CatBoardFactory catdao = new CatBoardFactory();

        check = catdao.deleteComment(Comment_bdno);

        System.out.println("deleteComment bdno : " + bdno);
        System.out.println("deleteComment Comment_bdno : " + Comment_bdno);

        if (check >= 1) {
            viewPage = "2|catView.do?bdno="+bdno;
        }

        return viewPage;
    }
}

