package com.kh.semi.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.notice.model.service.NoticeServiceImpl;
import com.kh.semi.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListController
 */
@WebServlet("/list.notice")
public class NoticeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) 인코딩 -> a태그는 무조건 get방식 => 인코딩 필요 X
		
		// 2) 값뽑기 -> 
		// 3) 가공
	
		// 화면 띄워주기 전 NOTICE테이블에 있는 전체 행의 데이터를 조회해서 응답페이지에 전달해야함!
		
		// 4) Service단으로 SELECT요청 보내야함!
		// 공지사항 목록 => 가져올 행의 개수 : 최소 0개 ~ 최대 모름 => List에 담기
		//ArrayList<Notice> list = new NoticeServiceImpl().selectNoticeList();
		//request.setAttribute("noticeList", list);
		
		// 최종적으로 얘가 할 일 : 응답화면 띄우기. -> noticeList.jsp에다가
		RequestDispatcher view = request.getRequestDispatcher("views/notice/notice.jsp");
		view.forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
