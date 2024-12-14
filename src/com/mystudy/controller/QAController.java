package com.mystudy.controller;

import com.mystudy.command.*;
import com.mystudy.command.qa.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/qa")
public class QAController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");

        if (request.getSession().getAttribute("loginUser") == null) {
            PrintWriter out = response.getWriter();
            System.out.println("로그인 필요");
            response.sendRedirect("controller?type=login");
            return;
        }

        Command command = null;
        if ("QAList".equals(type)) {
            command = new QAListCommand();
        } else if ("QADetail".equals(type)) {
            command = new QADetailCommand();
        } else if ("AdminQADetail".equals(type)) {
            command = new AdminQADetailCommand();
        } else if ("MyQAList".equals(type)) {
            command = new MyQAListCommand();
        } else if("QAInsert".equals(type)){
            command = new QAInsertCommand();
        } else if("QAWrite".equals(type)){
            command = new QAWriteCommand();
        } else if("QADelete".equals(type)) {
            command = new QADeleteCommand();
        } else if("QAUpdate".equals(type)) {
            command = new QAUpdateCommand();
        } else if("QAModify".equals(type)) {
            command = new QAModifyCommand();
        } else if("FAQ".equals(type)){
            command = new FAQCommand();
        } else if("CS".equals(type)){
        	command = new CSCommand();
        } else if("Admin".equals(type)){
            command = new CSCommand();
        } else {
//            command = new QAListCommand();
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
