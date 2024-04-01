package com.kh.semi.event.controller;

import java.io.IOException;
import java.util.ArrayList;

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
			
			System.out.println(eBoard);
			
			//----------------------
			
		    if(multiRequest.getOriginalFileName("rePhoto1") == null && multiRequest.getOriginalFileName("rePhoto2") == null
		       && multiRequest.getOriginalFileName("rePhoto3") == null && multiRequest.getOriginalFileName("rePhoto4") == null	 	) {
			   
				int result = new EventService().updateBoard(eBoard);
				
				if(result > 0) {
					request.getSession().setAttribute("alertMsg", "이벤트 게시글 수정에 성공하였습니다.");
					response.sendRedirect(request.getContextPath() + "/list.event?currentPage=1");
				} else {
					request.setAttribute("errorMsg", "게시글 수정에 실패하였습니다.");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);

				}
				
		    } else {
				
				ArrayList<EventPhoto> list = new ArrayList();
				
				for(int i = 1; i <= 4; i++) {
					String key = "rePhoto" + i;
					
					EventPhoto ep = new EventPhoto();
					ep.setPhotoOname(multiRequest.getOriginalFileName(key));
					ep.setPhotoCname(multiRequest.getFilesystemName(key));
					ep.setPhotoPath("resources/event_upfiles");
					ep.setEventNo(eventNo);
					
					if(i == 1) {
						ep.setFileLevel(1); // 대표
					} else {
						ep.setFileLevel(2); // 서브이미지
					}
				
				list.add(ep);
				}
				System.out.println(list);
				int result = new EventService().update(eBoard, list);
				
				if(result > 0) {
					request.getSession().setAttribute("alertMsg", "이벤트 게시글 수정에 성공하였습니다.");
					response.sendRedirect(request.getContextPath() + "/list.event?currentPage=1");
				} else {
					request.setAttribute("errorMsg", "게시글 수정에 실패하였습니다.");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
					
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
