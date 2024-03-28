package com.kh.semi.event.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.event.model.service.EventService;

/**
 * Servlet implementation class EventDeleteController
 */
@WebServlet("/delete.event")
public class EventDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		int eventNo = Integer.parseInt(request.getParameter("eventNo"));
		
		int result = new EventService().deleteEvent(eventNo);
		
		if(result > 0) {
			
			request.setAttribute("alertMsg", "이벤트게시물 삭제에 성공하였습니다.");
			request.getRequestDispatcher("views/event/event.jsp").forward(request, response);
			
		} 
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
