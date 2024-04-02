package com.kh.semi.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.review.model.dao.ReviewDao;
import com.kh.semi.review.model.vo.ReviewBoard;
import com.kh.semi.review.model.vo.ReviewPhoto;

public class ReviewService {

	
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
			new ReviewDao().insertReviewPhoto(conn, list);
		}	
				
		
		
				
				
				
		
		
		
		
		return result;
	}
	
	
	
	
	
	
	
}
