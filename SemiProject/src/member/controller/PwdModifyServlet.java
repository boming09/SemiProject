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
 * Servlet implementation class PwdModifyServlet
 */
@WebServlet(name="PwdModifyServlet", urlPatterns="/pwdModify")
public class PwdModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PwdModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 팝업창 화면 보여주기
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/pwdModifyForm.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userPwd = request.getParameter("userPwd");	// 현재 비밀번호
		String newPwd = request.getParameter("newPwd");		// 변경할 비밀번호
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		Member updatedMember = new MemberService().updatePwd(userNo, userPwd, newPwd);
				
		if(updatedMember != null) {	         
	         request.setAttribute("result", "success");	         
	         request.getSession().setAttribute("loginUser", updatedMember);
	      } else {
	         request.setAttribute("result", "fail");
	      }
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/pwdModifyForm.jsp");
		view.forward(request, response);	
		
	}

}
