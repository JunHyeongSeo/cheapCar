package com.kh.semi.event.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Properties;

import com.kh.semi.event.model.vo.EventBoard;

public class EventDao {

	private Properties prop = new Properties();
	
	public EventDao() {
		
		String filePath = EventDao.class.getResource("/sql/event/event-mapper.xml").getPath();
	
		//System.out.println(filePath);
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}//	
	
	public int insertEventBoard(Connection conn, EventBoard eBoard) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertEventBoard");
		
		
		
		
		
		
		
		return result;
	}//
	
	
	
	
	
}//
