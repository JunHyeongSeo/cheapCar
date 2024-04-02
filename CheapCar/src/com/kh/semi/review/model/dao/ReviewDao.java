package com.kh.semi.review.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.review.model.vo.Review;

public class ReviewDao {

	private Properties prop = new Properties();
	
	public ReviewDao() {
		
		String filePath = ReviewDao.class.getResource("/sql/review/review-mapper.xml").getPath();
		
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}//
	
	public ArrayList<Review> selectReviewList(Connection conn, PageInfo pi){
		
		ArrayList<Review> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Review rv = new Review();
				
				rv.setReviewNo(rset.getInt("REVIEW_NO"));
				rv.setReviewTitle(rset.getString("REVIEW_TITLE"));
				rv.setCount(rset.getInt("COUNT"));
				rv.setReviewWriter(rset.getString("MEMBER_ID"));
				rv.setTitleImg(rset.getString("TITLE_IMG"));
				
				
				list.add(rv);		
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return list;
	}//
	
	
	
	
	
	
	
	
}
