package com.kh.semi.cs.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.cs.model.dao.CsDao;
import com.kh.semi.cs.model.vo.Cs;

public class CsService {
	
	public int selectCsListCount() {
		
		Connection conn = getConnection();
		
		int result = new CsDao().selectCsListCount(conn);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Cs> selectCsList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Cs> list = new CsDao().selectCsList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	/*
	public int searchedCsCount(String searchId) {
		
		Connection conn = getConnection();
		
		int result = new CsDao().searchedCsCount(conn, searchId);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Cs> searchedCsList(PageInfo pi, String searchId) {
		
		Connection conn = getConnection();
		
		ArrayList<Cs> list = new CsDao().searchedCsList(conn, pi, searchId);
		
		close(conn);
		
		return list;
	}
	*/
	
	public Cs csDetail(int csNo) {
		
		Connection conn = getConnection();
		
		Cs cs = new CsDao().csDetail(conn, csNo);
		
		close(conn);
		
		return cs;
	}
	

}
