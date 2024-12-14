package com.mystudy.command.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.common.Paging;
import com.mystudy.model.dao.ReviewDAO;

import com.mystudy.model.vo.ReviewVO;

public class ReviewListCommand implements Command{
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String productCode = request.getParameter("productCode");
		String id = request.getParameter("id");
		String flag = request.getParameter("flag");
		
		Paging rp = new Paging();
		
		if (flag == null) {
			if (productCode == null) {
				rp.setTotalRecord(ReviewDAO.getTotalCount());
			} else {
				rp.setTotalRecord(ReviewDAO.getTotalCount(productCode));			
			}
		} else {
			rp.setTotalRecord(ReviewDAO.getTotalCountMyReview(id));
		}
		
		System.out.println("여기 : " + productCode);	
		
		rp.setTotalPage();
		rp.setNumPerPage(10);
		rp.setPagePerBlock(3);
				
		System.out.println("> 전체 게시글 수 : " + rp.getTotalRecord());
		System.out.println("> 전체 페이지 수 : " + rp.getTotalPage());
		
		//현재페이지구하기
		String cPage = request.getParameter("cPage");
		
		if (cPage != null) {
			rp.setNowPage(Integer.parseInt(cPage));
		} else {
			rp.setNowPage(1);
		}
		
		//현재 페이지에 표시할 게시글, 시작번호, 끝번호 구하기
		rp.setEnd(rp.getNowPage() * rp.getNumPerPage());
		rp.setBegin(rp.getEnd() - rp.getNumPerPage() + 1);
		
		System.out.println(">> 시작번호(begin) : " + rp.getBegin());
		System.out.println(">> 끝번호(end) : " + rp.getEnd());
				
		if (rp.getEnd() > rp.getTotalRecord()) {
			rp.setEnd(rp.getTotalRecord());
		}
		
		// 시작 페이지 구하기
		int beginPage = (rp.getNowPage() - 1) / rp.getPagePerBlock() * rp.getPagePerBlock() + 1;
		rp.setBeginPage(beginPage);
		rp.setEndPage(beginPage + rp.getPagePerBlock() - 1);

		if(rp.getEndPage() > rp.getTotalPage()) {
		    rp.setEndPage(rp.getTotalPage());
		}
		
		
		List<ReviewVO> rvList = null;

		if (flag == null) {
			if (productCode == null) {
				rvList = ReviewDAO.getList(rp.getBegin(), rp.getEnd());
			} else {
				rvList = ReviewDAO.getList(rp.getBegin() + "", rp.getEnd() + "", productCode);			
			}
		} else {
			rvList = ReviewDAO.getMyList(rp.getBeginPage() + "", rp.getEndPage() + "", id);
			request.setAttribute("flag", "ee");
		}
		int count = ReviewDAO.getTotalCount();
		System.out.println("<<< count : " + count);
		
		request.setAttribute("rp", rp);
		request.setAttribute("rvList", rvList);	
				
		System.out.println(count);
		return "ReviewView.jsp";
		
	}
	
}
