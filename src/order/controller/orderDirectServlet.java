package order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import order.model.service.CartService;
import order.model.vo.Cart;
import order.model.vo.OrderDetail;
import order.model.vo.OrderDirect;

/**
 * Servlet implementation class orderDirectServlet
 */
@WebServlet("/order/direct")
public class orderDirectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderDirectServlet() {
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
		// input으로 받아온 값을 db에 전달
		int count = Integer.parseInt(request.getParameter("count"));
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		//int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();

		/*Cart cart = new Cart();
		cart.setAmount(count);
		cart.setBook_id(book_id);*/ //엥?

		//편의상 카트에 담음
		Cart cart = new CartService().selectAbook(book_id);
		
		// 여기서는 번호 하나를 넘겨ㅓ서 셀렉트 해왔고
		
		System.out.println(cart);

	
		
		//오더 서블릿에서는 cartOrderList 저장한걸 여기는 od에 담아서 화면에 뿌림
		OrderDirect od = new OrderDirect();
		od.setAmount(count);
		od.setBook_name(cart.getBook_name());
		od.setPrice(cart.getPrice());
		od.setSale_price(cart.getSale_price());
		od.setBook_id(book_id);
		
		System.out.println(od);
		
		request.setAttribute("od", od);
		request.getRequestDispatcher("/WEB-INF/views/order/orderDirect.jsp").forward(request, response);
		//response.sendRedirect(request.getContextPath() + "/orderDirect");
		
		
		
		
		
		/*String book_name = request.getParameter("book_name");
		//int price = Integer.parseInt(request.getParameter("price"));
		//int sale_price = Integer.parseInt(request.getParameter("sale_price"));
		int price = Integer.parseInt(request.getParameter("price"));
		int sale_price = Integer.parseInt(request.getParameter("sale_price"));
		int count = Integer.parseInt(request.getParameter("count"));
		
		OrderDirect od = new OrderDirect();
		od.setAmount(count);
		od.setBook_name(book_name);
		od.setPrice(price);
		od.setSale_price(sale_price);
		
		request.setAttribute("od", od);
		request.getRequestDispatcher("/WEB-INF/views/order/orderDirect.jsp").forward(request, response);*/
		
		
	}

}
