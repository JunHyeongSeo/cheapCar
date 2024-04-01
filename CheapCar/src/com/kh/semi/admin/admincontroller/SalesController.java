package com.kh.semi.admin.admincontroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.car.model.service.CarService;
import com.kh.semi.car.model.vo.Car;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class salesController
 */
@WebServlet("/sales")
public class SalesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		ArrayList<Car> carlist = new CarService().carcarall();
		
	
		
		if(carlist.isEmpty()) {
			
		} else { // 올해 이번 달 자동차 리스트 매출조회 화면에 띄워줄
			//System.out.println(carlist);
			request.setAttribute("carlist", carlist);
			request.getRequestDispatcher("views/admin/admin_sales/sales.jsp").forward(request, response);
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
