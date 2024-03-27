package com.kh.semi.event.model.service;

import java.sql.Connection;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.event.model.dao.EventDao;
import com.kh.semi.event.model.vo.EventBoard;
import com.kh.semi.event.model.vo.EventPhoto;

public class EventService {

	
	public int insertEventBoard(EventBoard eBoard, EventPhoto ePhoto) {
	
		
		Connection conn = JDBCTemplate.getConnection();
		
		int eBoardResult = new EventDao().insertEventBoard(conn, eBoard);
		int ePhotoResult = 1; 
		if(ePhoto != null) {
			ePhotoResult = new EventDao().insertEventPhoto(conn, ePhoto);
		}
		
		if((eBoardResult * ePhotoResult) > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
	return (eBoardResult * ePhotoResult);
	}
	
}
