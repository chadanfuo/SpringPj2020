package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Rcp;
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
	public String rcp_writeForm() throws Exception {
		return "rcp/writeUploadForm";
	}

	@RequestMapping(value = "writePro", method = RequestMethod.POST)
	public String rcp_writePro(HttpServletRequest request, Rcp rcp) throws Exception {
	   HttpSession session = request.getSession();	
	   int mem=(int) session.getAttribute("memNum");
	   rcp.setMemNum(mem);	
		
	  dbPro.insertRcp(rcp);
		//service.insertRcpContent(rc);
          return "/rcp/writeUploadPro";
		// return "redirect:/rcp/list";
	}

}
