package com.spring.summerboot2.admin;

import java.io.PrintWriter;
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

import com.spring.summerboot2.community.InquiryVO;

@Controller
@RequestMapping("/admin/community")
public class AdminCommunityController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value = "/inquiry", method = RequestMethod.GET)
	public ModelAndView my_info(@RequestParam(value="page", defaultValue="1") int page, @RequestParam(value="category", defaultValue="0") String category, @RequestParam(value="searchCon", defaultValue="0") String searchCon, @RequestParam(value="search", defaultValue="none") String search, @RequestParam(value="state", defaultValue="0") String state) throws Exception {
		int start = 0;
		if(page >= 2) {
			start = (page-1)*20;
		}
		
		List<InquiryVO> inquiry;
		inquiry = adminService.inquiryList(start, category, searchCon, search, state);
		
		int count = adminService.inquiryCount(category, searchCon, search, state);
		int pages = 0;
		if(count%20 == 0) {
			pages = (count/20);
		} else {
			pages = (count/20) + 1;
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("inquiry", inquiry);
		mav.addObject("category", category);
		mav.addObject("searchCon", searchCon);
		mav.addObject("search", search);
		mav.addObject("state", state);
		mav.addObject("page", page);
		mav.addObject("count", start);
		mav.addObject("pages", pages);
		
		mav.setViewName("admin/inquiryList");
		
		return mav;
	}
	
	@RequestMapping(value = "/deleteInquiry", method = RequestMethod.POST)
	public void deleteStore(@RequestParam("q_no") int q_no, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		int deleteInquiry = adminService.deleteInquiry(q_no);
		
		if(deleteInquiry == 1) {
			writer.print("delete");
		} else {
			writer.print("fail");
		}
	}
	
	@RequestMapping(value = "/inquiryAnswer", method = RequestMethod.GET)
	public ModelAndView inquiryAnswer(@RequestParam("q_no") int q_no) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> inquiry;
		inquiry = adminService.inquiry(q_no);
		mav.addObject("q_no", q_no);
		mav.addObject("inquiry", inquiry);
		mav.setViewName("admin/inquiryAnswer");
		
		return mav;
	}
	
	@RequestMapping(value = "/registAnswer", method = RequestMethod.POST)
	public ModelAndView registAnswer(@RequestParam("content") String answer, @RequestParam("q_no") int q_no, HttpServletResponse response) throws Exception {
		InquiryVO vo = new InquiryVO(q_no, answer, "답변완료");
		int update = adminService.update(vo);
		
		ModelAndView mav = new ModelAndView();
		
		if(update==1) {
			mav.addObject("msg", 999);
		} else if(update==0){
			mav.addObject("msg", 4);
		}
		mav.setViewName("admin/inquiryAnswer");
		return mav;
	}
}
