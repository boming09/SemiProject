package order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import order.model.service.CartService;
import order.model.vo.Cart;
import order.model.vo.OrderDetail;

/**
 * Servlet implementation class paymentServlet
 */
@WebServlet("/payment")
public class paymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public paymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/order/payment.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		int totalamount = Integer.parseInt(request.getParameter("totalamount"));
		
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("totalamount", totalamount);
		request.getRequestDispatcher("/WEB-INF/views/order/payment.jsp").forward(request, response);*/
		//doGet(request, response);
	/*	int bookId = Integer.parseInt(request.getParameter("book_id"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		OrderDetail odt = new OrderDetail();
		
		odt.setBookId(bookId);
		odt.setAmount(amount);
		
		HttpSession session = request.getSession();
		session.setAttribute("OrderInfo", odt); */
		
		//int amount = 
		
		//하..
		//int sum = Integer.parseInt(request.getParameter("sum"));
		//int amounts = Integer.parseInt(request.getParameter("amounts"));
		
		//request.setAttribute("sum", sum);
		//request.setAttribute("amounts", amounts);
		
		/*int bookId = Integer.parseInt(request.getParameter("book_id"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		int cart_no = Integer.parseInt(request.getParameter("cart_no"));
		
		Cart cart = new Cart();
		
		cart.setBook_id(bookId);
		cart.setAmount(amount);
		cart.setCart_no(cart_no);*/
		
	/*	 <input type="hidden" name="book_id" value="${ cart.book_id }">
		 <input type="hidden" name="sale_price" value="${cart.sale_price}">
		 <input type="hidden" name="amount" value=" ${cart.amount}">	
		 <input type="hidden" name="cart_no" value=" ${cart_no}">	*/
		
		/*int cart_no = Integer.parseInt(request.getParameter("cart_no"));
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();

		Cart cart = new Cart();

		cart.setUser_no(userNo);
		cart.setCart_no(cart_no);
		List<Cart> cartList = new CartService().selectList(cart);*/
	
		
		request.getRequestDispatcher("/WEB-INF/views/order/payment.jsp").forward(request, response);
	}

}
