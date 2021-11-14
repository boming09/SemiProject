package order.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import order.model.service.CartService;
import order.model.vo.Order;

/**
 * Servlet implementation class orderCompleteServlet
 */
@WebServlet("/order/complete")
public class orderCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderCompleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//결제수단
		String pay = request.getParameter("pay");
		
		HttpSession session = request.getSession();
		session.setAttribute("pay", pay);
		
		//주문 테이블에 insert
		String orderEmail = (String)session.getAttribute("orderEmail");
		String postCode = (String)session.getAttribute("postCode");
		String orderName = (String)session.getAttribute("orderName");
		String orderAddr = (String)session.getAttribute("orderAddr"); //배송지
		String orderPhone = (String)session.getAttribute("orderPhone"); //연락처
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();

		/*Order order = new Order();
		order.setAddress(orderAddr);
		order.setPhone(orderPhone);
		order.setUser_no(userNo);*/
		
		//오더디테일을 넣어야..
		//여러 정보를 한번에 삽입하려면 서비스 롲ㄱ에다가
		Order order = (Order)session.getAttribute("order");
		//결제수단 더하기
		order.setPayment(pay);
		
		int result = new CartService().insertFinalOrder(order);
	
		//인서트 한 결과  다시 불러와서 오더컴플릿 페이지에 뿌려야함 
		// 같은 서비스에 안해도 되겠지
		Order updOrder = new CartService().selectUpOrder(userNo);
		
		
		if(result > 0) {
	
			request.setAttribute("upOrder", updOrder);
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/order/order_complete.jsp"); //여기
			view.forward(request, response);
			//System.out.println(pay);
			System.out.println(order);

		} else {

			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/order/order_complete.jsp"); //여기
			view.forward(request, response);
		}
		
		
		
		//RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/order/order_complete.jsp");
		//view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
