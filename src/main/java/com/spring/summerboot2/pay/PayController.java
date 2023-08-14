package com.spring.summerboot2.pay;

import java.io.PrintWriter;
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
		String user_id = (String)session.getAttribute("user_id");
		
		InformVO inform = payService.Load_Inform(user_id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("inform",inform);
		mav.setViewName("pay/inform");
		return mav;
	}
	
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String payment() {
		return "pay/payment";
	}
	
}
