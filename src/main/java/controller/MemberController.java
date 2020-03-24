package controller;

import java.io.FileOutputStream;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import exception.DuplicateldException;
import exception.LoginFailException;
import model.Follow;
import model.Member;
import model.User;
import service.MybatisMemberDao;
import util.JdbcUtil;

@Controller
@RequestMapping("/member/")
public class MemberController {
	@Autowired
	MybatisMemberDao dbPro;

	/*public void initProcess(HttpServletRequest request,
            HttpServletResponse response)
    {   }*/    
    
    @RequestMapping(value = "join", method = RequestMethod.GET)
    public String member_joinForm() throws Exception
    {
        return "member/joinForm";
    }
    
    @RequestMapping(value = "join", method = RequestMethod.POST)
    public String member_joinPro(Member newMember, Model m) throws Exception
    {  
       System.out.println(newMember);
       
       newMember.setProfile("profile.png");
        Map<String, Boolean> errors = new HashMap<>();
         m.addAttribute("errors", errors);
         
         newMember.vaildate(errors);
         
         if (!errors.isEmpty()) return "member/joinForm";
         Connection conn = null;
         try
         {            
            Member member = dbPro.selectById(newMember.getEmail());
        if (member != null)
        {
            JdbcUtil.rollback(conn);
            throw new DuplicateldException();
        }
        dbPro.insert(newMember);
        
      
         }catch (DuplicateldException e)
         {
             errors.put("duplicateId", Boolean.TRUE);
             return "member/joinForm";
         }
            return "member/loginForm";
            
        }
      
    @RequestMapping(value = "login")
    public String member_loginForm() throws Exception
    {
        return "member/loginForm";
    }
    
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String member_loginPro(HttpServletRequest req,String email,String passwd) throws Exception
    {
       HttpSession session = req.getSession();
 
        Member member=null;
        
        Map<String, Boolean> errors = new HashMap<>();
        req.setAttribute("errors", errors);
        
        if (email == null || email.isEmpty()) errors.put("email", Boolean.TRUE);
        if (passwd == null || passwd.isEmpty())
            errors.put("password", Boolean.TRUE);
        
        if (!errors.isEmpty()) 
            return "member/loginForm";
        
        try
        {           
            member = dbPro.selectById(email);
            if (member == null) throw new LoginFailException();
            if (!member.matchPassword(passwd)) throw new LoginFailException();
            
            User user = new User(member.getEmail(), member.getName());
            req.getSession().setAttribute("authUser", user);
            
        }
        catch (LoginFailException e)
        {
            errors.put("idOrPwNotMatch", Boolean.TRUE);
            return "member/loginForm";
        }
        
        session.setAttribute("memNum", member.getMemNum());
        req.setAttribute("memNum", session.getAttribute("memNum"));
        
        return "redirect:/main";
    }
    
    private String trim(String str)
    {
        return str == null ? null : str.trim();
    }
    
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String member_logout(HttpServletRequest req, HttpServletResponse res)
            throws Exception
    {
        HttpSession session = req.getSession(false);
        if (session != null)
        {
            session.invalidate();
        }
        return "redirect:/main";
    }

	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage(HttpServletRequest request, int memNum, Model m) throws Exception {
		HttpSession session = request.getSession();
		
		int loginNum = 0;

		if (session.getAttribute("memNum") == null) {
			session.setAttribute("memNum", 0);
			loginNum = (int) session.getAttribute("memNum");
		} else {
			loginNum = (int) session.getAttribute("memNum");
		}

		Member member = dbPro.getMember(memNum);
		int checkFollow = dbPro.checkFollow(loginNum, memNum);
		int followCount = dbPro.followCount(memNum);
		int followerCount = dbPro.followerCount(memNum);
		List<Member> followList = dbPro.followList(memNum);

		m.addAttribute("loginNum", loginNum);

		m.addAttribute("member", member);
		m.addAttribute("checkFollow", checkFollow);
		m.addAttribute("followCount", followCount);
		m.addAttribute("followerCount", followerCount);
		m.addAttribute("followList", followList);

		return "mypage/mypage";
	}

	@RequestMapping(value = "modifyForm", method = RequestMethod.GET)
	public String modifyForm(int memNum, Model m) throws Exception {
		Member member = dbPro.getMember(memNum);
		m.addAttribute("member", member);

		return "member/modifyForm";
	}
	
	@RequestMapping(value = "modifyPro", method = RequestMethod.POST)
	public String modifyPro(MultipartHttpServletRequest multipart, Member member, Model m) throws Exception {
		MultipartFile multi=multipart.getFile("uploadfile");
		
		String filename=multi.getOriginalFilename();
		if(filename!=null && !filename.equals("")){
			String uploadPath=multipart.getRealPath("/")+"/uploadFile";
			System.out.println(uploadPath);
			
			FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(uploadPath+"/"+member.getMemNum()+multi.getOriginalFilename()));
			
			member.setProfile(member.getMemNum()+filename);;
		}else{
			member.setProfile(member.getProfile());
			
		}
		int check = dbPro.updateMember(member);
		m.addAttribute("check", check);
		
		return "member/modifyPro";
	}
	 

	@RequestMapping(value = "follow", method = RequestMethod.GET)
	public String follow(HttpServletRequest request, int memNum, Model m) throws Exception {
		HttpSession session = request.getSession();
		int loginNum = (int) session.getAttribute("memNum");

		Follow follow = new Follow();
		follow.setMemNum(loginNum);
		follow.setFollowNum(memNum);

		int check = dbPro.insertFollow(follow);
		m.addAttribute("check", check);
		m.addAttribute("memNum", memNum);

		return "mypage/follow";
	}

	@RequestMapping(value = "unFollow", method = RequestMethod.GET)
	public String unFollow(HttpServletRequest request, int memNum, Model m) throws Exception {
		HttpSession session = request.getSession();
		int loginNum = (int) session.getAttribute("memNum");

		Follow follow = new Follow();
		follow.setMemNum(loginNum);
		follow.setFollowNum(memNum);

		dbPro.unFollow(follow);
		m.addAttribute("memNum", memNum);

		return "mypage/unFollow";
	}

}