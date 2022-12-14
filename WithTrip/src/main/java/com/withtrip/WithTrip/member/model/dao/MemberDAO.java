package com.withtrip.WithTrip.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.withtrip.WithTrip.goods.model.vo.Reply;
import com.withtrip.WithTrip.member.model.vo.Member;
import com.withtrip.WithTrip.member.model.vo.Report;
import com.withtrip.WithTrip.member.model.vo.TripReview;
import com.withtrip.WithTrip.order.model.vo.Order;
import com.withtrip.WithTrip.trip.model.vo.PageInfo;
import com.withtrip.WithTrip.trip.model.vo.TripBoard;

@Repository("mDAO")
public class MemberDAO {

	public Member login(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.login", m);
	}
	
	public Member login(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.login", email);
	}

	public int findPwd(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
//		int result = sqlSession.update("memberMapper.findPwd", map);
		return sqlSession.update("memberMapper.findPwd", map);
	}
	
	public int kakaoinsert(SqlSessionTemplate sqlSession, HashMap<String, Object> userInfo) {
		return sqlSession.insert("memberMapper.kakaoInsert", userInfo);
		
	}
	public Member findkakao(SqlSessionTemplate sqlSession,HashMap<String, Object> userInfo) {
		System.out.println("RN:" + userInfo.get("nickname"));
		System.out.println("RE:" + userInfo.get("email"));
		return sqlSession.selectOne("memberMapper.findKakao", userInfo);
	}

	public Member findId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);
	}

	
	public int countKakao(SqlSessionTemplate sqlSession, HashMap<String, Object> userInfo) {
		return sqlSession.selectOne("memberMapper.countKakao", userInfo);
	}

	public int countMember(SqlSessionTemplate sqlSession, HashMap<String, Object> userInfo) {
		return sqlSession.selectOne("memberMapper.countMember", userInfo);
	}

	public Member selectKakao(SqlSessionTemplate sqlSession, HashMap<String, Object> userInfo) {
		return sqlSession.selectOne("memberMapper.selectKakao", userInfo);
	}

	public int insertkakao(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertkakao", m);
	}

	public Member kakaoLogin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.kakaoLogin", m);
	}

	public int checkNick(SqlSessionTemplate sqlSession, String nickName) {
		return sqlSession.selectOne("memberMapper.checkNick", nickName);
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int checkId(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.checkId", id);
	}

	
	// ???????????? ??????????????? ??????
	// ??????
	public int deleteUser(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.update("memberMapper.deleteUser", email);
	}
	
	// ?????? ?????? ??????
	public int updateUser(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateUser", m);
	}

	// ?????? ??? ?????? ??????
	public int getWrittenReviewListCount(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.selectWrittenReviewListCount", email);
	}
	public ArrayList<TripReview> getWrittenReviewList(SqlSessionTemplate sqlSession, String email, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectWrittenReviewList", email, rowBounds);
	}
	
	// ????????? ????????? ??? ?????? ??????
	public int getReviewListCount(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("memberMapper.selectReviewListCount", mNo);
	}
	public ArrayList<TripReview> getReviewList(SqlSessionTemplate sqlSession, int mNo, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectReviewList", mNo, rowBounds);
	}
	
	// ?????? ?????? ??????
	public int checkUserPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.checkUserPwd", m);
	}

	// ?????? ????????? ?????? ??????
	public int getWrittenGoodsReviewListCount(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.selectGoodsReviewListCount", email);
	}
	public ArrayList<Reply> getWrittenGoodsReviewList(SqlSessionTemplate sqlSession, String email, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectWrittenGoodsReviewList", email, rowBounds);
	}

	// ?????? ????????? ?????? ???
	public int getWrittenTripListCount(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.selectWrittenTripListCount", email);
	}
	public ArrayList<TripBoard> getWrittenTripList(SqlSessionTemplate sqlSession, String email, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectWrittenTripList", email, rowBounds);
	}

	// ?????? ??????
	public int pwdUpdate(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePwd", m);
	}
	
	// ????????? ?????? ??????
	public int insertReview(SqlSessionTemplate sqlSession, TripReview trv) {
		return sqlSession.insert("memberMapper.insertReview", trv);
	}
	
	// ?????? ??????
	public int insertReport(SqlSessionTemplate sqlSession, Report r) {
		return sqlSession.insert("memberMapper.insertReport", r);
	}
	
	// ????????? ????????? ?????? ?????????
	public ArrayList<Report> selectReportToMe(SqlSessionTemplate sqlSession, String email) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectReportToMe", email);
	}
	
	// ?????? ?????? ?????? ?????? ????????????
	public Member selectMember(SqlSessionTemplate sqlSession, Integer mNo) {
		return sqlSession.selectOne("memberMapper.selectMember", mNo);
	}

	public int selectMyOrderListCount(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.getMyOrderListCount", email);
	}

	public ArrayList<Order> selectMyOrderList(SqlSessionTemplate sqlSession, PageInfo pi, String email) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.getMyOrderList", email, rowBounds);
	}

}
