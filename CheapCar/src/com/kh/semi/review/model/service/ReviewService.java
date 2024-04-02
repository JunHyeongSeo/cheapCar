package com.kh.semi.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.review.model.dao.ReviewDao;
import com.kh.semi.review.model.vo.Review;

public class ReviewService {

	
	public ArrayList<Review> selectReviewList(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectReviewList(conn, pi);
		
		JDBCTemplate.close(conn);
		
		return list;
		
	}//
	
	
	
	
	
	
	
}
