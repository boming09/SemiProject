package book.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.service.BookService;
import book.model.vo.Search;

/**
 * Servlet implementation class BookListServlet
 */
@WebServlet("/book/list")
public class BookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 기본 1page부터 시작
		int page = 1;
		// 페이지 전환 시 전달 받은 페이지가 있다면 해당 page 적용
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String searchCondition = request.getParameter("searchCondition");
		String searchValue = request.getParameter("searchValue");
		Search search = new Search(searchCondition, searchValue);
		
		Map<String, Object> map = new BookService().selectList(page, search);
		List<String> categoryList = new BookService().categoryList(search);
		
		request.setAttribute("pi", map.get("pi"));
		request.setAttribute("bookList", map.get("bookList"));
		request.setAttribute("categoryList", categoryList);
		
		// System.out.println(!((List) map.get("bookList")).isEmpty());
		// System.out.println(categoryList);
		
		if(!((List) map.get("bookList")).isEmpty()) {
			request.getRequestDispatcher("/WEB-INF/views/book/bookListView.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("message", "일치하는 도서가 없습니다");
			response.sendRedirect(request.getContextPath());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
