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

import com.kh.semi.common.model.vo.BoardAttachment;
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
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Cs cs = new Cs();
				cs.setCsNo(rset.getInt("CS_NO"));
				cs.setCsTitle(rset.getString("CS_TITLE"));
				cs.setMemberName(rset.getString("MEMBER_NAME"));
				cs.setReplyYn(rset.getString("REPLY_YN"));
				cs.setCreateDate(rset.getDate("CREATE_DATE"));
				
				list.add(cs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Cs csDetail(Connection conn, int csNo) {
		
		Cs cs = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("csDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, csNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				cs = new Cs();
				
				cs.setCsNo(rset.getInt("CS_NO"));
				cs.setCsTitle(rset.getString("CS_TITLE"));
				cs.setCsContent(rset.getString("CS_CONTENT"));
				cs.setCreateDate(rset.getDate("CREATE_DATE"));
				cs.setReplyYn(rset.getString("REPLY_YN"));
				cs.setStatus(rset.getString("STATUS"));
				cs.setMemberName(rset.getString("MEMBER_NAME"));
				cs.setMemberNo(rset.getInt("MEMBER_NO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return cs;
	}
	
	public int insertCs(Connection conn, Cs cs) {
		
		int result = 0 ;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCs");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cs.getCsTitle());
			pstmt.setString(2, cs.getCsContent());
			pstmt.setInt(3, cs.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertAttachment(Connection conn, ArrayList<BoardAttachment> list) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {

			for(BoardAttachment ba : list) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, ba.getOriginName());
				pstmt.setString(2, ba.getChangeName());
				pstmt.setString(3, ba.getFilePath());
				
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<BoardAttachment> selectAttachment(Connection conn, int csNo){
		
		ArrayList<BoardAttachment> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, csNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				BoardAttachment ba = new BoardAttachment();
				
				ba.setFileNo(rset.getInt("FILE_NO"));
				ba.setOriginName(rset.getString("ORIGIN_NAME"));
				ba.setChangeName(rset.getString("CHANGE_NAME"));
				ba.setFilePath(rset.getString("FILE_PATH"));
				ba.setUploadDate(rset.getDate("UPLOAD_DATE"));
				ba.setStatus(rset.getString("STATUS"));
				ba.setRefBno(rset.getInt("REF_NO"));
				
				list.add(ba);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int deleteCs(Connection conn, int csNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCs");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, csNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int selectAttachmentByCsNo(Connection conn, int csNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachmentByCsNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, csNo);
			
			rset = pstmt.executeQuery();
			rset.next();
			
			result = rset.getInt("COUNT(*)");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}
	
	public int deleteAttachment(Connection conn, int csNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, csNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateCs(Connection conn, Cs cs) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCs");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cs.getCsTitle());
			pstmt.setString(2, cs.getCsContent());
			pstmt.setInt(3, cs.getCsNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateAttachment(Connection conn, ArrayList<BoardAttachment> updateList) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			
			for(BoardAttachment ba : updateList) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, ba.getOriginName());
				pstmt.setString(2, ba.getChangeName());
				pstmt.setString(3, ba.getFilePath());
				pstmt.setInt(4, ba.getFileNo());
				
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/*
	public int searchedCsCount(Connection conn, String searchId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchedCsCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchId);
			pstmt.setString(2, searchId);
			
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

	public ArrayList<Cs> searchedCsList(Connection conn, PageInfo pi, String searchId){
		
		ArrayList<Cs> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchedCsList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Cs cs = new Cs();
				cs.setCsNo(rset.getInt("CS_NO"));
				cs.setCsTitle(rset.getString("CS_TITLE"));
				cs.setMemberName(rset.getString("MEMBER_NAME"));
				cs.setReplyYn(rset.getString("REPLY_YN"));
				
				list.add(cs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	*/
	
	
	
	
	

}
