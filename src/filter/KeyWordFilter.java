package filter;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class KeyWordFilter implements Filter{
	private FilterConfig filterConfig;
	
	public static HashMap keyMap = null;
	public static String path;
	
	
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig=filterConfig;
		String keyWordPath = filterConfig.getInitParameter("key");
		System.out.println(keyWordPath);
		path = filterConfig.getServletContext().getRealPath(keyWordPath);
		
	}
	
	
	public void doFilter(ServletRequest request, ServletResponse response, 
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		System.out.println("aaaaaaa");
		
		if(keyMap == null){
				keyMap = (HashMap)PropertiesUtil.readProperties(path);
		}
		if(req.getMethod().equals("POST")){
			System.out.println(new KeyWordRequestWrapper(req,keyMap));
			chain.doFilter(new KeyWordRequestWrapper(req,keyMap), response);
		}else{
			System.out.println("aaaaaabb");
			chain.doFilter(request, response);
		}
	}

	
	public void destroy() {
		this.filterConfig = null; 
	}

}