package com.kh.semi.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.review.model.dao.ReviewDao;
import com.kh.semi.review.model.vo.Reply;
import com.kh.semi.review.model.vo.ReviewBoard;
import com.kh.semi.review.model.vo.ReviewPhoto;

public class ReviewService {

	
	public int selectListCount() {
		
		int listCount = 0;
		
		Connection conn = JDBCTemplate.getConnection();
		
		listCount = new ReviewDao().selectListCount(conn);
		
		JDBCTemplate.close(conn);
		
		
		return listCount;
	}//
	
	
	
	public ArrayList<ReviewBoard> selectReviewList(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<ReviewBoard> list = new ReviewDao().selectReviewList(conn, pi);
		
		JDBCTemplate.close(conn);
		
		return list;
		
	}//
	
	
	public int insertReview(ReviewBoard rBoard, ArrayList<ReviewPhoto> list) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int boardResult = new ReviewDao().insertReviewBoard(conn, rBoard);
		
		int photoResult = 1;
		
		if(list.size() > 0) {
			photoResult = new ReviewDao().insertReviewPhoto(conn, list);
		}	
		
		
		if((boardResult * photoResult) > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return boardResult * photoResult;
	}//
	
	
	public int increaseCount(int reviewNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ReviewDao().increaseCount(conn, reviewNo);
				
		if(result > 0) JDBCTemplate.commit(conn);
		JDBCTemplate.close(conn);
		
		return result;
	}//
	
	
	public ReviewBoard selectReviewBoard(int reviewNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ReviewBoard rBoard = new ReviewDao().selectReviewBoard(conn, reviewNo);
		
		JDBCTemplate.close(conn);
		
		return rBoard;
		
	}//
	
	
	public ArrayList<ReviewPhoto> selectReviewPhoto(int reviewNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<ReviewPhoto> list = new ReviewDao().selectReviewPhoto(conn, reviewNo);
		
		JDBCTemplate.close(conn);
		
		
		return list;
	}
	
	
	public int deleteReview(int reviewNo, String photoCname) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int boardResult = new ReviewDao().deleteReviewBoard(conn, reviewNo);
		int photoResult = 1;
		if(photoCname != null) {
			photoResult = new ReviewDao().deleteReviewPhoto(conn, reviewNo);
		}
		if((boardResult * photoResult) > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		
		return (boardResult * photoResult);
	}//
	
	
	
	public int insertComment(Reply reply) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ReviewDao().insertComment(conn, reply);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		} 
		JDBCTemplate.close(conn);
		
		return result;
	}//
	
	
	
	public ArrayList<Reply> selectReplyList(int reviewNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Reply> list = new ReviewDao().selectReplyList(conn, reviewNo);
		
		JDBCTemplate.close(conn);
		
		return list;
	}//
	
	
	
	
	
	
	
}////
