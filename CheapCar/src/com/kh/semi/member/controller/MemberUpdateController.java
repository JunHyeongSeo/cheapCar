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
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String memberName = request.getParameter("memberName");
		String birthday = request.getParameter("birthday");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String memberId = request.getParameter("memberId");
		
		Member member = new Member();
		
		member.setMemberName(memberName);
		member.setBirthday(birthday);
		member.setPhone(phone);
		member.setEmail(email);
		member.setMemberId(memberId);
		
		int result = new MemberService().updatemember(member);
		
		//System.out.println(result);
		
		if(result > 0) {
			
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "정보수정 성공!!");
			
			
			String memberPwd = ((Member)session.getAttribute("loginUser")).getMemberPwd();
			Member updateMem = new MemberService().login(memberId, memberPwd);
					
			session.setAttribute("loginUser", updateMem);

			
			response.sendRedirect(request.getContextPath() + "/updatemy");

			
			
		} else {
			request.setAttribute("errorMsg", "정보수정에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		System.out.println("나는 업데이트다");
	}

}
