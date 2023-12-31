package com.spring.summerboot2.community;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired
	CommunityService communityService;
	
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
    public ModelAndView inquiry(@RequestParam(value="page", defaultValue="1") int page, @RequestParam(value="category", defaultValue="0") String category, @RequestParam(value="searchCon", defaultValue="0") String searchCon, @RequestParam(value="search", defaultValue="none") String search, @RequestParam(value="state", defaultValue="0") String state) {
		ModelAndView mav = new ModelAndView();
		int start = 0;
		if(page >= 2) {
			start = (page-1)*10;
		}
		List<InquiryVO> inquiryList;
		inquiryList = communityService.inquiryList(start, category, searchCon, search, state);
		mav.addObject("inquiryList", inquiryList);
		
		int count = communityService.inquiryCount(category, searchCon, search, state);
		int pages = 0;
		if(count%10 == 0) {
			pages = (count/10);
		} else {
			pages = (count/10) + 1;
		}
		
		mav.addObject("category", category);
		mav.addObject("searchCon", searchCon);
		mav.addObject("search", search);
		mav.addObject("state", state);
		mav.addObject("page", page);
		mav.addObject("count", start);
		mav.addObject("pages", pages);
		
		mav.setViewName("community/inquiry");
        return mav;
    }
    
    @RequestMapping(value = "/qnaWrite", method = RequestMethod.GET)
    public String qnaWrite() {
        return "community/qnaWrite";
    }
    
    @RequestMapping(value = "/registInquiry", method = RequestMethod.POST)
	public ModelAndView regist_inquiry(@RequestParam Map<String, String> board, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	response.setContentType("text/html; charset=utf-8");
    	ModelAndView mav = new ModelAndView();
		
		String category = board.get("category");
		String id = (String)request.getSession().getAttribute("user_id");
		String title = board.get("subject");
		String content = board.get("content");
		String secret = board.get("secret") != null ? board.get("secret") : "N";
		String state = "답변대기";
  
		InquiryVO vo = new InquiryVO(id, category, title, content, secret, state);
		  
		boolean regist = communityService.regist_inquiry(vo);
		 
		if(regist) {
			mav.addObject("msg", 888);
		} else {
			mav.addObject("msg", 4);
		}
		mav.setViewName("community/inquiry");
		return mav;
	}
    
    @RequestMapping(value = "/faq", method = RequestMethod.GET)
    public String faq() {
        return "community/FAQ";
    }
    
}
