package com.kh.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/delete")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String memberPwd = request.getParameter("memberPwd");
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		int result = new MemberService().deleteMember(memberPwd, memberNo);
		
//		HttpSession session = request.getSession();
//		Member loginUser = ((Member)session.getAttribute("loginUser"));
		
		
		System.out.println(result);
		
		if(result > 0) {
			request.setAttribute("erorrMsg", "회원탈퇴에 성공하셨습니다!!!");
			request.getRequestDispatcher("views/common/errorPage").forward(request, response);

			
			HttpSession session = request.getSession();
			session.removeAttribute("loginUser");
			
			response.sendRedirect(request.getContextPath() + "/update");
			
		} else {
			
			request.setAttribute("errorMsg", "회원탈퇴에 실패하셨습니다...");
			request.getRequestDispatcher("views/common/errorPage").forward(request, response);

		}
		
	
		
		
//		response.sendRedirect(request.getContextPath() + "/update" );
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
