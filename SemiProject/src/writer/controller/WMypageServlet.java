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
import writer.model.vo.WProfile;
import writer.model.vo.WriterInfo;

/**
 * Servlet implementation class WMypageServlet
 */
@WebServlet("/w-mypage")
public class WMypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WMypageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 작가 회원 정보 가져오기
		int user_no = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		//System.out.println(user_no);
		
		// 로그인 유저 정보 들고오기
		Member writer = new WriterService().selectMember(user_no);
		//System.out.println(writer);
		
		// 프로필사진 + 자기소개 있는지 들고오기
		WProfile wprofile = new WriterService().selectWProfile(user_no);
		//System.out.println(wprofile);
		
		
		// 회원->작가로 등급 바뀌면 작가 프로필은 아무것도 없다(프로필사진+자기소개)
		// => null
		if(wprofile != null) {
			request.setAttribute("wprofile", wprofile);
		}
		
		request.setAttribute("writer", writer);
		// 작가회원 마이페이지
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/writer/wMyPageView.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
