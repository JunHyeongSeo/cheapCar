package com.kh.semi.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.notice.model.dao.NoticeDao;
import com.kh.semi.notice.model.vo.Notice;

public class NoticeService {

	public ArrayList<Notice> selectNoticeList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}//
	

	
	
	public int increaseCount(int noticeNo) {
		
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().increaseCount(conn, noticeNo);
		
		if(result > 0) JDBCTemplate.commit(conn);
		else JDBCTemplate.rollback(conn);
		
		
		return result;
	}//
	
	
	public Notice selectNotice(int noticeNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Notice notice = new NoticeDao().selectNotice(conn, noticeNo);
		
		JDBCTemplate.close(conn);
		
		
		return notice;
	}//
	
	
	public int delete(String noticeNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().delete(conn, noticeNo);
		
		if(result > 0) JDBCTemplate.commit(conn);
		else JDBCTemplate.rollback(conn);
		
		JDBCTemplate.close(conn);
		
		return result;
	}//
	
	
	public int insert(Notice notice) {
		
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().insert(conn, notice);
		
		if(result > 0) JDBCTemplate.commit(conn);
		else JDBCTemplate.rollback(conn);
				
		
		
		return result;
		
	}//
	
	
	public int updateNotice(Notice notice) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().updateNotice(conn, notice);
				
		if(result > 0) JDBCTemplate.commit(conn);
		else JDBCTemplate.rollback(conn);
		
		
		
		return result;
	}//
	
	
	public int selectListCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new NoticeDao().selectListCount(conn);
		
		JDBCTemplate.close(conn);
		
		
		return listCount;
	}//
	
	public void selectList(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		new NoticeDao().selectList(conn, pi);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}//
