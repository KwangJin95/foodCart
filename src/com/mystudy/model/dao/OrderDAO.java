package com.mystudy.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatis.DBService;
import com.mystudy.model.vo.OrderVO;

public class OrderDAO {
	
	//select (회원주소) 후 insert >>AutoUpdateCommand.java 수정
	public static int insertOrderInfo(OrderVO vo) {
		//제품정보 등록
	    SqlSession ss = DBService.getFactory().openSession();
	    int result = 0; // 초기화
	    
	    try {
	        result = ss.insert("product.insertOrder", vo);
	        if (result > 0) {
	            ss.commit(); // 성공하면 커밋
	        } else {
	            ss.rollback(); // 실패하면 롤백
	        }
	    } finally {
	        ss.close();
	    }
	    return result;
	}
	public static List<OrderVO> getOrderList(OrderVO ovo) {
		//제품정보 조회
	    SqlSession ss = DBService.getFactory().openSession();
	    List<OrderVO> orderList = null; // 초기화
	    try {
	    	if (ovo.getPurchaseDate() != null) {
	    		orderList = ss.selectList("product.orderList", ovo);
	    	} else {
	    		orderList = ss.selectList("product.orderList1", ovo);
	    	}
	    	
	    } catch (Exception e){
	    	e.printStackTrace();
	    } finally {
	        ss.close();
	    }
	    return orderList;
	}
}
