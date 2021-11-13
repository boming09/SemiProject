package mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.model.service.MyOrderService;

/**
 * Servlet implementation class MypageOrderPChangeServlet
 */
@WebServlet("/myorder/pChange")
public class MypageOrderPChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageOrderPChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 주문번호 가져오기
		int order_no = Integer.parseInt(request.getParameter("order_no"));
	
		int result = new MyOrderService().changeMyOrder(order_no);
		
		if(result > 0) {
			request.getSession().setAttribute("message", "교환 신청이 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/myorder/change");
		} else {
			request.getSession().setAttribute("message", "실패9ㅅ9");
			request.getRequestDispatcher("/WEB-INF/views/mypage/mypage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
