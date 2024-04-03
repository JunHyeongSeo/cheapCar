package com.kh.semi.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.review.model.service.ReviewService;
import com.kh.semi.review.model.vo.ReviewBoard;
import com.kh.semi.review.model.vo.ReviewPhoto;

/**
 * Servlet implementation class ReviewDetailController
 */
@WebServlet("/detail.review")
public class ReviewDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		
		ReviewService ReviewService = new ReviewService();
		
		int result = ReviewService.increaseCount(reviewNo);
		String dispatcherPath = "";
		if(result > 0) {
		
			ReviewBoard rBoard = ReviewService.selectReviewBoard(reviewNo);
			
			ArrayList<ReviewPhoto> list = ReviewService.selectReviewPhoto(reviewNo);
			
			if(list.size() > 0) {
				request.setAttribute("list", list);
			}
			request.setAttribute("rBoard", rBoard);
		
			
			dispatcherPath = "views/review/reviewDetail.jsp";
			                                           
		} else {
			
			request.setAttribute("errorMsg", "게시글 조회 실 패");
			dispatcherPath = "views/common/errorPage.jsp";
		}
		
		
		request.getRequestDispatcher(dispatcherPath).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
