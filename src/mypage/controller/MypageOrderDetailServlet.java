package mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.model.service.MyOrderService;
import mypage.model.vo.MyOrder;

/**
 * Servlet implementation class MypageOrderDetailServlet
 */
@WebServlet("/myorder/detail")
public class MypageOrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageOrderDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 주문번호 가져오기
		int order_no = Integer.parseInt(request.getParameter("order_no"));
		
		// 주문내역 상세페이지
		MyOrder myorder = new MyOrderService().selectMyOrder(order_no);
		
		request.setAttribute("myorder", myorder);
		// 디테일 뷰 페이지 이동
		request.getRequestDispatcher("/WEB-INF/views/mypage/mypage-orderDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
