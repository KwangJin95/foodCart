package com.mystudy.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatis.DBService;
import com.mystudy.model.vo.ProductVO;

public class ProductDAO {

	public static int insertProduct(ProductVO vo) {
		//제품정보 등록
	    SqlSession ss = DBService.getFactory().openSession();
	    int result = 0; // 초기화
	    
	    try {
	        result = ss.insert("product.insert", vo);
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
	public static List<ProductVO> getList(){
		//제품 정보 전체 보기 - productCode 오름차순
		SqlSession ss = DBService.getFactory().openSession();
		List<ProductVO> list = ss.selectList("product.list");
		ss.close();
		return list;
	}
	public static List<ProductVO> getsaleList(){
		//제품 정보 전체 보기 - saleCount 내림차순
		SqlSession ss = DBService.getFactory().openSession();
		List<ProductVO> saleList = ss.selectList("product.saleList");
		ss.close();
		return saleList;
	}
	public static ProductVO selectOne(String productCode){
		//productCode가 일치하는 제품 보기
		SqlSession ss = DBService.getFactory().openSession();
		ProductVO vo = ss.selectOne("product.selectOne", productCode);
		ss.close();
		return vo;
	}
	public static int setUpdateAll(ProductVO ProductVO) {
		//전체 정보 수정
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.update("product.updateAll", ProductVO);
		if (result > 0) {
	        ss.commit();
	    } else {
	        ss.rollback();
	    }
	    ss.close();
	    return result;
	}
	public static int setUpdateSaleCnt(ProductVO ProductVO) {
		//판매량 자동수정에 사용.(재고,판매량,사용여부 수정)
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.update("product.updateSaleCnt", ProductVO);
		if (result > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();
		return result;
	}
	public static int setUpdateStock(ProductVO ProductVO) {
		//재고, 사용여부 수정
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.update("product.updateStock", ProductVO);
		if (result > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();
		return result;
	}
	public static List<ProductVO> categorySaleNum(int categoryCode) {
		//카테고리별 판매량순위
		SqlSession ss = DBService.getFactory().openSession();
		List<ProductVO> list = ss.selectList("product.categorySaleNum", categoryCode);
		ss.close();
		return list;
	}
	
	
	// 이름으로 검색합니다
	  public static List<ProductVO> getProductList(String productName) {
			List<ProductVO> productList = null;
			try (SqlSession ss = DBService.getFactory().openSession()) {
				productList = ss.selectList("project.searchName", productName);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return productList;

		}

	// 카테고리 번호로 상품리스트를 검색합니다
	  public static List<ProductVO> getProductList(int categoryCode) {
			List<ProductVO> productList = null;
			try (SqlSession ss = DBService.getFactory().openSession()) {
				productList = ss.selectList("project.categorySelect", categoryCode);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return productList;
		}

	// 이름으로 검색해서 나온 상품의 숫자를 알려줌
	  public static int nameCount(String productName) {
			int nameCount = 0;
			try (SqlSession ss = DBService.getFactory().openSession()) {
				nameCount = ss.selectOne("project.nameCount", productName);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return nameCount;
		}
	
}
