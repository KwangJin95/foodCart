package com.mystudy.command.qa;

import com.mystudy.command.Command;
import com.mystudy.model.dao.QADAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class QADeleteCommand implements Command {
    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. 삭제 작업을 수행하고 성공 여부를 반환하는 메서드를 호출
        int qaIdToDelete = Integer.parseInt(request.getParameter("qaId")); // 질문 ID를 파라미터로 받음
        QADAO dao = new QADAO();
        int result = dao.deleteQA(qaIdToDelete); // 삭제 작업을 수행하고 성공 여부를 반환

        if (result >= 0) {
        	return "myPage.jsp";
        } else {
            // 3. 삭제가 실패한 경우 다른 페이지로 리디렉션 또는 오류 메시지를 표시
            return "ErrorPage.jsp";
        }
    }
}
