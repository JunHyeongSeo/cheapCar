	package com.kh.semi.admin.admin_member;
	
	import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.member.model.service.MemberService;
import com.kh.semi.member.model.vo.Member;
	
	/**
	 * Servlet implementation class AdminSelectMemberController
	 */
	@WebServlet("/adminBLS")
	public class AjaxSelectBlsController extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public AjaxSelectBlsController() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	
		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			int listCount = new MemberService().selectBlackListCount();
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			int pageLimit = 10;
			int boardLimit = 1;
			int maxPage =(int)Math.ceil((double)listCount / boardLimit);
			int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
			int endPage = startPage + pageLimit - 1;
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
			
			ArrayList<Member> list = new MemberService().blackListCount(pi);
			
			request.setAttribute("blackList", list);
			request.setAttribute("pageInfo", pi);
			
			
		}
	
		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(request, response);
		}
	
	}
