package writer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import writer.model.service.WriterService;
import writer.model.vo.WReview;

/**
 * Servlet implementation class WMyUnreviewInsertServlet
 */
@WebServlet("/w-unreview/insert")
public class WMyUnreviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WMyUnreviewInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 리뷰번호 가져오기
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		
		WReview review = new WriterService().selectReview(review_no);
		
		request.setAttribute("review", review);
		
		// 도서 미답변리뷰 답변작성 페이지 이동
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/writer/wMyUnreviewInsertView.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 필수정보- reviewNo, bookId, userNO, 게시글 번호 가져오기
		int review_no = Integer.parseInt(request.getParameter("review_no"));  // => ref_no 번호이다
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		int user_no = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		// 답변 가져오기
		String reply = request.getParameter("reply");
		//System.out.println(reply);
		
		// 객체에 담아서 가져가기
		WReview newreply = new WReview();
		newreply.setRef_no(review_no);
		newreply.setBook_id(book_id);
		newreply.setUser_no(user_no);
		newreply.setContent(reply);
		
		int result = new WriterService().insertReply(newreply);
		
		if(result > 0) {
			request.getSession().setAttribute("message", "리뷰 답변이 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/w-unreview");
		} else {
			request.getSession().setAttribute("message", "실패9ㅅ9");
			request.getRequestDispatcher("/WEB-INF/views/writer/wMyPageView.jsp").forward(request, response);
		}
		
	}

}
