package com.kh.semi.admin.ab.admin_member.member.e;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;

/**
 * Servlet implementation class AjaxUpdateMemberController
 */
@WebServlet("/memberUpdate.do")
public class AjaxUpdateMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxUpdateMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberName = request.getParameter("name");
		String phone = request.getParameter("phone");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		String memberStatus = request.getParameter("status");
		String memberId = request.getParameter("checkId");
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		
		Member m = new Member();
		m.setMemberName(memberName);
		m.setPhone(phone);
		m.setBirthday(birthday);
		m.setEmail(email);
		m.setMemberStatus(memberStatus);
		m.setMemberId(memberId);
		
		int result = new MemberService().adminUpdateMem(m);
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
