package book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.service.BookService;
import book.model.vo.Reply;
import member.model.vo.Member;

/**
 * Servlet implementation class ReplyInsertServlet
 */
@WebServlet("/reply/insert")
public class ReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid = Integer.parseInt(request.getParameter("bid"));
		int rstarScore = Integer.parseInt(request.getParameter("rstarScore"));
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		String rcontent = request.getParameter("rcontent");
		
		/* 댓글 */
		Reply reply = new Reply();
		reply.setBid(bid);
		reply.setUserNo(userNo);
		reply.setRcontent(rcontent);
		reply.setStarScore(rstarScore);
		
		/* 도서 평점 계산 */
		int sumScore = Integer.parseInt(request.getParameter("sumScore"));
		int reviewCount = Integer.parseInt(request.getParameter("reviewCount"));
		
		double avgScore = (sumScore + rstarScore) / (double)(reviewCount + 1);
		avgScore = Math.round(avgScore*10)/10.0;
		
		int starScore = (int) Math.floor(avgScore);
		
		if(avgScore > 10.0) {	// 평점 10점 만점
			avgScore = 10.0;
			starScore = 10;
		}
		
		int result = new BookService().insertReply(reply, avgScore, starScore);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/book/detail?bid=" + bid + "#review");
		} else {
			request.setAttribute("message", "댓글 등록에 실패하였습니다");
			request.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(request, response);
		}
		
	}

}
