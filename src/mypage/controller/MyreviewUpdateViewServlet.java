package mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.model.service.MyreviewService;
import mypage.model.vo.Myreview;

/**
 * Servlet implementation class MyreviewUpdateViewServlet
 */
@WebServlet("/myreview/updateView")
public class MyreviewUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyreviewUpdateViewServlet() {
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
		int mid = Integer.parseInt(request.getParameter("mid"));
		
		Myreview myreview = new MyreviewService().selectMyreview(mid);
		
		if(myreview != null) {
			request.setAttribute("myreview", myreview);
			request.getRequestDispatcher("/WEB-INF/views/mypage/myreviewUpdateView.jsp").forward(request, response);
		} else {
			request.setAttribute("message", "게시글 수정에 실패하였습니다.");
			request.getRequestDispatcher("/WEB-INF/views/member/errorpage.jsp").forward(request, response);
		}
	}

}
