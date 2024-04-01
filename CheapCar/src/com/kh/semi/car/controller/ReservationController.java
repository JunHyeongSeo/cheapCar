package com.kh.semi.car.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.car.model.service.CarService;
import com.kh.semi.car.model.vo.Car;
import com.kh.semi.car.model.vo.Reservation;

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
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String startDate = (String)request.getParameter("startDate");
		String endDate = (String)request.getParameter("endDate");
		
		Reservation reservation = new Reservation();
		reservation.setManagementNo(managementNo);
		reservation.setTotalPrice(totalPrice);
		reservation.setStartDate(startDate);
		reservation.setMemberNo(memberNo);
		reservation.setEndDate(endDate);
		
		int result = new CarService().insertReservation(reservation);
		
		if(result > 0) {

			Car car = new CarService().selectDetailCar(managementNo);
			
			request.setAttribute("car", car);
			request.setAttribute("totalPrice", totalPrice);
			request.setAttribute("startDate", startDate);
			request.setAttribute("endDate", endDate);
			
			request.getRequestDispatcher("views/car/reservation.jsp").forward(request, response);
			
		} else {
			request.getRequestDispatcher("views/common/errorMsg.jsp").forward(request, response);
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
