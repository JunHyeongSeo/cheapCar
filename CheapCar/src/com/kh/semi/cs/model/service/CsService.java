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
		
		
		
	}
	
	
	
	

}
