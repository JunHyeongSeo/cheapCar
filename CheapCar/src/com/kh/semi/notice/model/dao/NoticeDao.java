package com.kh.semi.notice.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.notice.model.vo.Notice;

public class NoticeDao {

	private Properties prop = new Properties();
	
	public NoticeDao() {
		
		String fileName = NoticeDao.class.getResource("/sql/notice/notice-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	
	public ArrayList<Notice> selectNoticeList(Connection conn) {
		
		// 조회된 공지사항 리스트 담을 ArrayList 선언
		ArrayList<Notice> list = new ArrayList();
		
		// preparedStatement, ResultSet, sql
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("selectNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) { // notice 객체에 값 담기, rset에서 뽑아서
				
				Notice notice = new Notice();
				
				notice.setNoticeNo(rset.getInt("NOTICE_NO"));
				notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				notice.setNoticeWriter(rset.getString("MEMBER_NAME"));
				notice.setCreateDate(rset.getDate("CREATE_DATE"));
				notice.setCount(rset.getInt("COUNT"));
				
				list.add(notice);				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
			
		}
		
		
		return list;
	}//
	
	
	public int increaseCount(Connection conn, int noticeNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}//
	
	
	public Notice selectNotice(Connection conn, int noticeNo) {
		
		Notice notice = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				notice = new Notice();
				
				notice.setNoticeNo(rset.getInt("NOTICE_NO"));
				notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				notice.setNoticeContent(rset.getString("NOTICE_CONTENT"));
				notice.setCreateDate(rset.getDate("CREATE_DATE"));
				notice.setCount(rset.getInt("COUNT"));
				notice.setNoticeWriter(rset.getString("MEMBER_NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		
		return notice;
	}//
	
	
	public int delete(Connection conn, String noticeNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(noticeNo));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}//
	
	
	
	
	public int insert(Connection conn, Notice notice) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContent());
			pstmt.setInt(3, notice.getMemberNo());
			
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		
		
		
		
		return result;
		
	}//
	
	
	
	public int updateNotice(Connection conn, Notice notice) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContent());
			pstmt.setInt(3, notice.getNoticeNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		
		
		
		
		return result;
		
	}//
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
