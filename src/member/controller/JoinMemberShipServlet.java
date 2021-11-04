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
 * Servlet implementation class JoinMemberShipServlet
 */
@WebServlet("/joinmembership")
public class JoinMemberShipServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinMemberShipServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 메뉴바의 회원가입 클릭 시 회원가입 페이지로 단순 이동
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/joinmembership.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 정보 입력 후 회원 가입 버튼을 눌렀을 때
		// 요청을 통해 넘어온 DB에 Insert 후 응답 화면
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String userPhone = request.getParameter("phone");
		String userEmail = request.getParameter("email");
		String[] addressArr = request.getParameterValues("address");
		
		String address = "";
					
		if(addressArr != null && !addressArr[0].equals(""))
			address = String.join("|", addressArr);
					
		Member member = new Member(userId, userPwd, userName, userPhone, userEmail, address);
		
		int result = new MemberService().insertMember(member);
	}

}
