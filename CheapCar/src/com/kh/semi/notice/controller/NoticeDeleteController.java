package com.kh.semi.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.notice.model.service.NoticeService;

/**
 * Servlet implementation class DeleteNoticeController
 */
@WebServlet("/delete.notice")
public class NoticeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 값 뽑기 X
		// Service호출    /  + noticeNo
		if(new NoticeService().delete(request.getParameter("noticeNo")) > 0 ) {
			request.getSession().setAttribute("alertMsg", "삭제가 완료되었습니다." );
			response.sendRedirect(request.getContextPath() + "/list.notice?currentPage=1");
		} else {
			request.setAttribute("errorMsg", "삭제실패~");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}	
		
		
		
	}//

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
