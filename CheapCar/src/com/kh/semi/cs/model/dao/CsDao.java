package com.kh.semi.cs.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.cs.model.vo.Cs;

public class CsDao {
	
	private Properties prop = new Properties();
	
	public CsDao(){
		
		String filePath = CsDao.class.getResource("/sql/cs/cs-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectCsListCount(Connection conn) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCsListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			rset.next();
			
			result = rset.getInt("count(*)");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Cs> selectCsList(Connection conn, PageInfo pi){
		
		ArrayList<Cs> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCsList");
		
		
		
	}
	

}
