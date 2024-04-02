package com.kh.semi.review.model.service;

import java.sql.Connection;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.review.model.dao.ReviewDao;

public class ReviewService {

	
	public void selectReviewList(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		new ReviewDao().selectReviewList(conn, pi);
		
		
		
		
	}
	
	
	
	
	
	
	
}
