package order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.model.service.CartService;
import order.model.vo.Cart;

/**
 * Servlet implementation class cartUpdateServlet
 */
@WebServlet("/cart/update")
public class cartUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartUpdateServlet() {
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
		
		int cart_no = Integer.parseInt(request.getParameter("cart_no"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		Cart cart = new Cart();
		cart.setCart_no(cart_no);
		cart.setAmount(amount);
		
		int result = new CartService().updateCart(cart);
		
		if(result > 0) {
			request.getSession().setAttribute("message", "수량이 변경되었습니다");
			response.sendRedirect(request.getContextPath() + "/cart");
			
			
		} else {
			request.getSession().setAttribute("message", "수량 변경에 실패하였습니다");
			request.getRequestDispatcher("WEB-INF/views/common/errorpage.jsp").forward(request, response);
		}
		
		
	}

}
