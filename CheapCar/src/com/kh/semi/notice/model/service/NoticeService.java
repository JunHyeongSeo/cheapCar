package com.kh.semi.notice.model.service;

import java.sql.Connection;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.notice.model.dao.NoticeDao;

public class NoticeService {

	public void selectNoticeList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		new NoticeDao().selectNoticeList(conn);
		
		
		
	}//
	
	
	
}//
