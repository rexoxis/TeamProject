package mvc.handler.member;

import dao.GoodMembersDAO;
import mvc.handler.MVCHandler;
import vo.GoodMembers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcJoinMemberHandler implements MVCHandler {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viewPage = "1|/ttproMVC/signup/joinMember.jsp";

        GoodMembersDAO mdao = new GoodMembersDAO();

        GoodMembers gmb = new GoodMembers();
        gmb.setName(request.getParameter("name"));
        gmb.setJumin1(request.getParameter("jumin1"));
        gmb.setJumin2(request.getParameter("jumin2"));
        gmb.setUserid(request.getParameter("userid"));
        gmb.setPasswd(request.getParameter("passwd"));
        gmb.setZip(request.getParameter("zip"));
        gmb.setAddr1(request.getParameter("addr1"));
        gmb.setAddr2(request.getParameter("addr2"));
        gmb.setEmail1(request.getParameter("email1"));
        gmb.setEmail2(request.getParameter("email2"));
        gmb.setTel1(request.getParameter("tel1"));
        gmb.setTel2(request.getParameter("tel2"));
        gmb.setTel3(request.getParameter("tel3"));
            
//        String mycap = request.setParameter("cap");
//        String servercap = (String) session.setAttribute("cta");
//        System.out.println(mycap);
//        System.out.println(servercap);
//
//        if (mycap.equals(servercap)) {
        int isOk = 0;
        isOk = mdao.joinMember(gmb);

        if (isOk >= 1) {
            viewPage = "2|signRight.do";
        }
//        } else {
//            session.setAttribute("gmb",gmb);
//            response.sendRedirect("joinMember.jsp");
//        }

        return viewPage;
    }
}
