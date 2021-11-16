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
import mypage.model.service.B_ReviewService;
import mypage.model.vo.B_Review;
import writer.model.service.WriterService;

/**
 * Servlet implementation class MemberInformationServlet
 */
@WebServlet("/memberinformationdetail")
public class MemberInformationDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInformationDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int user_no = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		Member member = new MemberService().selectMember(user_no);
		Member member2 = new MemberService().selectMember2(user_no);
		
		// 마이페이지의 회원정보수정 클릭 시 회원정보수정 으로 단순 이동
		// request.setAttribute("member", member);
		
		request.setAttribute("member2", member2);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/mypage/memberinformationDetail.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
