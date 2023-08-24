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
	public ModelAndView my_info(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<InquiryVO> inquiry;
		inquiry = adminService.inquiryList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("inquiry", inquiry);
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
		
		mav.addObject("q_no", q_no);
		mav.setViewName("admin/inquiryAnswer");
		
		return mav;
	}
	
	@RequestMapping(value = "/registAnswer", method = RequestMethod.POST)
	public ModelAndView registAnswer(@RequestParam Map<String, String> regist, HttpServletResponse response) throws Exception {
		int q_no = Integer.parseInt(regist.get("q_no"));
		String answer = regist.get("answer");
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
