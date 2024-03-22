package com.kh.semi.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.notice.model.service.NoticeService;
import com.kh.semi.notice.model.vo.Notice;



/**
 * Servlet implementation class NoticeDetailController
 */
@WebServlet("/detail.notice")
public class NoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) GET방식 => 인코딩 X
		
		// 2) request로부터 값 뽑기
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		// 3) VO가공 => 전달값 하나라 가공 필요 없음
		
		// 4) Service호출
		int result = new NoticeService().increaseCount(noticeNo);
		
		if(result > 0) {
			
			Notice notice = new NoticeService().selectNotice(noticeNo);
			
			if(notice != null) {
				
				request.getRequestDispatcher("views/notice/noticeDetail.jsp").forward(request, response);
		/*		
			} else {
				request.setAttribute("errorMsg", "공지사항 상세 조회 실패");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
			}
			
		} else {
			request.setAttribute("errorMsg", "공지사항 상세 조회 실패");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
