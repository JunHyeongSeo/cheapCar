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
 * Servlet implementation class MemberPwdUpdateController
 */
@WebServlet("/updatePwd")
public class MemberChangePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberChangePwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
	
		String memberPwd = request.getParameter("memberPwd");
		String changePwd = request.getParameter("changePwd");
	
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
	
		int result = new MemberService().updatePwd(memberPwd, changePwd, memberNo);
		
		HttpSession session = request.getSession();
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		
		String alertMsg = "";
		
		System.out.println(result);
		
		if(result > 0) {
			
			alertMsg = "비밀번호 변경 성공";
			
			session.setAttribute("loginUser", 
					new MemberService().selectMember(loginUser.getMemberId()));
			
		} else {
			
			alertMsg = "비밀번호 변경 실패";
			
		}
		session.setAttribute("alertMsg", alertMsg);
		
		
		response.sendRedirect(request.getContextPath() + "/update" );

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
