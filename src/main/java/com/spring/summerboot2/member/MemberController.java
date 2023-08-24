package com.spring.summerboot2.member;

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
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() throws Exception {
		return "member/login";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(Model model, @RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		boolean login = memberService.login(id, pwd);
		
		if(login) {
			HttpSession session = request.getSession();
			session.setAttribute("user_id", id);
			session.removeAttribute("Inform");
			return "home";
		} else {
			model.addAttribute("msg", "아이디와 비밀번호가 일치하지 않습니다.");
			return "member/login";
		}
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm() throws Exception {
		return "member/join";
	}
	
	@RequestMapping(value = "/overlapped.do", method = RequestMethod.POST)
	public void overlapped(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		boolean overlappedID = memberService.overlappedID(id);
		
		if(overlappedID) {
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
		String tel = mem.get("tel1") + "-" + mem.get("tel2") + "-" + mem.get("tel3");
		String email = mem.get("email1") + "@" + mem.get("email2");
		String email_yn = mem.get("email_yn") != null ? mem.get("email_yn") : "N";
		String address = mem.get("zipcode") + "/" + mem.get("road_addr") + "/" + mem.get("rest_addr");
		
		MemberVO vo = new MemberVO(id, pwd, name, tel, email, email_yn, address);
		System.err.println("controller");
		memberService.regist(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) throws Exception {
		request.getSession().invalidate();
//		request.getSession().removeAttribute("user_id");
		return "home";
	}
	
	@RequestMapping(value = "/my_info", method = RequestMethod.GET)
	public ModelAndView my_info(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		
		List<MemberVO> my_info;
		my_info = memberService.my_info(user_id);
		request.setAttribute("my_info", my_info);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject(my_info);
		mav.setViewName("member/my_info");
		
		return mav;
	}
	
	@RequestMapping(value = "/pwd_change", method = RequestMethod.GET)
	public String pwd_change() {
		return "member/pwd_change";
	}
	
	@RequestMapping(value = "/pwd_update", method = RequestMethod.POST)
	public ModelAndView pwd_update(@RequestParam("pwd") String pwd, @RequestParam("new_pwd") String new_pwd, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");

		boolean change = memberService.pwd_change(user_id, pwd, new_pwd);
		
		ModelAndView mav = new ModelAndView();
	
		if(change) {
			mav.addObject("msg", 999);
		} else {
			mav.addObject("msg", 4);
		}
		mav.setViewName("member/pwd_change");
		return mav;
	}
	
	@RequestMapping(value = "/info_update", method = RequestMethod.POST)
	public ModelAndView update(@RequestParam Map<String, String> mem, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		String tel =  mem.get("tel1") + "-" + mem.get("tel2") + "-" + mem.get("tel3");
		String email = mem.get("email1") + "@" + mem.get("email2");
		String email_yn = mem.get("email_yn") != null ? mem.get("email_yn") : "N";
		String address = mem.get("zipcode") + "/" + mem.get("road_addr") + "/" + mem.get("rest_addr");
		boolean change = memberService.update(user_id, tel, address, email, email_yn);
		
		ModelAndView mav = new ModelAndView();
	
		if(change) {
			mav.addObject("msg", 888);
			mav.setViewName("member/my_info");
			
			return mav;
		} else {
			mav.addObject("msg", 4);
			mav.setViewName("member/my_info");
			
			return mav;
		}
		
	}
}
