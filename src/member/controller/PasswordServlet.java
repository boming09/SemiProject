package member.controller;

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
 * Servlet implementation class PasswordServlet
 */
@WebServlet("/password")
public class PasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 화면에서 비밀번호 찾기 클릭시 단순 이동
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/password.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		
		Member member = new MemberService().searchPw(userId, userName, userEmail);
		
		// System.out.println("member : " + member);
		
		if(member != null) {
			request.setAttribute("member", member);
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/password2.jsp");
			view.forward(request, response);
		} else {
			request.setAttribute("message", "비밀번호 찾기에 실패하였습니다.<br>다시 정보입력을 확인해 주세요.");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/errorpage.jsp");
			view.forward(request, response);
		}
	}

}
