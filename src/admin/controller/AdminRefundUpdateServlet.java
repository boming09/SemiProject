package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.ChartService;

/**
 * Servlet implementation class AdminRefundUpdateServlet
 */
@WebServlet("/admin/refundupdate")
public class AdminRefundUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRefundUpdateServlet() {
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
		
		int result = new ChartService().refundUpdate(oNo);
		
		if(result > 0) {
			request.getSession().setAttribute("message", "변경");
			response.sendRedirect(request.getContextPath() + "/admin/refund");
		} else {
			request.getSession().setAttribute("message", "실패");
			response.sendRedirect(request.getContextPath() + "/admin/refund");
		}
	}

}
