package book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.service.BookService;

/**
 * Servlet implementation class ReplyDeleteServlet
 */
@WebServlet("/reply/delete")
public class ReplyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rid = Integer.parseInt(request.getParameter("rid"));
		int bid = Integer.parseInt(request.getParameter("bid"));
		
		System.out.println(rid);
		System.out.println(bid);
		int result = new BookService().deleteReply(rid);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/book/detail?bid=" + bid + "#review");
		} else {
			request.setAttribute("message", "댓글 삭제에 실패하였습니다.");
			request.getRequestDispatcher("/WEB-INF/book/detail?bid=" + bid).forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
