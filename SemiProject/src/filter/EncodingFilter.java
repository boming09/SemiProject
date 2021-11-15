package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class EncodingFilter
 */
/* 1. 어노테이션을 통한 필터 매핑
 * urlPattern으로 어떤 요청을 처리하기 전에 필터를 거칠 것인지 지정
 * --> /*로 지정하게 되면 모든 요청을 의미함 */
// filter : 요청을 가로채서 설정을 지정

/**
 * Servlet Filter implementation class EncodingFilter
 */
// @WebFilter("/*")
public class EncodingFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncodingFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 컨테이너가 현재 요청에 필터를 적용하겠다 판단 되었을 때 호출 됨
			
		// place your code here -> 필터링을 통해 수행하고자 하는 코드 작성
		// 전송방식이 POST일때 request에 대해서 인코딩 처리함
		HttpServletRequest hrequest = (HttpServletRequest)request;
		if(hrequest.getMethod().equalsIgnoreCase("post")) {
			// System.out.println("post 전송 시에만 encoding 처리함");
			request.setCharacterEncoding("utf-8");
		}		

		// pass the request along the filter chain
		// FilterChain의 doFilter()는 다음 필터를 호출하거나, 마지막 필터라면 서블릿으로 넘어감
		chain.doFilter(request, response); //=> 이 코드는 절대 지우면 안됨!!!
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
