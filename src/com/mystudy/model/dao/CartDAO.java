package com.mystudy.model.dao;

import com.mystudy.model.vo.CartVO;
import com.mystudy.model.vo.QAVO;
import com.mystudy.mybatis.DBService;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CartDAO {

    //장바구니 목록 건수
    public static int getCartItemCount() {
        int totalCount = 0;

        SqlSession ss = DBService.getFactory().openSession(true);
        try {
            totalCount = ss.selectOne("CART.getCartItemCount");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return totalCount;
    }

    //장바구니 목록 조회
    public static List<CartVO> getCartList() {
        SqlSession ss = DBService.getFactory().openSession(true);
        List<CartVO> list = ss.selectList("CART.selectCartItems");
        ss.close();
        return list;
    }
    
  //장바구니 목록조회 (회원)
    public static List<CartVO> selectCartList(String memid) {
        SqlSession ss = DBService.getFactory().openSession(true);
        List<CartVO> list = ss.selectList("CART.selectCartList", memid);
        ss.close();
        return list;
    }

    //장바구니 담긴 상품 조회
    public static CartVO selectOne(int cartId) {
        SqlSession ss = DBService.getFactory().openSession(true);
        CartVO vo = ss.selectOne("CART.selectCartItemById", cartId);
        ss.close();
        return vo;
    }

    //장바구니 수량 변경
    public static int updateQuantity(int cartItemId, int newQuantity) {
        SqlSession ss = DBService.getFactory().openSession(true);
        Map<String, Integer> params = new HashMap<>();
        params.put("cartItemId", cartItemId);
        params.put("newQuantity", newQuantity);
        int result = ss.update("CART.updateQuantity", params);
        ss.close();

        return result;
    }

    public static int deleteCartItem(int cartId) {
        int result = 0;
        SqlSession ss = DBService.getFactory().openSession(true);
        try {
            result = ss.delete("CART.deleteCartItem", cartId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return result;
    }
    // 장바구니 데이터 부분 삭제
    public void deleteSelectedCartItems(List<Integer> cartIds) {
        SqlSession ss = DBService.getFactory().openSession(true);
        try {
            ss.delete("CART.deleteSelectedCartItems", cartIds);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }
    }

    public static int insertCartItem(CartVO cart ) {
        SqlSession ss = DBService.getFactory().openSession(true);
        int result = -1;
        try {
            result = ss.insert("CART.insertCartItem", cart );
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }
        return result;
    }
}


