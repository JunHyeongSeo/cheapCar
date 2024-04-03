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
import com.kh.semi.review.model.vo.ReviewBoard;
import com.kh.semi.review.model.vo.ReviewPhoto;

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
	
	
	public int selectListCount(Connection conn) {
	
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			rset.next();
			
			listCount = rset.getInt("COUNT(*)"); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return listCount;
	}//
	
	
	
	
	
	public ArrayList<ReviewBoard> selectReviewList(Connection conn, PageInfo pi){
		
		ArrayList<ReviewBoard> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, 1);
			pstmt.setInt(2, 20);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				ReviewBoard rv = new ReviewBoard();
				
				rv.setReviewNo(rset.getInt("REVIEW_NO"));
				rv.setReviewTitle(rset.getString("REVIEW_TITLE"));
				rv.setCount(rset.getInt("COUNT"));
				rv.setReviewWriter(rset.getString("MEMBER_ID"));
				rv.setTitleImg(rset.getString("TITLE_IMG"));
				rv.setMemberNo(rset.getInt("MEMBER_NO"));
				rv.setFileLevel(rset.getString("FILELEVEL"));
				
				
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
	
	public int insertReviewBoard(Connection conn, ReviewBoard rBoard) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReviewBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rBoard.getReviewTitle());
			pstmt.setString(2, rBoard.getReviewContent());
			pstmt.setInt(3, rBoard.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}//
	
	
	public int insertReviewPhoto(Connection conn, ArrayList<ReviewPhoto> list) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReviewPhoto");
		
		try {
			
			for(ReviewPhoto rp : list) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, rp.getPhotoOname());
				pstmt.setString(2, rp.getPhotoCname());
				pstmt.setString(3, rp.getPhotoPath());
				pstmt.setInt(4, rp.getFileLevel());
			
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result == list.size() ? 1 : 0;
	}//
	
	
	
	
	
	
	
	
	
		
	
	
	
}
