package mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import mypage.model.service.B_ReviewService;
import mypage.model.service.MyreviewService;
import mypage.model.vo.B_Review;
import mypage.model.vo.Myreview;

/**
 * Servlet implementation class MypageMyReviewInsertViewServlet
 */
@WebServlet("/myreviewinsertview")
public class MypageMyReviewInsertViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMyReviewInsertViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/mypage/Mypage-MyReview-InsertView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		int book_id = Integer.parseInt(request.getParameter("category"));
		String content = request.getParameter("content");
		int rating = Integer.parseInt(request.getParameter("rating"));
		int user_no = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
				
		
		B_Review b_review = new B_Review();
		b_review.setBook_id(book_id);
		b_review.setUser_no(user_no);
		b_review.setContent(content);
		b_review.setRating(rating);
		b_review.setRef_no(1);
		
		int result = new B_ReviewService().insertBoard(b_review);
		
		if(result > 0) {
		/* 성공 시 "게시글 등록이 완료 되었습니다" alert 후 게시글 목록으로 */
			request.getSession().setAttribute("message", "게시글  등록이 완료 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/mypagemyreview");
		} else {
		/* 실패 시 "게시글 등록에 실패하였습니다" message 설정하여 에러 페이지로 */
			request.setAttribute("message", "게시글 등록에 실패하였습니다.");
			request.getRequestDispatcher("/WEB-INF/views/member/errorpage.jsp").forward(request, response);
		}
	}

}
