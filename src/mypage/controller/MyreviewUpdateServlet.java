package mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.model.service.B_ReviewService;
import mypage.model.service.MyreviewService;
import mypage.model.vo.B_Review;

/**
 * Servlet implementation class MyreviewUpdateServlet
 */
@WebServlet("/myreview/update")
public class MyreviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyreviewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		String content = request.getParameter("ontent");
		
				
		B_Review b_review = new B_Review();
		b_review.setReview_no(review_no);
		b_review.setBook_id(book_id);
		b_review.setContent(content);
		
		int result = new B_ReviewService().updateB_Review(b_review);
		
		if(result > 0) {	
			request.getSession().setAttribute("message", "게시글 수정이 완료 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/mypagemyreviewdetail?review_no=" + review_no);
		} else {		
			request.setAttribute("message", "게시글 수정에 실패하였습니다.");
			request.getRequestDispatcher("/WEB-INF/views/member/errorpage.jsp").forward(request, response);
		}
		
	}

}
