package com.mystudy.model.dao;

import com.mystudy.model.vo.QAVO;
import com.mystudy.mybatis.DBService;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class QADAO {
    //게시글 건수 조회
    public static int getQACount() {
        int totalCount = 0;

        SqlSession ss = DBService.getFactory().openSession(true);
        try {
            totalCount = ss.selectOne("QA.getQaCount");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return totalCount;
    }

    //게시글 목록 조회 (회원용)
    public static List<QAVO> getQAList(String memid) {
        SqlSession ss = DBService.getFactory().openSession(true);
        List<QAVO> list = ss.selectList("QA.selectQA", memid);
        ss.close();
        return list;
    }

    //개별글 검색
    public static QAVO getQAById(int qaId) {
        SqlSession ss = DBService.getFactory().openSession(true);
        QAVO vo = ss.selectOne("QA.selectQAById", qaId);
        ss.close();
        return vo;
    }

    //페이지에 해당하는 글목록(게시글) 가져오기(조회)(관리자용)
    public static List<QAVO> getListPage(int begin, int end) {
        Map<String, Integer> map = new HashMap<>();
        map.put("begin", begin);
        map.put("end", end);

        SqlSession ss = DBService.getFactory().openSession(true);
        List<QAVO> list = ss.selectList("QA.selectQAPage", map);
        ss.close();

        return list;
    }
    //문의글 입력
//    public int insertQA(QAVO qavo) {
//        SqlSession ss = DBService.getFactory().openSession(true);
//        int result = -1;
//
//        try {
//            result = ss.insert("QA.insertQA", qavo);
//        } catch (Exception e) {
//            // 예외를 더 자세히 로깅하거나 예외 처리 추가
//            e.printStackTrace();
//        } finally {
//            ss.close();
//        }
//
//        return result;
//    }

    public static int insertQA(QAVO qa) {
        SqlSession ss = DBService.getFactory().openSession(true);
        int result = -1;
        try {
            result = ss.insert("QA.insertQA", qa);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }
        return result;
    }
    //문의글 수정 **
    public int updateQA(QAVO qavo) {
        SqlSession ss = DBService.getFactory().openSession(true);
        int result = -1;
        try {
            result = ss.update("QA.updateQA", qavo);
        } catch (Exception e) {
            System.err.println("Error message: " + e.getMessage());
        } finally {
            ss.close();
        }
        return result;
    }

    //문의글 삭제
    public static int deleteQA(int qaId) {
        SqlSession ss = DBService.getFactory().openSession(true);
        int result = -1;
        try {
            result = ss.delete("QA.deleteQA", qaId);
        } catch (Exception e) {
            e.printStackTrace();
            return result;
        } finally {
            ss.close();
        }
        return result;
    }
    public static QAVO getQADetail(int qaId) {
        SqlSession ss = DBService.getFactory().openSession(true);
        QAVO vo = ss.selectOne("QA.QADetail", qaId);
        ss.close();
        return vo;
    }

    public static QAVO getAnswerQADetail(int qaId) {
        SqlSession ss = DBService.getFactory().openSession(true);
        QAVO vo = ss.selectOne("QA.QAAnswerDetail", qaId);
        ss.close();
        return vo;
    }

    public static int insertAnswer(QAVO qa) {
        SqlSession ss = DBService.getFactory().openSession(true);
        int result = -1;
        try {
            result = ss.insert("QA.insertAnswer", qa);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }
        return result;
    }
    public static int deleteAnswer(int qaId) {
        SqlSession ss = DBService.getFactory().openSession(true);
        int result = -1;
        try {
            result = ss.delete("QA.deleteAnswer", qaId);
        } catch (Exception e) {
            e.printStackTrace();
            return result;
        } finally {
            ss.close();
        }
        return result;
    }
}
