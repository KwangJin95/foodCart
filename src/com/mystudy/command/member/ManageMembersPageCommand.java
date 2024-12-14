package com.mystudy.command.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.common.Paging;
import com.mystudy.model.dao.MemberDAO;
import com.mystudy.model.vo.MemberVO;

public class ManageMembersPageCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//0. 페이징 처리를 위한 객체(Paging) 생성
		Paging p = new Paging();
		
		String     idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		
		// 페이지 당 행(row) 수
		p.setNumPerPage(3);
		
		// 블록 당 페이지 수
		p.setPagePerBlock(3);
		
		//1. 전체 게시물 수량 구하기
		if (idx == null || idx.length() == 0 || "0".equals(idx))
			p.setTotalRecord(MemberDAO.getTotalCount());
		else {
			p.setTotalRecord(MemberDAO.getKeywordCount(idx, keyword));
		}
		
		p.setTotalPage();
		System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
		System.out.println("> 전체 페이지 수 : " + p.getTotalPage());
		
		//2. 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		} else {
			p.setNowPage(1);
		}
		
		
		System.out.println("> cPage : " + cPage);
		System.out.println("> paging nowPage : " + p.getNowPage());
		
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		//3-1.(선택적) 끝 번호가 데이터 건수보다 많아지면 데이터 건수와 동일하게 설정
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		System.out.println(">> 시작번호(begin) : " + p.getBegin());
		System.out.println(">> 끝번호(end) : " + p.getEnd());
		
		//----- 블록(block) 계산하기 -----------
		//4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
		//4-1. 시작페이지 구하기
		int beginPage = (p.getNowPage() - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getPagePerBlock() - 1);
		
		//4-2. 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		// 끝페이지를 전체 페이지 수로 변경처리(설정)
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		System.out.println(">> 시작페이지(beginPage) : " + p.getBeginPage());
		System.out.println(">> 끝페이지(endPage) : " + p.getEndPage());
		
		//=================================
		//현재 페이지 기준으로 DB 데이터(게시글) 가져오기
		//시작번호(begin), 끝번호(end) 사용해서
		
		List<MemberVO> list = null;
		if (idx == null || "".equals(idx) || (idx != null && "0".equals(idx)))
			list = MemberDAO.getList(p.getBegin(), p.getEnd());
		
		if (idx != null && !("".equals(idx))) {
			list = MemberDAO.getList(p.getBegin() + "", p.getEnd() + "", idx, keyword);
		}
		
		System.out.println(list);
		
		// ---------------------------
		// JSTL, EL 사용을 위해 scope에 데이터 등록(page 영역)
		request.setAttribute("list", list);
		request.setAttribute("pvo", p);
		
		request.setAttribute("idx", idx);
		request.setAttribute("keyword", keyword);
		
		p.setNowBlock(p.getNowPage() / p.getPagePerBlock() + 1);
		p.setTotalBlock(p.getTotalPage() / p.getPagePerBlock());
		
		System.out.println("p : " + p);	
		System.out.println("========================================================");	
		
		System.out.println("> cPage : " + cPage);
		System.out.println("> paging nowBlock : " + p.getNowBlock());
		
		return "member/manageMembersPage.jsp";
	}
}
