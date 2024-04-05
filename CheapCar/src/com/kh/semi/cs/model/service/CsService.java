package com.kh.semi.cs.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.model.vo.BoardAttachment;
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
	
	public int insert(Cs cs, ArrayList<BoardAttachment> list) {
		
		Connection conn = getConnection();
		
		// cs_board 에는 무조건 insert를 할건데,
		// 첨부파일은 list가 비어있지 않을때만 할거임 그래서
		
		int result = 0;
		
		int csResult = new CsDao().insertCs(conn, cs);
		
		int attachmentResult = 1;
		
		if(!list.isEmpty()) {
			attachmentResult = new CsDao().insertAttachment(conn, list);
		}
		
		result = csResult * attachmentResult;
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public ArrayList<BoardAttachment> selectAttachment(int csNo) {
		
		Connection conn = getConnection();
		
		ArrayList<BoardAttachment> list = new CsDao().selectAttachment(conn, csNo);
		
		close(conn);
		
		return list;
	}
	
	public int delete(int csNo) {
		
		Connection conn = getConnection();
		
		int result = 1;
		
		int csResult = new CsDao().deleteCs(conn, csNo);
		
		int attachment = new CsDao().selectAttachmentByCsNo(conn, csNo);
		
		int attachmentResult = 1;
		
		if(attachment > 0) {
			attachmentResult = new CsDao().deleteAttachment(conn, csNo);
		} 
		
		result = csResult * attachmentResult;
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
	public int update(Cs cs, ArrayList<BoardAttachment> updateList, ArrayList<BoardAttachment> insertList) {
		
		Connection conn = getConnection();
		
		int result = 1;
		
		int csResult = 1;
		csResult = new CsDao().updateCs(conn, cs);
		
		int ulResult = 1;
		if(!updateList.isEmpty()) {
			ulResult = new CsDao().updateAttachment(conn, updateList);
		}
		
		int inResult = 1;
		if(!insertList.isEmpty()) {
			inResult = new CsDao().insertAttachmentAgain(conn, insertList, cs.getCsNo());
		}
		
		result = csResult * ulResult * inResult;
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
