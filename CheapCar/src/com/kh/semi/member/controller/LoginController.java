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
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		
		Member loginUser = new MemberService().login(memberId, memberPwd);
		
		
		
		if(loginUser == null) {
			
			request.setAttribute("errorMsg", "로그인에 실패했습니다!!");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		} else {
			
			HttpSession session = request.getSession();
			
			session.setAttribute("loginUser", loginUser);
			
			session.setAttribute("alertMsg", "로그인 성공!!");
			
//			System.out.println(loginUser.getMemberStatus());
//			
//			System.out.println(loginUser.getMemberStatus().equals("C"));
			
			if(loginUser.getMemberStatus().equals("C")) { 
			
				response.sendRedirect(request.getContextPath());
			
			} else {
				
				response.sendRedirect(request.getContextPath() + "/views/common/adminMain.jsp");
				
			}
			
			
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
