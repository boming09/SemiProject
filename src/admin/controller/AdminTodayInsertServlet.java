package admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import book.model.service.BookService;
import book.model.vo.Book;
import common.MyFileRenamePolicy;

/**
 * Servlet implementation class AdminTodayInsertServlet
 */
@WebServlet("/admin/tinsert")
public class AdminTodayInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTodayInsertServlet() {
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
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.getSession().setAttribute("msg", "잘못된 전송입니다.");
			request.getRequestDispatcher("/WEB-INF/views/adminpage/adminMain.jsp").forward(request, response);
			return;
		}
		
		int maxSize = 1024*1024*10;
		
		String root = request.getSession().getServletContext().getRealPath("/");
	
		String savePath = root + "resources\\uploadFiles\\admin\\bookInsert\\";
		
		MultipartRequest mRequest
		= new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		String btitle = mRequest.getParameter("title");
		int bcategory = Integer.parseInt(mRequest.getParameter("category2"));
		String bauthor = mRequest.getParameter("author");
		String beditor = mRequest.getParameter("editor");
		String bpublisher = mRequest.getParameter("publisher");
		int bprice = Integer.parseInt(mRequest.getParameter("price"));
		int bsalePrice = Integer.parseInt(mRequest.getParameter("salePrice"));
		
		Date bpdate = Date.valueOf(mRequest.getParameter("pdate"));
		
		String bintro = mRequest.getParameter("intro");
		String bauthorIntro = mRequest.getParameter("authorIntro");
		
		String burl = mRequest.getParameter("url");
		
		Book book = new Book();
		book.setBtitle(btitle);
		book.setCid(bcategory);
		book.setAuthor(bauthor);
		book.setEditor(beditor);
		book.setPublisher(bpublisher);
		book.setPrice(bprice);
		book.setSalePrice(bsalePrice);
		book.setPublicationDate(bpdate);
		book.setBintro(bintro);
		book.setAintro(bauthorIntro);
		book.setBurl(burl);
		
		if(mRequest.getFilesystemName("file") != null) {
			book.setBimg(mRequest.getOriginalFileName("file"));
		} 
		
		if(mRequest.getFilesystemName("file2") != null) {
			book.setFilepath(mRequest.getOriginalFileName("file2"));
		}
		
		int result = new BookService().tinsertBook(book);
		
		if(result > 0) {
			request.getSession().setAttribute("message", "책 등록 성공");
			response.sendRedirect(request.getContextPath());
		} else {
			File fail = new File(savePath + book.getBimg());
			File fail2 = new File(savePath + book.getFilepath());
			fail.delete();
			fail2.delete();
			
			request.getSession().setAttribute("message", "책 등록 실패");
			request.getRequestDispatcher("/WEB-INF/views/main.jsp").forward(request, response);
		}
	}

}
