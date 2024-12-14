package com.mystudy.command.product;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.model.dao.OrderDAO;
import com.mystudy.model.dao.ProductDAO;
import com.mystudy.model.vo.MemberVO;
import com.mystudy.model.vo.OrderVO;
import com.mystudy.model.vo.ProductVO;

public class AutoUpdateCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] productCodes = request.getParameterValues("productCodes");
		String[] saleCounts = request.getParameterValues("saleCounts");
		String type = request.getParameter("type");
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		String id = loginUser.getId();
		String kind = request.getParameter("kind");
		
		if ("credit".equals(kind)) {
			kind = "체크/신용카드";
		} else if ("foreignCard".equals(kind)) {
			kind = "해외발급신용카드";
		} else if ("paper".equals(kind)) {
			kind = "무통장 입금";
		} else if ("phonePay".equals(kind)) {
			kind = "휴대폰 간편결제";
		}
		// 현재 시스템 날짜 및 시간 가져오기
		LocalDateTime now = LocalDateTime.now();

		// 날짜 및 시간 형식 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");

		// 날짜와 시간을 문자열로 변환
		String formatTime = now.format(formatter);
		
		
		
		System.out.println(id);
		System.out.println(type);
		System.out.println(kind);
		
		if (productCodes != null && saleCounts != null) {
			//재고, 사용여부 autoUpdate
			for (int i = 0; i < productCodes.length; i++) {
				String productCode = productCodes[i];
				int saleCnt = Integer.parseInt(saleCounts[i]);
				
				ProductVO vo = ProductDAO.selectOne(productCode);
				int price = vo.getPrice();
				int stock = vo.getStock() - saleCnt;
				int saleCount = saleCnt + vo.getSaleCount(); 
				
				ProductVO pvo = new ProductVO();

				pvo.setProductCode(productCode);
				
				if (stock > 0) {
					pvo.setSaleCount(saleCount);
					pvo.setStock(stock);
				} else {			
					pvo.setSaleCount(saleCount);
					pvo.setStock(0);
				}
				
				int result = ProductDAO.setUpdateSaleCnt(pvo);
				
				if (result > 0) {
				    System.out.println("데이터 업데이트 성공");
				} else {
				    System.out.println("데이터 업데이트 실패");
				}
				//orderInfo에 저장========================
				
				// orderNumber를 productCode와 결합
				String orderNumber = formatTime + productCode;
				OrderVO ovo = new OrderVO();
				ovo.setId(id);
				ovo.setOrderNumber(orderNumber);
				ovo.setPayment(kind);
				ovo.setProductCode(productCode);
				ovo.setOrderCount(saleCnt);
				ovo.setTotalPrice(price * saleCnt);
				ovo.setAddress("주소");
				
				int orderResult = OrderDAO.insertOrderInfo(ovo);
				
				if (orderResult > 0) {
				    System.out.println("데이터 업데이트 성공");
				} else {
				    System.out.println("데이터 업데이트 실패");
				}
				
			}
		}
		
		return "product/finish.jsp";
	}
}
