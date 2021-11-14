package order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import order.model.service.CartService;
import order.model.vo.Cart;

/**
 * Servlet implementation class cartServlet
 */
@WebServlet("/cart")
public class cartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//db에서 카트 목록 조회해오기
		String orderby = request.getParameter("orderby");
		List<Cart> cartList = new CartService().selectList(orderby);
		//System.out.println(cartList);
		
		//정렬 기준 고정 위해
		request.setAttribute("orderby", orderby);
		
		
		// 셋 어트리뷰트해서 카트 페이지에 해당 db전달
		request.setAttribute("cartList", cartList);
		request.getRequestDispatcher("/WEB-INF/views/order/cart.jsp").forward(request, response);
		//response.sendRedirect(request.getContextPath() + "/cart");
		
		/*RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/order/cart.jsp");
		view.forward(request, response);*/
	
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// input으로 받아온 값을 db에 전달
		int count = Integer.parseInt(request.getParameter("count"));
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();

		Cart cart = new Cart();
		cart.setAmount(count);
		cart.setBook_id(book_id);
		cart.setUser_no(userNo);
		
		int result = new CartService().insertCart(cart);
		
		//System.out.println(result);
		
		if(result > 0) {
			request.getSession().setAttribute("message", "장바구니에 담겼습니다");
			response.sendRedirect(request.getContextPath() + "/cart");
		} else {
			
			request.getRequestDispatcher("/WEB-INF/views/common/errorpage.jsp").forward(request, response);
		}
		
		

		
		
	}

}
