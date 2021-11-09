package writer.controller;

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
import writer.model.service.WriterService;
import writer.model.vo.WProfile;
import writer.model.vo.WriterInfo;

/**
 * Servlet implementation class WMypageUpdateServlet
 */
@WebServlet("/w-mypage/update")
public class WMypageUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WMypageUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		// 작가 회원 정보 가져오기
		int user_no = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		// 로그인 유저 정보 들고오기
		Member writer = new WriterService().selectMember(user_no);
		
		// 프로필사진 + 자기소개 있는지 들고오기
		WProfile wprofile = new WriterService().selectWProfile(user_no);
		//System.out.println(wprofile);
				
		// 회원->작가로 등급 바뀌면 작가 프로필은 아무것도 없다(프로필사진+자기소개)
		// => null
		if(wprofile != null) {
			request.setAttribute("wprofile", wprofile);
		}
		
		request.setAttribute("writer", writer);	
		// 작가회원 마이페이지 수정 페이지 이동
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/writer/wMyPageUpdateView.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* enctype이 multipart/form-data로 전송 되었는지 확인하고 아닐 경우 에러페이지 이동 */
		if(!ServletFileUpload.isMultipartContent(request)) {
			// 잘못된경로면 일단 cs페이지로...
			request.getSession().setAttribute("msg", "잘못된 전송입니다.");
			request.getRequestDispatcher("/WEB-INF/views/writer/wMyPageView.jsp").forward(request, response);
			return;
		}
		
		/* 1. 전송 파일 용량 제한 : 10MB로 제한 */
		int maxSize = 1024*1024*10;
		
		/* 2. 웹 서버 컨테이너 경로 추출 후 파일이 실제 저장 될 경로 지정 */
		String root = request.getSession().getServletContext().getRealPath("/");
		//System.out.println("root : " + root);
		String savePath = root + "resources\\uploadFiles\\writer\\wProfile\\";
		
		/* HttpServletRequest => MultipartRequest 로 변경 */
		MultipartRequest mRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		// 수정할 정보 가져오기
		int user_no = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		String name = mRequest.getParameter("name");
		String phone = mRequest.getParameter("phone");
		String email = mRequest.getParameter("email");
		String[] addressArr = mRequest.getParameterValues("address");
		
		String address= "";
		if(addressArr != null && !addressArr[0].contentEquals("")) {
			address = String.join("|", addressArr);
		}
		
		WriterInfo writerInfo = new WriterInfo();
		writerInfo.setUser_no(user_no);
		writerInfo.setName(name);
		writerInfo.setPhone(phone);
		writerInfo.setEmail(email);
		writerInfo.setAddress(address);
		
		WProfile wprofile = new WProfile();
		// 수정전 파일 이름
		String change_file = mRequest.getParameter("change_file"); 
		
		// 사진 + 자기소개 		
		// 처음으로 프로필과 자기소개 수정했을때(처음에는 정보 없음)
		if(mRequest.getFilesystemName("inprofile") != null && mRequest.getParameter("ingreeting") != null) {
			//System.out.println(mRequest.getFilesystemName("inprofile"));
			//System.out.println(mRequest.getParameter("ingreeting"));
			
			wprofile.setFile_path("/resources/uploadFiles/writer/wProfile/");
			wprofile.setOrigin_file(mRequest.getOriginalFileName("inprofile"));
			wprofile.setChange_file(mRequest.getFilesystemName("inprofile"));			
			wprofile.setGreeting(mRequest.getParameter("ingreeting"));
			wprofile.setWriter_no(user_no);
			
			// 처음 수정하는거니깐 insert 실행
			int inResult = new WriterService().insertWProfile(wprofile);
			// System.out.println(result);	
		}
		
		// 여기는 수정(update)
		if(mRequest.getFilesystemName("upprofile") != null) {
			// 이건 바꿨는데 또 바꾸는거 = update
			wprofile.setFile_path("/resources/uploadFiles/writer/wProfile/");
			wprofile.setOrigin_file(mRequest.getOriginalFileName("upprofile"));
			wprofile.setChange_file(mRequest.getFilesystemName("upprofile"));
			
			// null이 아니면 파일 수정했다는 소리 => 수정전 파일이름 delete에 담아두기
			wprofile.setDelete_file(change_file);
		}

		wprofile.setGreeting(mRequest.getParameter("upgreeting"));
		wprofile.setWriter_no(user_no);  
		// 프로필 정보 info 에 담기
		writerInfo.setWprofile(wprofile);
		
		
		// 정보 업데이트 하기
		int result = new WriterService().updateWriterInfo(writerInfo);
		
		if(result > 0) {
			// 수정 성공시 덮어쓰기 된 사진 삭제
			if(wprofile.getDelete_file() != null) {
				File deletedFile = new File(savePath + wprofile.getDelete_file());
				deletedFile.delete();
			}
			// 회원정보 페이지로 이동...왜 갑자기 안돼???
			//request.getSession().setAttribute("msg", "수정 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/w-mypage");
		} else {
			// 수정 실패시 첨부된 파일 삭제
			File failedFile = new File(savePath + wprofile.getDelete_file());
			failedFile.delete();
			
			//request.setAttribute("msg", "실패9ㅅ9");
			request.getRequestDispatcher("/WEB-INF/views/writer/wMyBookView.jsp").forward(request, response);
		}
		
	}

}
