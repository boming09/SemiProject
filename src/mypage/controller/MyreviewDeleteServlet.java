package mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.model.service.B_ReviewService;

/**
 * Servlet implementation class MyreviewDeleteServlet
 */
@WebServlet("/myreview/delete")
public class MyreviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyreviewDeleteServlet() {
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
		
		int result = new B_ReviewService().deleteb_review(review_no);
		
		/* 삭제 성공 시 성공 메세지 alert 후 게시판 목록으로
		 * 삭제 실패 시 실패 메세지 가지고 에러페이지로 */
				
		if(result > 0) {			
			request.getSession().setAttribute("message", "게시글이 삭제 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/mypagemyreview");
		} else {
			request.setAttribute("message", "게시글 삭제에 실패하였습니다.");
			request.getRequestDispatcher("/WEB-INF/views/member/errorpage.jsp").forward(request, response);
		}
	}
	
}
