package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.dao.MemberDao;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class IdServlet
 */
@WebServlet("/id")
public class IdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		
		Member member = new Member();
		// int result = MemberService.searchId(userName, userEmail);
		
		if(member != null) {
		// 로그인 화면에서 아이디 찾기 클릭시 단순 이동
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/id.jsp");
		view.forward(request, response);		
		 
		} else {
			request.setAttribute("message", "아이디 찾기에 실패하였습니다.<br> 정보를 다시 확인해 주세요.");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/errorpage.jsp");
			view.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
