package mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.model.service.B_ReviewService;
import mypage.model.service.MyreviewService;
import mypage.model.vo.B_Review;
import mypage.model.vo.Myreview;

/**
 * Servlet implementation class MypageMyreviewDetailServlet
 */
@WebServlet("/mypagemyreviewdetail")
public class MypageMyreviewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMyreviewDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		B_ReviewService b_reviewService = new B_ReviewService();
		
		Cookie[] cookies = request.getCookies();
		
		String bcount = "";
		
		if(cookies != null && cookies.length > 0) {
			for(Cookie c : cookies) {
				if(c.getName().equals("bcount")) {
					bcount = c.getValue();
				}
			}
		}
		
		if(bcount.indexOf("|" + review_no + "|") == -1) {
			/*
			Cookie newBcount = new Cookie("bcount", bcount + "|" + review_no + "|");
			
			// newBCount.setMaxAge(1 * 24 * 60 * 60);
			response.addCookie(newBcount);
			
			int result = b_reviewService.increaseCount(review_no);
			
			if(result > 0) {
				System.out.println("조회수 증가 성공");
			} else {
				System.out.println("조회수 증가 실패");
			}
		
		}
		*/
		// B_ReviewService b_reviewService = new B_ReviewService();
					
		B_Review b_review = b_reviewService.selectB_review(review_no);
		
		if(b_review != null) {
			request.setAttribute("b_review", b_review);
			request.getRequestDispatcher("/WEB-INF/views/mypage/Mypage-MyReview-DetailView.jsp").forward(request, response);
		} else {
			request.setAttribute("message", "게시글 상세 조회에 실패하였습니다.");
			request.getRequestDispatcher("/WEB-INF/views/member/errorpage.jsp").forward(request, response);
		}
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
