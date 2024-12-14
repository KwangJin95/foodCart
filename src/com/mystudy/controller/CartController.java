package com.mystudy.controller;

import com.mystudy.command.Command;
import com.mystudy.command.cart.CartInsertCommand;
import com.mystudy.command.cart.CartListCommand;
import com.mystudy.model.vo.MemberVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/cart")
public class CartController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println(">> FrontControllerCommand doGet() 실행----");
        String type = request.getParameter("type");
        System.out.println("> type : " + type);
//        // 로그인 체크
        if (request.getSession().getAttribute("loginUser") == null) {
//            System.out.println(((MemberVO) request.getSession().getAttribute("loginUser")).getId());
            System.out.println("로그인 필요");
            response.sendRedirect("controller?type=login");
            return;
        }
        System.out.println("로그인 체크완료");
        System.out.println(((MemberVO) request.getSession().getAttribute("loginUser")).getId());

        Command command = null;
        if ("CartList".equals(type)) {
            command = new CartListCommand();
        }
        if ("Insert".equals(type)) {
            command = new CartInsertCommand();
        }

        String path = command.exec(request, response);
        request.getRequestDispatcher(path).forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(">> ControllerCommand doPost() 실행----");
        req.setCharacterEncoding("UTF-8");
        doGet(req, resp);
    }

}
