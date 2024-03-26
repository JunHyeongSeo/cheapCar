package com.kh.semi.event.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.event.model.vo.EventBoard;
import com.kh.semi.event.model.vo.EventPhoto;

public class EventService {

	
	public int insertEventBoard(EventBoard eBoard, ArrayList<EventPhoto> list) {
	
		
		Connection conn = JDBCTemplate.getConnection();
		
		new EventDao().insertEventBoard(conn, eBoard);
		new EventDao().insertEventBoard(conn, list);
		
	
	
	
	
	return result;
	}
	
}
