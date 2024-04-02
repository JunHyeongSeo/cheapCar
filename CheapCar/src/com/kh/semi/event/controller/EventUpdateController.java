package com.kh.semi.event.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.event.model.service.EventService;
import com.kh.semi.event.model.vo.EventBoard;
import com.kh.semi.event.model.vo.EventPhoto;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class EventUpdateController
 */
@WebServlet("/update.event")
public class EventUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventUpdateController() {
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
			
			String savePath = request.getServletContext().getRealPath("resources/event_upfiles");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//----------------------
			
			EventBoard eBoard = new EventBoard();
			int memberNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			int eventNo = Integer.parseInt(multiRequest.getParameter("eventNo"));
			String eventTitle = multiRequest.getParameter("title");
			String eventContent = multiRequest.getParameter("content");
			
			eBoard.setMemberNo(memberNo);
			eBoard.setEventNo(eventNo);
			eBoard.setEventTitle(eventTitle);
			eBoard.setEventContent(eventContent);
			
			
			
			//----------------------
			
			EventPhoto ePhoto = null;
			
			if(multiRequest.getOriginalFileName("rePhoto1") != null) {

				ePhoto = new EventPhoto();
				ePhoto.setPhotoOname(multiRequest.getOriginalFileName("rePhoto1"));
				ePhoto.setPhotoCname(multiRequest.getFilesystemName("rePhoto1"));
				ePhoto.setPhotoPath("resources/event_upfiles");
				
				
				if(multiRequest.getParameter("photoNo") != null) {// 첨부파일이 존재 + 원본파일도 존재 => UPDATE ATTACHMENT => DB에 저장된 원본파일 No가 필요함
				
					ePhoto.setPhotoNo(Integer.parseInt(multiRequest.getParameter("photoNo")));
					new File(savePath + multiRequest.getParameter("photoCname")).delete();
					
				} else {
					ePhoto.setEventNo(eventNo);	
					
				}
			} 
			int result = new EventService().update(eBoard, ePhoto);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "게시글 수정에 성공하였습니다.");
				response.sendRedirect(request.getContextPath() + "/detail.event?eventNo=" + eventNo);
			} else {
				request.setAttribute("errorMsg", "실패실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				
				
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
