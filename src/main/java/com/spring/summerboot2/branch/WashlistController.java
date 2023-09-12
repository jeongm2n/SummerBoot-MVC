package com.spring.summerboot2.branch;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/branch")
public class WashlistController {
	
	@Autowired
	WashlistService washlistService;

    @RequestMapping(value="/list", method= RequestMethod.GET)
    public ModelAndView washList(HttpServletRequest request) {
    	List<WashlistVO> washList;
    	washList = washlistService.washList();
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("washList", washList);
		mav.setViewName("washList");
    	
		return mav;
    }

    @RequestMapping(value = "/map", method = RequestMethod.GET)
    public ModelAndView map(@RequestParam("store") String store) {
    	List<WashlistVO> washList;
    	washList = washlistService.washList();
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("washList", washList);
    	mav.addObject("store", store);
    	mav.setViewName("map");
		return mav;
    }
}
