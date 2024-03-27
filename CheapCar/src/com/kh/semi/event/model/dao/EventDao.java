package com.kh.semi.event.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.event.model.vo.EventBoard;
import com.kh.semi.event.model.vo.EventPhoto;

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
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, eBoard.getEventTitle());
			pstmt.setString(2, eBoard.getEventContent());
			pstmt.setInt(3, eBoard.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}//
	
	public int insertEventPhoto(Connection conn, ArrayList<EventPhoto> list) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertEventPhoto");
		
		try {
			
			for(EventPhoto ep : list) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, ep.getPhotoOname());
				pstmt.setString(2, ep.getPhotoOname());
				pstmt.setString(3, ep.getPhotoPath());
				pstmt.setInt(4, ep.getFileLevel());
				
				result += pstmt.executeUpdate();
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result == list.size()? 1 : 0;
	}//
	
	
	public ArrayList<EventBoard> selectEventList(Connection conn){
		
		ArrayList<EventBoard> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectEventList");
		
		
		
		
		
		
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}//
