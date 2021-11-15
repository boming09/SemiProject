package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.OneService;
import notice.model.vo.One;

/**
 * Servlet implementation class OneQuestionDetailServlet
 */
@WebServlet("/one/detail")
public class OneQuestionDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OneQuestionDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int one_no = Integer.parseInt(request.getParameter("one_no"));
		//System.out.println(one_no);
		// => 몇번 게시물인지?? 확인
		
		One one = new OneService().selectOne(one_no);
		//System.out.println(one);
		
		if(one != null) {
			// 1:1문의 게시글 디테일 페이지 이동
			request.setAttribute("one", one);
			request.getRequestDispatcher("/WEB-INF/views/notice/oneQuestionDetailView.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("massage", "실패^^~~");
			request.getRequestDispatcher("/WEB-INF/views/notice/oneQuestionView.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
