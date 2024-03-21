package com.kh.semi.notice.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.notice.model.vo.Notice;

public class NoticeDao {

	private Properties prop = new Properties();
	
	public NoticeDao() {
		
		String fileName = NoticeDao.class.getResource("/sql/notice/notice-mapper.xml").getPath();
		
	}
	
	
	
	
	public ArrayList<Notice> selectNoticeList(Connection conn) {
		
		// 조회된 공지사항 리스트 담을 ArrayList 선언
		ArrayList<Notice> list = new ArrayList();
		
		// preparedStatement, ResultSet, sql
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("selectNoticeList");
		
		
		
		
		
		
		
		
		return list;
	}//
	
	
	
	
	
}
