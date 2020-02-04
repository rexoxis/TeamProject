package mvc.handler.dogboard;

import dao.DogBoardDAO;
import mvc.handler.MVCHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcDogBoardDeleteHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viewPage = "1|/ttproMVC/error.jsp";

        int check = 0;

        DogBoardDAO dogdao = new DogBoardDAO();

        int bdno = Integer.parseInt(request.getParameter("bdno"));

        check = dogdao.deleteDogList(bdno);

        if (check >= 1) {
            viewPage = "2|dogList.do";
        }

        return viewPage;
    }
}

