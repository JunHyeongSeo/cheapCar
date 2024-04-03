package com.kh.semi.admin.ad.admin_cs.cs.b;
	
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.common.model.vo.BoardAttachment;
import com.kh.semi.cs.model.service.CsService;
import com.kh.semi.cs.model.vo.Cs;
	
/**
 * Servlet implementation class AdminSelectMemberController
 */
@WebServlet("/detail.cs")
public class CsDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CsDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int csNo = Integer.parseInt(request.getParameter("csNo"));
		
		Cs cs = new CsService().csDetail(csNo);
		ArrayList<BoardAttachment> baList = new CsService().selectAttachment(csNo)
		
		
		request.setAttribute("cs", cs);
		request.setAttribute("baList", baList);
		request.getRequestDispatcher("views/cs/csDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
