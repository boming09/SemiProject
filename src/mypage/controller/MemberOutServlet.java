package mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberOutServlet
 */
@WebServlet("/memberout")
public class MemberOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/mypage/memberout.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		// 변수 저장
		String[] dissatisfactionArr = request.getParameterValues("dissatisfaction");
		String userId = request.getParameter("check_id");
		String userPwd = request.getParameter("check_pw");
		
		String dissatisfaction = "";
		
		if(dissatisfaction != null)
			dissatisfaction = String.join("|", dissatisfaction);
		
		// 비즈니스 로직
		Member member = new MemberService().deleteAccount2(dissatisfaction, userId, userPwd);
		
		// System.out.println("member : " + member);
		
		// view 연결
		if(member != null) {
		
		request.setAttribute("member", member);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/mypage/memberout2.jsp");
		view.forward(request, response);		
		
		} else {
			request.setAttribute("message", "회원탈퇴 정보 확인에 실패 하였습니다.<br> 비밀번호를 다시 확인해 주세요.");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/errorpage.jsp");
			view.forward(request, response);
		}
	}

}
