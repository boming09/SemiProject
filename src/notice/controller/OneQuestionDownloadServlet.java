package notice.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.OneService;
import notice.model.vo.One;

/**
 * Servlet implementation class OneQuestionDownloadServlet
 */
@WebServlet("/one/download")
public class OneQuestionDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OneQuestionDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 찾아오기
		int one_no = Integer.parseInt(request.getParameter("one_no"));
		
		One one = new OneService().selectOne(one_no);
		
		/* 다운로드 하고자 하는 파일 객체 생성 */
		String root = request.getSession().getServletContext().getRealPath("/");
		File downFile = new File(root + one.getFile_path() + one.getChange_file());
		
		/* 파일 한글명 인코딩 처리 */
		String originName = new String(one.getOrigin_file().getBytes("UTF-8"), "ISO-8859-1");
		
		/* Content-Disposition : 파일 다운로드 처리하는 HTTP 헤더
		 * 웹 서버 응답에 이 헤더를 포함하면 그 내용(파일 데이터)을 내려받도록 설정할 수 있음 */
		response.setHeader("Content-Disposition", "attachment; filename=\"" + originName + "\"");
		
		/* 전송할 크기만큼 사용자 컴퓨터에 공간 확보 요청 */
		response.setContentLength((int)downFile.length());
		
		/* 폴더에서 파일을 읽어올 입력 스트림 */
		BufferedInputStream buf = new BufferedInputStream(new FileInputStream(downFile));
		
		/* 클라이언트로 파일을 내보낼 출력 스트림 */
		ServletOutputStream downOut = response.getOutputStream();
		
		/* 폴더에서 파일을 읽어와 클라이언트로 출력 */
		int readBytes = 0;
		while((readBytes = buf.read()) != -1) {
			downOut.write(readBytes);
		}
		
		/* 스트림 닫기 */
		downOut.close();
		buf.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
