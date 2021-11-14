package order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import book.model.vo.Book;
import main.model.vo.Recommend;
import order.model.service.CartService;
import order.model.vo.Cart;

/**
 * Servlet implementation class mainServlet
 */
@WebServlet("/main")
public class mainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//List<Book> rBookList = new CartService().selectBookList();
		Recommend recommend = new CartService().selectBookList();
		System.out.println(recommend);
		
		List<Book> wBookList = recommend.getWBookList();
		List<Book> nBookList = recommend.getNBookList();
		List<Book> pBookList = recommend.getPBookList();
		List<Book> bestList = recommend.getBestList();
		
		//세션에 저장 맞냐고
		//HttpSession session = request.getSession();
		//session.setAttribute("wBookList", wBookList);
		
		request.setAttribute("wBookList", wBookList);
		request.setAttribute("nBookList", nBookList);
		request.setAttribute("pBookList", pBookList);
		request.setAttribute("bestList", bestList);
		
		request.getRequestDispatcher("/WEB-INF/views/main/main.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
