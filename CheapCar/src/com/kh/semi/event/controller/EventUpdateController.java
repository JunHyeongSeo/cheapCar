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
			
			int listsize = Integer.parseInt(multiRequest.getParameter("listSize"));
			
			
		    if(multiRequest.getParameter("rePhoto_1") == null) {
			    ArrayList<EventPhoto> list = new ArrayList();				
				for(int i = 0; i < listsize; i++) {
					
					list.add(new EventPhoto(Integer.parseInt(multiRequest.getParameter("photoNo_" + i)),
											multiRequest.getParameter("photoCname_" + i),
							                Integer.parseInt(multiRequest.getParameter("fileLevel_" + i))));
					
				}
				System.out.println(list);
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
