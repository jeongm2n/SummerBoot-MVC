package com.spring.summerboot2;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.summerboot2.branch.WashlistService;
import com.spring.summerboot2.branch.WashlistVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	WashlistService washlistService;
	
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView home() {
    	List<WashlistVO> washList;
    	washList = washlistService.washList();
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("washList", washList);
		mav.setViewName("home");
    	
		return mav;
    }
    
}
