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
 * Servlet implementation class cartDeleteServlet
 */
@WebServlet("/cart/delete")
public class cartDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 개별 삭제
		
		int cart_no = Integer.parseInt(request.getParameter("cart_no")); 
		
		int result = new CartService().deleteCart(cart_no);
		
		if(result > 0) {
			request.getSession().setAttribute("message", "삭제 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/cart");
			
		} else {
			request.getRequestDispatcher("/WEB-INF/views/common/errorpage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 선택 목록 삭제
		
		String[] str = request.getParameterValues("cart_check"); 
		
		int[] cartNo = new int[str.length];
		
		for(int i=0; i<str.length; i++) {
			
			cartNo[i] = Integer.parseInt(str[i]);
		}
		

		int result = new CartService().deleteCartList(cartNo);
		
		if(result > 0) {
			request.getSession().setAttribute("message", "삭제 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/cart");
			
		} else {
			request.getRequestDispatcher("/WEB-INF/views/common/errorpage.jsp").forward(request, response);
		}
		
		
		
		//List<Cart> cartOrderList = new CartService().deleteList(cartNo);
		
		//System.out.println(cartOrderList);
		
		//HttpSession session = request.getSession();
		//session.setAttribute("cartOrderList", cartOrderList);
		// 위 두 줄 추가 무쓸모
		
		//request.setAttribute("cartOrderList", cartOrderList);
		//request.getRequestDispatcher("/WEB-INF/views/order/order.jsp").forward(request, response);
		
	}

}
