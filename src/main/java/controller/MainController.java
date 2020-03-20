package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Member;
import mybatis.MybatisMemberDao;

@Controller
public class MainController {
	@Autowired 
	MybatisMemberDao dbPro;
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
    public String member_main(HttpServletRequest request, HttpServletResponse res)
            throws Exception
    {
    	HttpSession session = request.getSession();
		
		List<Member> li = null;
		
		int count = dbPro.getProfileCount();
		li = dbPro.getProfile();
		
		request.setAttribute("count", count);
		request.setAttribute("li", li);		
		
		return "main";
    }
}
