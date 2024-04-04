package com.kh.semi.admin.ad.admin_cs.cs.e;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.common.model.vo.BoardAttachment;
import com.kh.semi.cs.model.vo.Cs;

/**
 * Servlet implementation class CsUpdateFormController
 */
@WebServlet("/update.cs")
public class CsUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CsUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int csNo = Integer.parseInt(request.getParameter("csNo"));
		String csTitle = request.getParameter("title");
		String csContent = request.getParameter("content");
		String[] upfile = request.getParameterValues("upfile");
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		Cs cs= new Cs();
		cs.setCsNo(csNo);
		cs.setCsTitle(csTitle);
		cs.setCsContent(csContent);
		
		BoardAttachment ba = new BoardAttachment();
		
		// ArrayList<>
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
