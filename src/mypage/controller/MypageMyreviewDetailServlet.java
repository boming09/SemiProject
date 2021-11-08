package mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.model.service.MyreviewService;
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
		int mid = Integer.parseInt(request.getParameter("mid"));
		MyreviewService myreviewService = new MyreviewService();
				
		Cookie[] cookies = request.getCookies();
		
		String mcount = "";
		
		if(cookies != null && cookies.length > 0) {
			for(Cookie c : cookies) {
				if(c.getName().equals("mcount")) {
					mcount = c.getValue();
				}
			}
		}
		
		if(mcount.indexOf("|" + mid + "|") == -1) {
			Cookie newMcount = new Cookie("mcount", mcount + "|" + mid + "|");
			// newMcount.setMaxAge(1 * 24 * 60 * 60);
			response.addCookie(newMcount);
			
			int result = myreviewService.increaseCount(mid);
			
			if(result > 0) {
				System.out.println("조회수 증가 성공");
			} else {
				System.out.println("조회수 증가 실패");
			}
		}
		
		Myreview myreview = myreviewService.selectMyreview(mid);
		
		if(myreview != null) {
			request.setAttribute("myreview", myreview);
			request.getRequestDispatcher("/WEB-INF/views/mypage/Mypage-MyReview-DetailView.jsp").forward(request, response);
		} else {
			request.setAttribute("message", "게시글 상세 조회에 실패하였습니다.");
			request.getRequestDispatcher("/WEB-INF/views/member/errorpage.jsp").forward(request, response);
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
