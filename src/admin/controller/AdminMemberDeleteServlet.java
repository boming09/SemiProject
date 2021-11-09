package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class AdminMemberDeleteServlet
 */
@WebServlet("/admin/memberdelete")
public class AdminMemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("mNo"));
		int selectList = Integer.parseInt(request.getParameter("statusa"));
		
		if(selectList == 10) {
			int result = new MemberService().nUpdateMember(userNo);
			
			if(result > 0) {
				request.getSession().setAttribute("message", "변경 성공");
				response.sendRedirect(request.getContextPath() + "/admin/member");
			} else {
				request.getSession().setAttribute("message", "변경 실패");
				response.sendRedirect(request.getContextPath() + "/admin/member");
			}
		} else if(selectList == 20) {
			int result = new MemberService().nDeleteMember(userNo);
			
			if(result > 0) {
				request.getSession().setAttribute("message", "변경 성공");
				response.sendRedirect(request.getContextPath() + "/admin/member");
			} else {
				request.getSession().setAttribute("message", "변경 실패");
				response.sendRedirect(request.getContextPath() + "/admin/member");
			}
		} else if(selectList == 1) {
			response.sendRedirect(request.getContextPath() + "/admin/member");
		}
		
		
		
	}

}
