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
 * Servlet implementation class EventInsertController
 */
@WebServlet("/insert.event")
public class EventInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
			
			String savePath = request.getServletContext().getRealPath("/resources/event_upfiles");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
					
			
			
			String eventTitle = multiRequest.getParameter("title");
			String eventContent = multiRequest.getParameter("content");
			int memberNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			
			
			EventBoard eBoard = new EventBoard();
			eBoard.setEventTitle(eventTitle);
			eBoard.setEventContent(eventContent);
			eBoard.setMemberNo(memberNo);
			
			// ---------------- 이벤트 게시판 테이블 값 가공 ----------
			
			ArrayList<EventPhoto> list = new ArrayList();
			
			// 첨부파일 최소 1 ~ 최대 4개
			
			for(int i = 1; i <= 4; i++) {
				String key = "photo" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					
					EventPhoto ep = new EventPhoto();
					ep.setPhotoOname(multiRequest.getOriginalFileName(key));
					ep.setPhotoCname(multiRequest.getFilesystemName(key));
					ep.setPhotoPath("resources/event_upfiles");
										
					if(i == 1) {
						ep.setFileLevel(1); // 대표
					} else {
						ep.setFileLevel(2); // 서브이미지
					}
					list.add(ep);
				}
			}
			
			int result = new EventService().insert(eBoard, list);
			
			
			if(result > 0) {
				
				request.getSession().setAttribute("alertMsg", "★이벤트 게시물 등록에 성공하였습니다");
				response.sendRedirect(request.getContextPath() + "/list.event");
			} else {
				request.setAttribute("errorMsg", "게시물 등록에 실패하였습니다");
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
