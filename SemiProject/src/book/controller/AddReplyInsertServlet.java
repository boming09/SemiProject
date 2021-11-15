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
 * Servlet implementation class AddReplyInsertServlet
 */
@WebServlet("/addReply/insert")
public class AddReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddReplyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid = Integer.parseInt(request.getParameter("bid"));
		int refRid = Integer.parseInt(request.getParameter("refRid"));
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		String rcontent = request.getParameter("rcontent");
		
		
		Reply reply = new Reply();
		reply.setBid(bid);
		reply.setRefRid(refRid);
		reply.setUserNo(userNo);
		reply.setRcontent(rcontent);
		
		System.out.println(reply);
		int result = new BookService().insertAddReply(reply);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/book/detail?bid=" + bid + "#review");
		} else {
			request.setAttribute("message", "댓글 등록에 실패하였습니다");
			request.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(request, response);
		}
	}

}
