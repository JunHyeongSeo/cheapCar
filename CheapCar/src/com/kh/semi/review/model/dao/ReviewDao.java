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
import com.kh.semi.review.model.vo.Reply;
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
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			
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
	
	
	public int increaseCount(Connection conn, int reviewNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
			return result;
	}//
	
	
	public ReviewBoard selectReviewBoard(Connection conn, int reviewNo) {
		
		ReviewBoard rBoard = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rBoard = new ReviewBoard();
				
				rBoard.setReviewNo(rset.getInt("REVIEW_NO"));
				rBoard.setReviewTitle(rset.getString("REVIEW_TITLE"));
				rBoard.setReviewContent(rset.getString("REVIEW_CONTENT"));
				rBoard.setCreateDate(rset.getDate("CREATE_DATE"));
				rBoard.setReviewWriter(rset.getString("MEMBER_ID"));
				rBoard.setCount(rset.getInt("COUNT"));
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return rBoard;
	}//
	
	
	public ArrayList<ReviewPhoto> selectReviewPhoto(Connection conn, int reviewNo) {
		
		ArrayList<ReviewPhoto> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewPhoto");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				ReviewPhoto rPhoto = new ReviewPhoto();
				
				rPhoto.setPhotoNo(rset.getInt("REVIEW_PHOTO_NO"));
				rPhoto.setPhotoOname(rset.getString("REVIEW_PHOTO_ORIGINNAME"));
				rPhoto.setPhotoCname(rset.getString("REVIEW_PHOTO_CHANGENAME"));
				rPhoto.setPhotoPath(rset.getString("REVIEW_PHOTO_ADDRESS"));
				rPhoto.setReviewNo(rset.getInt("REVIEW_NO"));
				
				list.add(rPhoto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}
	
	
	public int deleteReviewBoard(Connection conn, int reviewNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReviewBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}//
	
	
	
	public int deleteReviewPhoto(Connection conn, int reviewNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReviewPhoto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}//
	
	
	public int insertComment(Connection conn, Reply reply) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reply.getCommentContent());
			pstmt.setInt(2, reply.getReviewNo());
			pstmt.setInt(3, reply.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}//
	
	
	public ArrayList<Reply> selectReplyList(Connection conn, int reviewNo){
		
		ArrayList<Reply> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Reply reply = new Reply();
				reply.setCommentNo(rset.getInt("COMMENT_NO"));
				reply.setCommentContent(rset.getString("COMMENT_CONTENT"));
				reply.setCreateDate(rset.getDate("CREATE_DATE"));
				reply.setReviewNo(rset.getInt("REVIEW_NO"));
				reply.setCommentWriter(rset.getString("MEMBER_ID"));
				
				list.add(reply);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}
	
	
	public ArrayList<ReviewBoard> mainRiview(Connection conn) {
		
		ArrayList<ReviewBoard> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("mainReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
		
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
		
	}
	
	
	
	
	
		
	
	
	
}////
