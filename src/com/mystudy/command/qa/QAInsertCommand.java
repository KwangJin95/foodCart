package com.mystudy.command.qa;

import com.mystudy.command.Command;
import com.mystudy.model.dao.QADAO;
import com.mystudy.model.vo.MemberVO;
import com.mystudy.model.vo.QAVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class QAInsertCommand implements Command{
    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. 사용자로부터 폼 데이터를 받아와서 QAVO 객체에 설정
        String memid = ((MemberVO) (request.getSession().getAttribute("loginUser"))).getId();
        String category = request.getParameter("category");
        String title = request.getParameter("title");
        String content = request.getParameter("content");


        // 2. QAVO 객체를 생성하고 데이터 설정
        QAVO qa = new QAVO();
        qa.setMemid(memid);
        qa.setCategory(category);
        qa.setTitle(title);
        qa.setContent(content);

        // 3. QADAO를 사용하여 데이터베이스에 등록
        QADAO dao = new QADAO();
        int result = dao.insertQA(qa);


        if (result > 0) {
            return "qa?type=MyQAList";
        } else {
            return "ErrorPage.jsp";
        }
    }
}
