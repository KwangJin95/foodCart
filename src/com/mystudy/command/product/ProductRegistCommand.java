package com.mystudy.command.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.model.dao.ProductDAO;
import com.mystudy.model.vo.ProductVO;


public class ProductRegistCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    List<ProductVO> list = ProductDAO.getList();
	    System.out.println(list);
	    int max = 0;
	    int productNum = 0;
	    
	    for (int i = 0; i < list.size(); i++) {
	    	int value = Integer.parseInt(list.get(i).getProductCode().substring(3));
	    	
	    	if (value > max) {
	    		max = value;
	    	}
	    }
	    System.out.println(max);
	    if (max == 0) {
	    	productNum = 1;
	    } else {
	    	productNum = max + 1;
	    }
	    
	    String code = "00000" + productNum;
	    String sixCode = code.substring(code.length() - 6, code.length());
	    System.out.println(sixCode);
	    
	    request.setAttribute("sixCode", sixCode);
		return "product/productRegist.jsp";
	}
}
