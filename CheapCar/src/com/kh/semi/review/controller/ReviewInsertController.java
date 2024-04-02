package com.kh.semi.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.review.model.service.ReviewService;
import com.kh.semi.review.model.vo.ReviewBoard;
import com.kh.semi.review.model.vo.ReviewPhoto;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/insert.review")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
			
			String savePath = request.getServletContext().getRealPath("resources/review_upfiles");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			/*
			 * 작성자, 제목, 내용, 첨부파일, 
			 */
			
			String reviewTitle = multiRequest.getParameter("title");
			String reviewContent = multiRequest.getParameter("content");
			int memberNo = Integer.parseInt(multiRequest.getParameter("memberNo"));
			
			
			ReviewBoard rBoard = new ReviewBoard();
			rBoard.setReviewTitle(reviewTitle);
			rBoard.setReviewContent(reviewContent);
			rBoard.setMemberNo(memberNo);
			
			//------------------
			
			ArrayList<ReviewPhoto> list = new ArrayList();
			
			for(int i = 1; i <= 4; i++) {
				
				
				String key = "photo" + i;
				
				
				if(multiRequest.getOriginalFileName(key) != null) {
					

					ReviewPhoto rPhoto = new ReviewPhoto();
					
					rPhoto.setPhotoOname(multiRequest.getOriginalFileName(key));
					rPhoto.setPhotoCname(multiRequest.getFilesystemName(key));
					rPhoto.setPhotoPath("resources/review_upfiles");
					
					if(i == 1) {
						rPhoto.setFileLevel(1);
					} else {
						rPhoto.setFileLevel(2);
					}
					list.add(rPhoto);
				}
			}
			
			int result = new ReviewService().insertReview(rBoard, list);
			
			if(result > 0) {
				
				request.getSession().setAttribute("alertMsg", "후기게시판 등록에 성공하였습니다.");
				response.sendRedirect(request.getContextPath() + "/list.review?currentPage=1");
				
			} else {
				
				if(list.size() > 0) {
					for(int i = 0; i < list.size(); i++) {
						new File(savePath, list.get(i).getPhotoCname()).delete();
					}
				}
				
				request.setAttribute("errorMsg", "게시판 등록에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				
			}
				
		}

	}//
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
