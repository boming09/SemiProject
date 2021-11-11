package notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.CommuService;

/**
 * Servlet implementation class CommuDeleteServlet
 */
@WebServlet("/commu/delete")
public class CommuDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommuDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 번호 가져오기
		int commu_no = Integer.parseInt(request.getParameter("commu_no"));
		
		int result = new CommuService().deleteCommu(commu_no);
		

		if(result > 0) {
			request.getSession().setAttribute("msg", "게시글이 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/commu");
		} else {
			request.getSession().setAttribute("msg", "실패9ㅅ9");
			request.getRequestDispatcher("/WEB-INF/views/notice/commuView.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
