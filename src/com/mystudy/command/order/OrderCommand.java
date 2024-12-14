package com.mystudy.command.order;

import java.util.List;

import com.mystudy.command.Command;
import com.mystudy.model.dao.OrderDAO;
import com.mystudy.model.vo.MemberVO;
import com.mystudy.model.vo.OrderVO;

public class OrderCommand implements Command {
	public String exec(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException ,java.io.IOException {
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		List<OrderVO> list = null;
		String purchaseDate = request.getParameter("purchaseDate");
		String id = loginUser.getId();
		System.out.println(id);
		System.out.println(purchaseDate);
		
		OrderVO ovo = new OrderVO();
			
		ovo.setId(id);
		
		ovo.setPurchaseDate(purchaseDate);
		list = OrderDAO.getOrderList(ovo);
		
		request.setAttribute("list", list);
		
		return "order/orderList.jsp";
	};
}
