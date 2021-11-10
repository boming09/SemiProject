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
 * Servlet implementation class BookCategoryServlet
 */
@WebServlet("/book/category")
public class BookCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookCategoryServlet() {
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

		Search search = new Search();
		search.setSearchCondition(request.getParameter("searchCondition"));
		search.setSearchValue(request.getParameter("searchValue"));
		search.setCategory(request.getParameter("category"));
		
		Map<String, Object> map = new BookService().selectCategoryBookList(page, search);
		List<String> categoryList = new BookService().categoryList(search);

		request.setAttribute("pi", map.get("pi"));
		request.setAttribute("bookList", map.get("bookList"));
		request.setAttribute("categoryList", categoryList);
		
		
		// System.out.println(map.get("bookList"));
		System.out.println(map.get("pi"));
		
		if(map != null) {
			request.getRequestDispatcher("/WEB-INF/views/book/bookListView.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
