package com.kh.semi.event.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.event.model.dao.EventDao;
import com.kh.semi.event.model.vo.EventBoard;
import com.kh.semi.event.model.vo.EventPhoto;

public class EventService {

	
	public int insert(EventBoard eBoard, EventPhoto ePhoto) {
	
		Connection conn = JDBCTemplate.getConnection();
		
		int eBoardResult = new EventDao().insertEventBoard(conn, eBoard);
		
		int ePhotoResult = new EventDao().insertEventPhoto(conn, ePhoto);
		
		if(eBoardResult * ePhotoResult > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
			
		return (eBoardResult * ePhotoResult);
		
	}//
	
	public int selectListCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new EventDao().selectListCount(conn);
		
		JDBCTemplate.close(conn);
		
		
		return listCount;
	}//
	
	public ArrayList<EventBoard> selectEventList(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<EventBoard> list = new EventDao().selectEventList(conn, pi);
		
		JDBCTemplate.close(conn);
		
		return list;
	}//
	
	
	public int increaseCount(int eventNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new EventDao().increaseCount(conn, eventNo);
		
		JDBCTemplate.close(conn);
		
		
		return result;
		
	}//
	
	
	public EventBoard selectEvent(int eventNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		EventBoard eBoard = new EventDao().selectEvent(conn, eventNo);
		
		JDBCTemplate.close(conn);
		
		return eBoard;
	}//
	
	
	public ArrayList<EventPhoto> selectEventPhoto(int eventNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<EventPhoto> list = new EventDao().selectEventPhoto(conn, eventNo);
		
		JDBCTemplate.close(conn);
		
		return list;
		
		
	}//
	
	
	public int deleteEvent(int eventNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int boardResult = new EventDao().deleteEventBoard(conn, eventNo);
		int photoResult = new EventDao().deleteEventPhoto(conn, eventNo);
		
		if((boardResult * photoResult) > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		
		return (boardResult * photoResult);
	}
	
	
	
	public int update(EventBoard eBoard, EventPhoto ePhoto) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int ebResult = new EventDao().updateBoard(conn, eBoard);
		int epResult = new EventDao().updatePhoto(conn, ePhoto);
		
		
		if((ebResult * epResult) > 0){
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		
		
		return (ebResult * epResult);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
		
		
		
		
	
}
