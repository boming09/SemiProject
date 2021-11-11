package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.OneService;

/**
 * Servlet implementation class AdminOneReply
 */
@WebServlet(name = "AdminOneReplyServlet", urlPatterns = { "/admin/onereply" })
public class AdminOneReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOneReply() {
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
		int oNo = Integer.parseInt(request.getParameter("oNo"));
		String reply = request.getParameter("reply");
		
		int result = new OneService(). adminOneReply(oNo, reply);
		if(result > 0) {
			request.getSession().setAttribute("message", "등록 성공");
			response.sendRedirect(request.getContextPath() + "/one/detail?one_no="+oNo);
		} else {
			request.getSession().setAttribute("message", "등록 실패");
			response.sendRedirect(request.getContextPath() + "/one/detail?one_no="+oNo);
		}
		
		
	}

}
