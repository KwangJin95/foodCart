package com.mystudy.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatis.DBService;
import com.mystudy.model.vo.CategoryVO;

public class CategoryDAO {
	
	public static List<CategoryVO> getCategoryName(int categoryCode){
		List<CategoryVO> categoryList = null;
		SqlSession ss = null;
		
		try {
			ss = DBService.getFactory().openSession();
			categoryList = ss.selectList("project.categoryNameView", categoryCode);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return categoryList;	
		
	}
}
