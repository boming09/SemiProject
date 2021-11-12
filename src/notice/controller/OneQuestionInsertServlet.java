package notice.controller;

import java.io.File;
import java.io.IOException;

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
import notice.model.service.OneService;
import notice.model.vo.One;


/**
 * Servlet implementation class OneQuestionInsertServlet
 */
@WebServlet("/one/insert")
public class OneQuestionInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OneQuestionInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1:1문의하기
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/notice/oneQuestionInsertView.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 사진 파일이 있을경우
		 * form 전송시 enctype을 multipart/form-data로 전송하는 경우
		 * 기존방식 request.getParameter("name")과 같은 방식으로 값을 추출할 수 없음
		 */
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			// 잘못된경로면 일단 cs페이지로...
			request.getSession().setAttribute("massage", "잘못된 전송입니다.");
			request.getRequestDispatcher("/WEB-INF/views/notice/csPageView.jsp").forward(request, response);
			return;
		}
		
		/* 1. 전송 파일 용량 제한 : 10MB로 제한 */
		int maxSize = 1024*1024*10;
		
		/* 2. 웹 서버 컨테이너 경로 추출 후 파일이 실제 저장 될 경로 지정 */
		String root = request.getSession().getServletContext().getRealPath("/");
	
		String savePath = root + "resources\\uploadFiles\\notice\\oneQuestion\\";
		
		MultipartRequest mRequest
		= new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		String otitle = mRequest.getParameter("title");
		String ocontent = mRequest.getParameter("content");
		//System.out.println(otitle);
		//System.out.println(ocontent);
		
		// 유저~~~
		int ouser = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		One one = new One();
		one.setOuser(ouser);
		one.setOtitle(otitle);
		one.setOcontent(ocontent);
		
		// 파일 한개만 올릴래....넘나 힘들어라....
		if(mRequest.getFilesystemName("file") != null) {
			one.setFile_path("/resources/uploadFiles/notice/oneQuestion/");
			one.setOrigin_file(mRequest.getOriginalFileName("file"));
			one.setChange_file(mRequest.getFilesystemName("file"));
		} 
		// System.out.println(one);
		
		int result = new OneService().insertOne(one);
		// System.out.println(result);
		
		if(result > 0) {
			// 문의내역 목록 재요청
			request.getSession().setAttribute("massage", "게시글이 등록 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/one");
		} else {
			// 실패시 저장 된 사진 삭제
			File fail = new File(savePath + one.getChange_file());
			fail.delete();
			
			request.getSession().setAttribute("msg", "실패9ㅅ9");
			request.getRequestDispatcher("/WEB-INF/views/notice/oneQuestionView.jsp").forward(request, response);
		}
		 
	}

}
