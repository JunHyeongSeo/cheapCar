package com.kh.semi.admin.ad.admin_cs.cs.e;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.common.model.vo.BoardAttachment;
import com.kh.semi.cs.model.service.CsService;
import com.kh.semi.cs.model.vo.Cs;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class CsUpdateFormController
 */
@WebServlet("/update.cs")
public class CsUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CsUpdateController() {
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
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int csNo = Integer.parseInt(multiRequest.getParameter("csNo"));
			String csTitle = multiRequest.getParameter("title");
			String csContent = multiRequest.getParameter("content");
			int memberNo = Integer.parseInt(multiRequest.getParameter("memberNo"));
			
			Cs cs= new Cs();
			cs.setCsNo(csNo);
			cs.setCsTitle(csTitle);
			cs.setCsContent(csContent);
			cs.setMemberNo(memberNo);
			
			ArrayList<BoardAttachment> updateList = new ArrayList();
			for(int i = 1; i <= 4; i++) {
				
				String key = "reUpfile" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					
					BoardAttachment ba = new BoardAttachment();
					ba.setOriginName(multiRequest.getOriginalFileName(key));
					ba.setChangeName(multiRequest.getFilesystemName(key));
					ba.setFilePath("resources/board_upfiles");
					
					if(multiRequest.getParameter("fileNo" + i) != null) {
						ba.setFileNo(Integer.parseInt(multiRequest.getParameter("fileNo" + i)));
					}
					
					updateList.add(ba);
				}
			}
			
			ArrayList<BoardAttachment> insertList = new ArrayList();
			for(int i = 1; i <= 4; i++) {
				
				String key = "upfile" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					
					BoardAttachment ba = new BoardAttachment();
					ba.setOriginName(multiRequest.getOriginalFileName(key));
					ba.setChangeName(multiRequest.getFilesystemName(key));
					ba.setFilePath("resources/board_upfiles");
					
					insertList.add(ba);
				}
			}
			
			int result = new CsService().update(cs, updateList, insertList);
			
			if(result > 0) {
				
				HttpSession session = request.getSession();
				
				session.setAttribute("alertMsg", "수정이 완료되었습니다.");
				//response.sendRedirect("views/머시기/detail.jsp");
				
				response.sendRedirect(request.getContextPath() + "/detail.cs?csNo=" + csNo);
				
				
			} else {
				request.setAttribute("errorMsg", "수정 실패");
				
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
