package mvc.handler.dogboard;

import dao.DogBoardFactory;
import mvc.handler.MVCHandler;
import vo.DogComments;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcDogBoardCommentHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String viewPage = "1|/ttproMVC/error.jsp";

        int check = 0;

        // 현재 글의 게시판 번호
        int dogBoard_bdno = Integer.parseInt(request.getParameter("bdno"));

        DogBoardFactory dogdao = new DogBoardFactory();

        DogComments dogComments = new DogComments();
        // 파라미터로 넘어온 댓글 작성자, 내용 vo클래ㅅ에 저장
        dogComments.setDogc_userid(request.getParameter("dogCommnet_userid"));
        dogComments.setDogc_contents(request.getParameter("dogComment_contents"));

        // 댓글등록 메소드 호출
        check = dogdao.commentsDogWrite(dogComments,dogBoard_bdno);

        // 처리 결과에 따라 페이지 이동
        if (check >= 1) {
            viewPage = "2|dogView.do?bdno="+dogBoard_bdno;
        }

        return viewPage;
    }
}

