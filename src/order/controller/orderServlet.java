package order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.model.service.CartService;
import order.model.vo.Cart;

/**
 * Servlet implementation class orderServlet
 */
@WebServlet("/order")
public class orderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/order/order.jsp");
		view.forward(request, response);
		
		//order 직접 치고 들어가면 되는데 카트에서 연결이 안됨
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 카트넘버를 일단 받아왔다
		
		// 체크된 카트넘버만 받아와서 주문 상품 정보에 담아야되는데
		//int cart_no = Integer.parseInt(request.getParameter("cart_chk")); // 카트넘버 여러개를 받아와야하는데 배열에 담냐?
		//int[] arr = Integer.parseInt(request.getParameterValues("cart_chk"));
		
		
		
		String[] str = request.getParameterValues("cart_chk");
		
		int[] cartNo = new int[str.length];
		
		for(int i=0; i<str.length; i++) {
			
			cartNo[i] = Integer.parseInt(str[i]);
		}
		
		
		List<Cart> cartOrderList = new CartService().selectOrderList(cartNo);
		
		System.out.println(cartOrderList);
		
		request.setAttribute("cartOrderList", cartOrderList);
		request.getRequestDispatcher("/WEB-INF/views/order/order.jsp").forward(request, response);
		
		
		
		
		
		
		
		/*List<Cart> cartList = new CartService().selectList(cart_no);
		
		request.setAttribute("cartList", cartList);
		request.getRequestDispatcher("/WEB-INF/views/order/order.jsp").forward(request, response);*/
		
		
	}

}
