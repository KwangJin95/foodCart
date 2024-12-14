package com.mystudy.command.qa;

import com.mystudy.command.Command;
import com.mystudy.common.Paging;
import com.mystudy.model.dao.QADAO;
import com.mystudy.model.vo.MemberVO;
import com.mystudy.model.vo.QAVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class MyQAListCommand implements Command{

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //================================
        //DB데이터(게시글) 가져오기
        String memid = ((MemberVO) (request.getSession().getAttribute("loginUser"))).getId();
        List<QAVO> list = QADAO.getQAList(memid);

        //2. 응답페이지(MyQAList.jsp)에 전달
        request.setAttribute("list", list);

        return "qa/MyQAList.jsp";
    }
}
