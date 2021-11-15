package notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.CommuService;
import notice.model.vo.Commu;

/**
 * Servlet implementation class CommuUpdateServlet
 */
@WebServlet("/commu/update")
public class CommuUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommuUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 번호 가져오기
		int commu_no = Integer.parseInt(request.getParameter("commu_no"));
		
		Commu commu = new CommuService().selectCommu(commu_no);
		
		request.setAttribute("commu", commu);
		request.getRequestDispatcher("/WEB-INF/views/notice/commuUpdateView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 번호 가져오기
		int commu_no = Integer.parseInt(request.getParameter("commu_no"));
		String title = request.getParameter("newTitle");
		String content = request.getParameter("newContent");
		
		int result = new CommuService().updateCommu(commu_no, title, content);
		
		if(result > 0) {
			request.getSession().setAttribute("massage", "게시글이 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/commu/detail?commu_no=" + commu_no);
		} else {
			request.getSession().setAttribute("massage", "실패9ㅅ9");
			request.getRequestDispatcher("/WEB-INF/views/notice/commuView.jsp").forward(request, response);
		}
		
		
	}

}
