package com.kh.semi.member.model.dao;

import static com.kh.semi.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String filePath = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			rset.next();
			
			result = rset.getInt("COUNT(*)");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Member> selectList(Connection conn, PageInfo pi) {
		
		ArrayList<Member> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try{ 
			pstmt = conn.prepareStatement(sql);
		
			rset = pstmt.executeQuery();
			/*
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			*/
			
			while(rset.next()) {
				
				Member m = new Member();
				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setMemberId(rset.getString("MMEMBER_ID"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setBirthday(rset.getString("BIRTHDAY"));
				m.setPhone(rset.getString("PHONE"));
				m.setEmail(rset.getString("EMAIL"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				
				list.add(m);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return list;
	}
	
	
	
	
	
public Member login(Connection conn, String memberId, String memberPwd) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("login");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member(rset.getInt("MEMBER_NO"),
							   rset.getString("MEMBER_ID"),
							   rset.getString("MEMBER_NAME"),
							   rset.getString("MEMBER_PWD"),
							   rset.getString("BIRTHDAY"),
							   rset.getString("PHONE"),
							   rset.getString("EMAIL"),
							   rset.getDate("ENROLL_DATE"),
							   rset.getString("MEMBER_STATUS"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return m;
	}
	
	public int insertMember(Connection conn, Member member) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertTBMember");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberName());
			pstmt.setString(3, member.getMemberPwd());
			pstmt.setString(4, member.getBirthday());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	
	public int updatemember(Connection conn, Member member) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatemember");
		
	
		
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
