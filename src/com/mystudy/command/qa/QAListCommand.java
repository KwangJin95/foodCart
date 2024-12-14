package com.mystudy.command.qa;

import com.mystudy.command.Command;
import com.mystudy.common.Paging;
import com.mystudy.model.dao.QADAO;
import com.mystudy.model.vo.QAVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class QAListCommand implements Command{

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //0. 페이징 처리를 위한 객체(Paging) 생성
        Paging p = new Paging();

        //1. 전체 게시물 수량 구하기
        p.setTotalRecord(QADAO.getQACount());
        p.setTotalPage();

        //2. 현재 페이지 구하기
        String cPage = request.getParameter("cPage");
        if (cPage != null) {
            p.setNowPage(Integer.parseInt(cPage));
        } else {
            p.setNowPage(1);
        }

        //3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호 구하지
        p.setEnd(p.getNowPage() * p.getNumPerPage());
        p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

        //3-1. (선택적) 끝 번호가 데이터 건수보다 많아지면 데이터 건수와 동일하게 설정
        if (p.getEnd() > p.getTotalRecord()) {
            p.setEnd(p.getTotalRecord());
        }

        //------ 블록(block) 게산하기 -----------------
        //4. 블록 시작페이지, 끝페이지 구하기
        //4-1. 시작페이지 구하기
        int beginPage = (p.getNowPage() - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
        p.setBeginPage(beginPage);
        p.setEndPage(beginPage + p.getPagePerBlock() - 1);

        //4-2. 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
        // 끝페이지를 전체 페이지 수로 변경처리(설정)
        if (p.getEndPage() > p.getTotalPage()) {
            p.setEndPage(p.getTotalPage());
        }

        System.out.println("p : " + p);

        //================================
        //현재 페이지 기준으로 DB데이터(게시글) 가져오기
        //시작번호(begin), 끝번호(end) 사용해서
        List<QAVO> list = QADAO.getListPage(p.getBegin(), p.getEnd());

        //--------------------------
        //JSTL, EL 사용을 위해 scope에 데이터 등록(page 영역)
        request.setAttribute("list", list);
        request.setAttribute("pvo", p);


        System.out.println("QAController doGet() 끝");

        return "qa/QAList.jsp";
    }
}
