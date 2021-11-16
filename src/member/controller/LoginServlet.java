package member.controller;

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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 메뉴바의 로그인 클릭 시 로그인 페이지로 단순 이동
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/login.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
			
		System.out.println(userId + " " + userPwd);
		
		Member loginUser = new MemberService().loginMember(userId, userPwd);
			
		System.out.println("loginUser : " + loginUser);
		
		if(loginUser != null) {
			
			HttpSession session = request.getSession();
			
			session.setAttribute("loginUser", loginUser);
						
			session.setMaxInactiveInterval(1200);			
			response.sendRedirect(request.getContextPath() + "/main");
			
		} else {
			// id, pwd 값이 일치하는 유저가 없을 경우 => 로그인에 실패 => errorpage로 forward
			request.setAttribute("message", "로그인에 실패하였습니다.<br> 비밀번호를 다시 확인해 주세요.");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/errorpage.jsp");
			view.forward(request, response);
		}
		
	}

}
