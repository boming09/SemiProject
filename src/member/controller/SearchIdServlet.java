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
 * Servlet implementation class SearchIdServlet
 */
@WebServlet("/searchid")
public class SearchIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 팝업창 화면 보여주기
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/searchIdForm.jsp");
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		
		Member member = new MemberService().searchId(userName, userEmail);
		
		if(member != null) {
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/searchIdForm.jsp");
		view.forward(request, response);		
		 
		} else {
			request.setAttribute("message", "아이디 찾기에 실패하였습니다.<br> 정보를 다시 확인해 주세요.");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/errorpage.jsp");
			view.forward(request, response);
		}
	}

}
