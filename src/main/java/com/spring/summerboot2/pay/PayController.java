package com.spring.summerboot2.pay;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/pay")
public class PayController {

	@RequestMapping(value = "/inform", method = RequestMethod.GET)
	public String inform() {
		return "pay/inform";
	}
	
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String payment() {
		return "pay/payment";
	}
	
}
