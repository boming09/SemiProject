package writer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import writer.model.service.WriterService;

/**
 * Servlet implementation class WMypageDeleteServlet
 */
@WebServlet("/w-mypage/delete")
public class WMypageDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WMypageDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 탈퇴할 유저 가져오기
		int user_no = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		//System.out.println(user_no);
		
		int result = new WriterService().deleteInfo(user_no);
		
		if(result > 0) {
			// 로그인 세션 정보 삭제
			request.getSession().removeAttribute("loginUser");
			
			request.getSession().setAttribute("massage", "회원 탈퇴가 완료 되었습니다.");
			// 메인 화면으로 이동 (서버 재요청-redirect)
			response.sendRedirect(request.getContextPath());
		} else {
			/* 실패한 경우 "회원 탈퇴에 실패하였습니다" 메세지 가지고 에러 페이지로 이동 */
			request.getSession().setAttribute("massage", "실패9ㅅ9");
			request.getRequestDispatcher("/WEB-INF/views/writer/wMyPageView.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
