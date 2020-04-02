package controller;

import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import model.Category;
import model.Ingredient;
import model.Rcp;
import model.RcpContent;
import service.MybatisRcpDaoMysql;

@Controller
@RequestMapping("/rcp/")
public class RcpController {
	
	@Autowired
	MybatisRcpDaoMysql dbPro;

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String rcp_list() throws Exception {

		return "rcp/list";
	}

	@RequestMapping(value = "writeForm", method = RequestMethod.GET)
	public String rcp_writeForm(Model m) throws Exception {
		List<Category> category = null;
		
		category = dbPro.getCategory();
		
		m.addAttribute("category", category);
		
		return "rcp/writeForm";
	}

	@RequestMapping(value = "writePro", method = RequestMethod.POST)
	public String rcp_writePro(MultipartHttpServletRequest multipart,Rcp rcp,RcpContent rcpContent,String[] cateNum) throws Exception {		
		HttpSession session = multipart.getSession();	
	    int memNum=(int) session.getAttribute("memNum");
	    rcp.setMemnum(memNum);	   
	   
	    MultipartFile multi=multipart.getFile("thumbNail");		
	    String filename=multi.getOriginalFilename();
	    if(filename!=null && !filename.equals("")){
		   String uploadPath=multipart.getRealPath("/")+"/uploadRcpFile";			
		   FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(uploadPath+"/"+multi.getOriginalFilename()));
		   rcp.setThumbnail(filename);
	    }else{
		   rcp.setThumbnail("");	
	    }
	    
	    Ingredient ingre=new Ingredient();
	    int x = 1;
		while (multipart.getParameter("ingredient" + x) != null) {
			x++;
		}
		for(int i=1;i<x;i++){
			ingre.setIngredient(multipart.getParameter("ingredient" + i));
			ingre.setQuantity(multipart.getParameter("quantity" + i));
			dbPro.insertIngredient(ingre);
		}
		
		int y = 1;
		while (multipart.getParameter("step" + y) != null) {
			y++;
		}
		for(int i=1;i<y;i++){
			rcpContent.setStep(Integer.parseInt(multipart.getParameter("step"+i)));
			
			MultipartFile multi2=multipart.getFile("rcpFile"+i);		
		    String filename2=multi2.getOriginalFilename();
		    if(filename2!=null && !filename2.equals("")){
			   String uploadPath=multipart.getRealPath("/")+"/uploadRcpContentFile";			
			   FileCopyUtils.copy(multi2.getInputStream(), new FileOutputStream(uploadPath+"/"+multi2.getOriginalFilename()));
			   rcpContent.setFileName(filename2);
		    }else{
			   rcpContent.setFileName("");	
		    }
		    
			rcpContent.setContent(multipart.getParameter("content" + i));
			dbPro.insertRcpContent(rcpContent);
		}
		
		String categories = "";
	
		for(int i=0;i<cateNum.length;i++){			
			categories+="/"+cateNum[i];
		}
		
		rcp.setCategory(categories);
		
	    dbPro.insertRcp(rcp);
		
	    return "redirect:/member/mypage?memNum="+memNum;
	    /*return "redirect:/main";*/
	}

}
