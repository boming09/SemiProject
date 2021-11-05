package notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.vo.Book;
import notice.model.service.WCheckService;
import notice.model.vo.SearchB;

/**
 * Servlet implementation class WriterCheckInsertServlet
 */
@WebServlet("/w-check/insert")
public class WriterCheckInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriterCheckInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ajax로 넘긴 값
		// 작가인증할때 도서인증 => 도서 검색어
		String input = request.getParameter("input");
		String type = request.getParameter("type");
		//System.out.println(input);
		//System.out.println(type);
		
		List<Book> bookList = new WCheckService().selectBookList(new SearchB(input, type));
		
		
		
		
		
		// 작가인증게시판 글작성 화면 이동
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/notice/writerCheckInsert.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
