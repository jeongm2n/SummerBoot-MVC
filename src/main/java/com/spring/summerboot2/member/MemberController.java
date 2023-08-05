package com.spring.summerboot2.member;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		
		return mav;
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		MemberDAO dao = new MemberDAO();
		ModelAndView mav = new ModelAndView();
		
		if(dao.login(id, pwd)) {
			HttpSession session = request.getSession();
			session.setAttribute("user_id", id);
			mav.setViewName("washList");
			return mav;
		} else {
			mav.setViewName("member/login");
			return mav;
		}
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public ModelAndView joinForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/join");
		
		return mav;
	}
	
	@RequestMapping(value = "/overlapped.do", method = RequestMethod.POST)
	public void overlapped(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		MemberDAO dao = new MemberDAO();
		
		System.out.println("확인!!!!!!!!!!!!!!!");
		
		if(dao.overlappedID(id)) {
			writer.print("not_usable");
		} else {
			writer.print("usable");
		}
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public ModelAndView join(@RequestParam Map<String, String> mem, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String id = mem.get("id");
		String pwd = mem.get("pwd");
		String name = mem.get("name");
		String tel = mem.get("tel1") + mem.get("tel2") + mem.get("tel3");
		
		MemberVO vo = new MemberVO(id, pwd, name, tel);
		MemberDAO dao = new MemberDAO(); 
		dao.join(vo); 

		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		
		return mav;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.getSession().invalidate();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		
		return mav;
	}
	
}
