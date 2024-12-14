package com.mystudy.command.qa;


import com.mystudy.command.Command;
import com.mystudy.model.dao.QADAO;
import com.mystudy.model.vo.QAVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class QADetailCommand implements Command {

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. 파라미터로 전달된 게시글 ID 가져오기
        String qaIdStr = request.getParameter("qaId");

        if (qaIdStr != null && !qaIdStr.isEmpty()) {
            try {
                int qaId = Integer.parseInt(qaIdStr);

                // 2. 데이터베이스에서 해당 게시글의 상세 정보 가져오기
                QADAO dao = new QADAO();
                QAVO qa = dao.getQADetail(qaId);

                QADAO answerDao = new QADAO();
                QAVO answer = answerDao.getAnswerQADetail(qaId);

                // 3. 가져온 정보를 request 객체에 설정
                request.setAttribute("qaId", qa.getQaId());
                request.setAttribute("title", qa.getTitle());
                request.setAttribute("productCode", qa.getProductCode());
                request.setAttribute("rDate", qa.getrDate());
                request.setAttribute("content", qa.getContent());
                request.setAttribute("answer", answer);

                // 4. 상세 정보를 표시할 JSP 페이지로 이동
                return "qa/QADetail.jsp";
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // 오류 처리: 게시글 ID가 유효하지 않은 경우
        request.setAttribute("error", "게시글을 찾을 수 없습니다.");
        return "ErrorPage.jsp";
    }
}

