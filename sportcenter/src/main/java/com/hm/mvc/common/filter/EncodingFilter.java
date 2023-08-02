package com.hm.mvc.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/*
 * 서블릿 필터
 *   - request, response가 서블릿에 도달하기 전에 필요한 전/후 처리 작업을 실행한다.
 *   - FilterChain을 통해서 여러 개의 필터를 연속적으로 사용이 가능하다.
 */
@WebFilter(filterName = "encodingFilter", urlPatterns = { "/*" })
public class EncodingFilter implements Filter {
       
    public EncodingFilter() {
    }
    
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("인코딩 필터가 생성되어 초기화 진행");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("서블릿 동작 전 실행");
		
		request.setCharacterEncoding("UTF-8");
		
		// 다음 필터를 호출하거나, 마지막 필터면 서블릿을 호출한다.
		chain.doFilter(request, response);		
		
		System.out.println("서블릿 동작 후 실행");
	}


	public void destroy() {
		System.out.println("인코딩 필터가 소멸됨");
	}

}
