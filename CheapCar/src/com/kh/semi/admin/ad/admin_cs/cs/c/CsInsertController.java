package com.kh.semi.admin.ad.admin_cs.cs.c;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.common.model.vo.BoardAttachment;
import com.kh.semi.cs.model.service.CsService;
import com.kh.semi.cs.model.vo.Cs;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminSelectMemberController
 */
@WebServlet("/insert.cs")
public class CsInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CsInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		// 파일첨부한거 db로 보낼 경우 parameter로 값 못뽑음
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024*1024*10;
			
			ServletContext application = request.getSession().getServletContext();
			
			String savePath = application.getRealPath("resources/board_upfiles/");
			
			// 서버에 업로드
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 이 다음부터 값 뽑으면 됨
			int memberNo = Integer.parseInt(multiRequest.getParameter("memberNo"));
			String csTitle = multiRequest.getParameter("title");
			String csContent = multiRequest.getParameter("content");
			
			Cs cs = new Cs();
			cs.setMemberNo(memberNo);
			cs.setCsTitle(csTitle);
			cs.setCsContent(csContent);
			
			ArrayList<BoardAttachment> list = new ArrayList();
			
			for(int i = 1; i <= 4; i++) {
				
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					
					BoardAttachment at = new BoardAttachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/board_upfiles");
					
					list.add(at);
					
				} 
			}
			
			int result = new CsService().insert(cs, list);
			
			
			
			
			
			
			
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
