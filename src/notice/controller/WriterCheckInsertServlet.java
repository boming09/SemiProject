package notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import member.model.vo.Member;
import notice.model.service.WCheckService;
import notice.model.vo.Upload;
import notice.model.vo.WBook;
import notice.model.vo.WCheck;

/**
 * Servlet implementation class WriterCheckInsertServlet
 */
@WebServlet("/w-check/insert")
public class WriterCheckInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriterCheckInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 작가인증게시판 글작성 화면 이동
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/notice/writerCheckInsertView.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 작가인증 게시판 - 첨부파일 있음(2개)
		
		/* enctype이 multipart/form-data로 전송 되었는지 확인하고 아닐 경우 에러페이지 이동 */
		if(!ServletFileUpload.isMultipartContent(request)) {
			// 잘못된경로면 일단 cs페이지로...
			request.getSession().setAttribute("msg", "잘못된 전송입니다.");
			request.getRequestDispatcher("/WEB-INF/views/notice/csPageView.jsp").forward(request, response);
			return;
		}
				
		/* 1. 전송 파일 용량 제한 : 10MB로 제한 */
		int maxSize = 1024*1024*10;
		
		/* 2. 웹 서버 컨테이너 경로 추출 후 파일이 실제 저장 될 경로 지정 */
		String root = request.getSession().getServletContext().getRealPath("/");
		//System.out.println("root : " + root);
		String savePath = root + "resources\\uploadFiles\\notice\\wCheck\\";
		
		/* HttpServletRequest => MultipartRequest 로 변경 */
		MultipartRequest multiRequest
			= new MultipartRequest(request, savePath, maxSize, "UTF-8"
									, /*new DefaultFileRenamePolicy()*/ new MyFileRenamePolicy());
		
		String wtitle = multiRequest.getParameter("title");
		String wcontent = multiRequest.getParameter("content");
		// 작가 회원번호 = user 아직 작가등급 아님
		int user_no = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		WCheck wcheck = new WCheck();
		wcheck.setWtitle(wtitle);
		wcheck.setWcontent(wcontent);
		wcheck.setUser_no(user_no);
		//System.out.println(wtitle + " " + wcontent + " " + user_no);
		
		// 도서리스트 받아오기 .... 증말 어려워9ㅅ9
		String bid = multiRequest.getParameter("bid"); 
		//System.out.println(bid);
		//=> 15,14,3 ... 
		
		// 문자열 자르기
		String[] bidList = bid.split(",");
		/*
		for(int i = 0; i < bidList.length; i++) {
			System.out.println(bidList[i]);
		}
		*/
		// 작가 도서 리스트
		List<WBook> wbookList = new ArrayList<>();
		
		for(int i = 0; i < bidList.length; i++) {
			WBook wbook = new WBook();
			wbook.setBid(Integer.parseInt(bidList[i]));
			
			wbookList.add(wbook);
		}
		wcheck.setWbook(wbookList);
		
		
		// 첨부파일
		List<Upload> uploadList = new ArrayList<>();
		// file이 몇개 될지 몰라~~
		String[] uploadFile = { "file1", "file2" };
		
		for(int i = 0; i < uploadFile.length; i++) {
			// 파일첨부가 안되었으면 빠져나감.
			if(multiRequest.getFilesystemName(uploadFile[i]) == null) {
				continue;
			}
			
			Upload upload = new Upload();
			upload.setFile_path("/resources/uploadFiles/notice/wCheck/");
			upload.setOrigin_file(multiRequest.getOriginalFileName(uploadFile[i]));
			upload.setChange_file(multiRequest.getFilesystemName(uploadFile[i]));
			
			uploadList.add(upload);
		}
		wcheck.setWupload(uploadList);
		
		//System.out.println(wcheck);
		
		int result = new WCheckService().insertWCheck(wcheck);
		
		if(result > 0) {
			// 인증게시판 목록 재요청
			request.getSession().setAttribute("msg", "게시글이 등록 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/w-check");
		} else {
			// 실패시 저장 된 사진 삭제
			for(Upload upload : uploadList) {
				File failedFile = new File(savePath + upload.getChange_file());
				failedFile.delete();
			}
			
			request.getSession().setAttribute("msg", "실패9ㅅ9");
			request.getRequestDispatcher("/WEB-INF/views/notice/writerCheckView.jsp").forward(request, response);
		}
		
	}

}
