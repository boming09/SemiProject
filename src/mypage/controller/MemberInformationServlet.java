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
 * Servlet implementation class MemberInformationServlet
 */
@WebServlet("/memberinformation")
public class MemberInformationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInformationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 마이페이지의 회원정보수정 클릭 시 회원정보수정 으로 단순 이동
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/mypage/memberinformation.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
				
		// 회원정보 수정에 필요한 값 추출
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		String userName = request.getParameter("userName");
		String userPhone = request.getParameter("phone");
		String userEmail = request.getParameter("email");
		String[] addressArr = request.getParameterValues("address");
		String userNickname = request.getParameter("userNickname");
		
		String address ="";
		
		if(addressArr != null && !addressArr[0].equals("")) {
			address = String.join("|", addressArr);
			
		}
		
		Member member = new Member(userNo, userName, userPhone, userEmail, address, userNickname);
				
		// 비즈니스 로직 수행 (DB update)
		// db update 수정 된 member select > session의 loginUser 값 변경
		Member updatedMember = new MemberService().updateMember(member);
		
		int user_no = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		// 유저 정보 가져오기
		Member member2 = new MemberService().selectMember2(user_no);
		
		request.setAttribute("member2", member2);
		
		// 응답 화면
		if(updatedMember != null) {
			request.getSession().setAttribute("message", "회원 정보 수정이 완료 되었습니다.");
			
			request.getSession().setAttribute("loginUser", updatedMember);
			
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("message", "회원정보 수정에 실패 하였습니다.<br>다시 정보입력을 확인해 주세요.");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/errorpage.jsp");
			view.forward(request, response);
		}
	}

}
