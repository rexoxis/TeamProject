package mvc.controller;


import mvc.handler.MVCHandler;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("*.do")
public class Controller extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        String command = uri.substring(uri.lastIndexOf("/")+1);
        System.out.println("Controller uri : " + uri);
        System.out.println("Controller command : " + command);

        MVCHandler handler = (MVCHandler)InitController.getCommandMap().get(command);

        String viewPage = handler.execute(request, response);
        String checkView [] = viewPage.split("[|]");

        // 1은 간단한 페이지 넘김, 2는 db와 연결해서 데이터 변동이 있는 이동
        if (checkView[0].equals("1")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher(checkView[1]);
            dispatcher.forward(request, response);
        } else if (checkView[0].equals("2")) {
            response.sendRedirect(checkView[1]);
        }
    }
}
