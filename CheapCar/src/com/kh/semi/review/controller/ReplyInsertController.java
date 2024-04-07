package com.kh.semi.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.review.model.service.ReviewService;
import com.kh.semi.review.model.vo.Reply;

/**
 * Servlet implementation class ReplyInsertController
 */
@WebServlet("/replyInsert.review")
public class ReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String commentContent = request.getParameter("content");
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		Reply reply = new Reply();
		
		reply.setCommentContent(commentContent);
		reply.setReviewNo(reviewNo);
		reply.setMemberNo(memberNo);
		
		int result = new ReviewService().insertComment(reply);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(result > 0 ? "댓글성공" : "실패실패");
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
