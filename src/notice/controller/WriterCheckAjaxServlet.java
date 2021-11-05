package notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import book.model.vo.Book;
import notice.model.service.WCheckService;
import notice.model.vo.SearchB;

/**
 * Servlet implementation class WriterCheckAjaxServlet
 */
@WebServlet("/w-check/ajax")
public class WriterCheckAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriterCheckAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ajax로 넘긴 값
		// 작가인증할때 도서인증 => 도서 검색어
		String type = request.getParameter("type");
		String input = request.getParameter("input");
		//System.out.println(input);
		//System.out.println(type);
		
		// 검색타입/검색어 객체로 넘기기
		List<Book> bookList = new WCheckService().selectBookList(new SearchB(type, input));
		//System.out.println(bookList);
		//request.setAttribute("bookList", bookList);
		
		JSONArray jArr = new JSONArray();
		
		for(Book book : bookList) {
			JSONObject jsonBook = new JSONObject();
			
			jsonBook.put("title", book.getBtitle());
			jsonBook.put("author", book.getAuthor());
			jsonBook.put("bid", book.getBid());
			
			jArr.add(jsonBook);
		}
				
		// 응답 mime type, 문자 인코딩 설정 후 출력 스트림 이용
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jArr);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
