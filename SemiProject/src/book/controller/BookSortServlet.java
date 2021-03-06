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
 * Servlet implementation class BookSortServlet
 */
@WebServlet("/book/sort")
public class BookSortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSortServlet() {
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
		String sort = request.getParameter("sort");
		Search search = new Search(searchCondition, searchValue, sort);
		
		if(!request.getParameter("category").contentEquals("")) {	// -> if문 통과 시 값 추출
			String category = request.getParameter("category");
			search.setCategory(category);
		}
		
		// System.out.println(search);
		
		Map<String, Object> map = new BookService().selectSortList(page, search);
		List<String> categoryList = new BookService().categoryList(search);
		
		// System.out.println(map.get("bookList"));
		// System.out.println(map.get("pi"));
		
		request.setAttribute("pi", map.get("pi"));
		request.setAttribute("bookList", map.get("bookList"));
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("sort", sort);	// search로 바꿔서 search.sort로 조건문 확인하기
		
		request.getRequestDispatcher("/WEB-INF/views/book/bookListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
