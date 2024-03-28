package com.kh.semi.event.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.event.model.dao.EventDao;
import com.kh.semi.event.model.vo.EventBoard;
import com.kh.semi.event.model.vo.EventPhoto;

public class EventService {

	
	public int insert(EventBoard eBoard, ArrayList<EventPhoto> list) {
	
		Connection conn = JDBCTemplate.getConnection();
		
		int eBoardResult = new EventDao().insertEventBoard(conn, eBoard);
		
		int ePhotoResult = new EventDao().insertEventPhoto(conn, list);
		
		if(eBoardResult * ePhotoResult > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
			
		return (eBoardResult * ePhotoResult);
	}//
	
	public ArrayList<EventBoard> selectEventList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<EventBoard> list = new EventDao().selectEventList(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}//
	
	public int increaseCount(int eventNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new EventDao().increaseCount(conn, eventNo);
		
		return result;
		
	}
	
	
	public EventBoard selectEvent(int eventNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		EventBoard eBoard = new EventDao().selectEvent(conn, eventNo);
		
		return eBoard;
	}//
	
	public ArrayList<EventPhoto> selectEventPhoto(int eventNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<EventPhoto> list = new EventDao().selectEventPhoto(conn, eventNo);
		
		
		return list;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
		
		
		
		
		
	
}
