package com.kh.semi.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.review.model.vo.Review;
import com.kh.semi.review.model.vo.ReviewPhoto;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/insert.event")
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
			
			
			Review re = new Review();
			re.setReviewTitle(reviewTitle);
			re.setReviewContent(reviewContent);
			re.setMemberNo(memberNo);
			
			//------------------
			
			ArrayList<ReviewPhoto> list = new ArrayList();
			
			for(int i = 1; i <= 4; i++) {
				
				
				String key = "file" + i;
				
				
				if(multiRequest.getOriginalFileName(key) != null) {
					

					ReviewPhoto rphoto = new ReviewPhoto();
					rPhoto.setOriginName(multiRequest.getOriginalFileName(key));
					rPhoto.setChangeName(multiRequest.getFilesystemName(key));
					rPhoto.setFilePath("resources/review_upfiles");
					
					// 파일레벨
					if(i == 1) {
						// 대표이지미
						at.setFileLevel(1);
						
					} else {
						at.setFileLevel(2);
					}
					list.add(at);
				}
					
					
					
					
				}
				
				
				
				
				
				
				
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
