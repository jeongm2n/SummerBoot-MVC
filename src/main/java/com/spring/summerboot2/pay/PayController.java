package com.spring.summerboot2.pay;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	@Autowired
	private PayService payService;

	
	@RequestMapping(value = "/inform", method = RequestMethod.GET)
	public ModelAndView inform(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		InformVO inform = null;
		boolean p_view;
		if(session.getAttribute("user_id") == null) {
			p_view = false;
			if(session.getAttribute("Inform") == null) { }	
			else { inform = (InformVO)session.getAttribute("Inform");}
		}
		else {
			p_view = true;
			String user_id = (String)session.getAttribute("user_id");
			if(session.getAttribute("Inform") == null) { inform = payService.Load_Inform(user_id, inform);}	
			else {
				inform = (InformVO)session.getAttribute("Inform");
				inform = payService.Load_Inform(user_id, inform);
			}
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("p_view",p_view);
		mav.addObject("inform",inform);
		mav.setViewName("pay/inform");
		return mav;
	}

	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public ModelAndView payment(@RequestParam Map<String, String> inform, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		
		String tel = inform.get("tel");
		String snssts = inform.get("snssts");
		String state = inform.get("state");
		String name = inform.get("name");
		String postcode = inform.get("postcode");
		String city = inform.get("city");
		String town = inform.get("town");
		String street_add = inform.get("street_add");
		String option_add = inform.get("option_add");
		String save_add = inform.get("save_add");
		
		String[] C_Inform = payService.Make_Inform(inform);		
		
		InformVO s_inform = new InformVO(tel, name, postcode, state, city, town, street_add, option_add);
		
		session.setAttribute("Inform", s_inform);
		
		if(session.getAttribute("user_id") == null) {
			
		}
		else {
			String user_id = (String)session.getAttribute("user_id");
			payService.Save_Inform(user_id, inform);
		}
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("C_Inform", C_Inform);
		mav.setViewName("pay/payment");
		return mav;
	}
	
}
