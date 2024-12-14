package com.mystudy.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatis.DBService;

import com.mystudy.model.vo.ReviewVO;

public class ReviewDAO {

	
	//리뷰 데이터 가져오기
	public static List<ReviewVO> getReviewList(){
		List<ReviewVO> reviewList = null;
		SqlSession ss = DBService.getFactory().openSession(true);		
		try {
			reviewList = ss.selectList("project.reviewList");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return reviewList;		
	}
	
	//페이지에 해당되는 글목록(게시글) 가져오기(조회)
	public static List<ReviewVO> getList(int begin, int end) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<ReviewVO> rvList = null;
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);				
		try {
			rvList = ss.selectList("project.reviewPaging", map);
			System.out.println(map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return rvList;		
	}
	
	//---------------------------------------------
	
	public static List<ReviewVO> getList(String begin, String end, String productCode) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<ReviewVO> rvList = null;
		Map<String, String> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);	
		map.put("productCode", productCode);
		try {
			rvList = ss.selectList("project.reviewPagingtwo", map);
			System.out.println(map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return rvList;		
	}	
	
	public static List<ReviewVO> getMyList(String begin, String end, String id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<ReviewVO> rvList = null;
		Map<String, String> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);	
		map.put("id", id);
		try {
			rvList = ss.selectList("project.reviewPagingthree", map);
			System.out.println(map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return rvList;		
	}	
	
	
	//리뷰 전체 건수 조회(paging에 사용)
	public static int getTotalCount() {
		int totalCount = 0;		
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			totalCount = ss.selectOne("project.reviewCount");
			System.out.println(">>>>> totalCount : " + totalCount);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}		
		return totalCount;	
	}
	// 내 리뷰 건수
	public static int getTotalCountMyReview(String id) {
		int totalCount = 0;		
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			totalCount = ss.selectOne("project.reviewCountMy", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}		
		return totalCount;	
	}
	
	//해당 상품 리뷰 건수 조회
	public static int getTotalCount(String productCode) {
		int totalCount = 0;		
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			totalCount = ss.selectOne("project.reviewCount2", productCode);
			System.out.println("!!! totalCount : " + totalCount);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}		
		return totalCount;	
	}
	
	
	 //리뷰 입력
	public static int insertReview(ReviewVO review) {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession(true);
		try {		
			result = ss.insert("project.reviewWrite", review);
			 if(result == 1) {
		            System.out.println("성공!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		        } else {
		            System.out.println("실패!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		        }
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println(" 이니까 확인해봐라");
		} finally {
			ss.close();
		}
		return result;
	}
	
	//리뷰수정!!!!!!!
	public static int updateReview(ReviewVO review) {
		int result = 0;
		System.out.println(result);
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			result = ss.update("project.updateReview", review);
			if (result == 1) {
				System.out.println("성공했슈");
			} else {
				System.out.println("다시해보슈");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return result;
	}
	
	//리뷰 삭제
	
	public static int deleteReview(int reviewNum) {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			result = ss.delete("project.deleteReview", reviewNum);
			if (result == 1) {
				System.out.println("리뷰삭제성공");
			} else {
				System.out.println("리뷰삭제실패");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		} 
		return result;
	}
	
	//상품코드가 맞는 제품의 리뷰를 보여주기
	public static List<ReviewVO> getReviewListProduct(String productCode) {
		List<ReviewVO> reviewList = null;
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			reviewList = ss.selectList("project.productreview", productCode);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return reviewList;	
}
	
	
}
