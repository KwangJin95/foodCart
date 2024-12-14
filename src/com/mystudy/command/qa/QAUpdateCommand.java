package com.mystudy.command.qa;

import com.mystudy.command.Command;
import com.mystudy.model.dao.QADAO;
import com.mystudy.model.vo.QAVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class QAUpdateCommand implements Command {

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. 폼에서 전달된 수정된 데이터 가져오기
        String qaIdStr = request.getParameter("qaId");
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        if (qaIdStr != null && !qaIdStr.isEmpty() && title != null && content != null) {
            try {
                int qaId = Integer.parseInt(qaIdStr);

                // 2. 업데이트할 QA 객체 생성 및 데이터 설정
                QAVO qa = new QAVO();
                qa.setQaId(qaId);
                qa.setTitle(title);
                qa.setContent(content);

                // 3. 데이터베이스에 QA 정보 업데이트
                QADAO dao = new QADAO();
                dao.updateQA(qa);

                qa = dao.getQADetail(qaId);

                // 3-1 가져온 정보를 request 객체에 설정
                request.setAttribute("qaId", qa.getQaId());
                request.setAttribute("title", qa.getTitle());
                request.setAttribute("rDate", qa.getrDate());
                request.setAttribute("content", qa.getContent());

                // 4. 업데이트 성공 후 상세 페이지로 이동
                return "qa/QADetail.jsp";
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // 오류 처리: 수정할 QA 정보가 유효하지 않은 경우
        request.setAttribute("error", "수정할 게시글을 찾을 수 없습니다.");
        return "ErrorPage.jsp";
    }
}
