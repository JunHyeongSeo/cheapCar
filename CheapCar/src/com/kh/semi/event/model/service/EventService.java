package com.kh.semi.event.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.event.model.vo.EventBoard;
import com.kh.semi.event.model.vo.EventPhoto;

public class EventService {

	
	public void insert(EventBoard eBoard, ArrayList<EventPhoto> list) {
	
		Connection conn = JDBCTemplate.getConnection();
		
		new EventDao().insert(conn, eBoard, list);
		
		
		
		
		
		
		
		
		return result;
	}	
		
		
		
		
		
	
}
