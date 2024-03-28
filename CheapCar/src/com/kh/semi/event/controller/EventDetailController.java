package com.kh.semi.event.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.event.model.service.EventService;
import com.kh.semi.event.model.vo.EventBoard;

/**
 * Servlet implementation class EventDetailController
 */
@WebServlet("/detail.event")
public class EventDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int eventNo = Integer.parseInt(request.getParameter("eventNo"));

		
		int result = new EventService().increaseCount(eventNo);
		
		if(result > 0) {
			
			EventBoard eBoard = new EventService().selectEvent(eventNo);
			new EventService().selectEventPhoto(eventNo);
		}
		
		
		
		
		
		request.getRequestDispatcher("views/event/eventDetail.jsp").forward(request, response);
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
