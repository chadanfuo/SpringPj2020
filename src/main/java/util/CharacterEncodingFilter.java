package util;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;


public class CharacterEncodingFilter implements Filter {
   
   private String encoding;
   
   public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
      req.setCharacterEncoding(encoding);
      chain.doFilter(req, res);
   }
   public void init(FilterConfig Config) throws ServletException {
      encoding =Config.getInitParameter("encoding");
      if(encoding ==null){
         encoding="UTF-8";
      }
   }
   
   public void destroy() {

   }


}