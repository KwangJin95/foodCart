package com.mystudy.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.model.vo.MemberVO;
import com.mystudy.mybatis.DBService;

public class MemberDAO {
	
	// 로그인
	public static MemberVO login(Map<String, String> map) {
		
		MemberVO vo = null;
		
		try (SqlSession ss = DBService.getFactory().openSession(true)) {
			vo = ss.selectOne("Member.login", map);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return vo;
	}
	// 아이디 찾기
	public static String findId(Map<String, String> map) {
		
		String result = "";
		
		try (SqlSession ss = DBService.getFactory().openSession(true)) {
			result = ss.selectOne("Member.findId", map);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	// 비밀번호 찾기
	public static String findPassword(Map<String, String> map) {
		
		String result = "";
		
		try (SqlSession ss = DBService.getFactory().openSession(true)) {
			result = ss.selectOne("Member.findPassword", map);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	// 회원 가입
	public static int createMember(MemberVO vo) {
			
		SqlSession ss = DBService.getFactory().openSession(true);
			
		int result = -1;
		
		try {
			result = ss.insert("Member.createMember", vo);
		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		} finally {
			ss.close();
		}
		return result;
	}
	
	// 전체 회원 수
	public static int getTotalCount() {
		
		int result = 0;
		
		SqlSession ss = DBService.getFactory().openSession(true);
		
		try {
			result = ss.selectOne("Member.getTotalCount");
		} catch (Exception e) { 
			e.printStackTrace();
			result = -1;
		} finally {
			ss.close();
		}
		
		return result;
	}
	
	// 전체 회원 수 - 조건별
	public static int getKeywordCount(String idx, String keyword) {
		
		int result = 0;
		Map<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("idx", idx);
		
		SqlSession ss = DBService.getFactory().openSession(true);
		
		try {
			result = ss.selectOne("Member.getKeywordCount", map);
		} catch (Exception e) { 
			e.printStackTrace();
			result = -1;
		} finally {
			ss.close();
		}
		
		return result;
	}
	
	// 회원 전체목록 조회
	public static List<MemberVO> getList(int begin, int end) {

		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
			
		List<MemberVO> list = null;
			
		SqlSession ss = DBService.getFactory().openSession(true);
			
		try {
			list = ss.selectList("Member.selectMembers", map);
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return list;
	}
	
	// 회원 조회 조건별
	public static List<MemberVO> getList(String begin, String end, String idx, String keyword) {

		Map<String, String> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("idx", idx);
		map.put("keyword", keyword);
		
		List<MemberVO> list = null;
		
		SqlSession ss = DBService.getFactory().openSession(true);
		
		try {
			list = ss.selectList("Member.selectMembers", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return list;
	}
	
	// 회원 정보 수정
	public static int updateMember(MemberVO vo) {
		int result = -1;
		
		SqlSession ss = DBService.getFactory().openSession(true);
		
		try {
			result = ss.update("Member.updateMember", vo);
		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		} finally {
			ss.close();
		}
		return result;
	}
	
	// 회원 본인 정보 수정
	public static int updateMyInfo(MemberVO vo) {
		int result = -1;
		
		SqlSession ss = DBService.getFactory().openSession(true);
		
		try {
			result = ss.update("Member.updateMyInfo", vo);
		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		} finally {
			ss.close();
		}
		return result;
	}
	// 아이디 값에 해당하는 데이터가 존재하는지 확인
	public static MemberVO isExistById(String id) {
		
		MemberVO vo = null;
		
		SqlSession ss = DBService.getFactory().openSession(true);
		
		try {
			vo = ss.selectOne("Member.selectOneId", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}

		return vo;
	}
	
	// 아이디 값에 해당하는 데이터가 존재하는지 확인
	public static MemberVO isExistByEmail(String email) {
		
		MemberVO vo = null;
		
		SqlSession ss = DBService.getFactory().openSession(true);
		
		try {
			vo = ss.selectOne("Member.selectOneEmail", email);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return vo;
	}
	
	// 탈퇴하기, 회원 정보 삭제
	public static int deleteOne(String id) {
		
		int result = -1;
		
		SqlSession ss = DBService.getFactory().openSession(true);
		
		try {
			result = ss.delete("Member.deleteOne", id);
		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		} finally {
			ss.close();
		}
		return result;
	}
	
}
















