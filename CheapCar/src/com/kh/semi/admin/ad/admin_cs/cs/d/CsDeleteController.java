package com.kh.semi.admin.ad.admin_cs.cs.d;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.cs.model.service.CsService;

/**
 * Servlet implementation class CsDeleteControlelr
 */
@WebServlet("/delete.cs")
public class CsDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CsDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int csNo = Integer.parseInt(request.getParameter("csNo"));
		
		int result = new CsService().delete(csNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "삭제가 완료되었습니다~!");
			response.sendRedirect(request.getContextPath() + "/list.cs?currentPage=1");
		} else {
			request.setAttribute("errorMsg", "삭제 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
