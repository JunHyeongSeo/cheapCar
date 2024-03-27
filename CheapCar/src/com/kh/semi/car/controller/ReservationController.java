package com.kh.semi.car.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.car.model.service.CarService;

/**
 * Servlet implementation class ReservationController
 */
@WebServlet("/reservation.do")
public class ReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int managementNo = Integer.parseInt(request.getParameter("managementNo"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		String startRent = (String)request.getParameter("startRent");
		String endRent = (String)request.getParameter("endRent");
		
		
		
	    new CarService().insertReservation(managementNo);
	    
	    request.setAttribute("totalPrice", totalPrice);
	    request.setAttribute("startRent", startRent);
	    request.setAttribute("endRent", endRent);
	    
		request.getRequestDispatcher("views/car/reservation.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
