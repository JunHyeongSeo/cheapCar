package com.kh.semi.admin.ac.admin_car.manage.d;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.car.model.service.CarService;
import com.kh.semi.car.model.vo.Car;

/**
 * Servlet implementation class AdminSelectMemberController
 */
@WebServlet("/carDetail.do")
public class AjaxDetailCarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxDetailCarController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int managementNo = Integer.parseInt(request.getParameter("managementNo"));
		
		Car car = new CarService().selectDetailCar(managementNo);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(car, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
