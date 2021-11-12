package mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class AccoutDeleteServlet
 */
@WebServlet("/accountDelete")
public class AccoutDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccoutDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 탈퇴 유저에 대해서 처리할 수 있는 값 추출 */
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		// request에 담긴 값 꺼내서 변수에 저장
		String[] dissatisfactionArr = request.getParameterValues("dissatisfaction");
		
		String dissatisfaction = "";
		
		// 체크박스가 체크 된 경우 문자열 합치기
		if(dissatisfaction != null)
			dissatisfaction = String.join("|", dissatisfactionArr);
		
		Member member = new Member(userNo, dissatisfaction);
		
		int result = new MemberService().deleteAccount(userNo, dissatisfaction);
		
		if(result > 0) {
			request.getSession().removeAttribute("loginUser");	// 로그인 세션 정보 삭제
			request.getSession().setAttribute("message", "회원 탈퇴가 완료 되었습니다.");	// 메뉴바에서 alert
			response.sendRedirect(request.getContextPath());	// 메인 페이지로 이동(서버 재요청)
		}else {
		
		/* 실패한 경우 "회원 탈퇴에 실패하였습니다" 메세지 가지고 에러 페이지로 이동 */
		request.setAttribute("message", "회원 탈퇴에 실패하였습니다.");
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/errorpage.jsp");
		view.forward(request, response);
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
