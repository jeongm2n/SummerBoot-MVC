package com.spring.summerboot2.member;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.spring.summerboot2.admin.OrderVO;
import com.spring.summerboot2.restapi.ImportApiController;
import com.spring.summerboot2.shop.ReviewVO;
import com.spring.summerboot2.shop.ShopService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ShopService shopService;
	
	ImportApiController restapi = new ImportApiController();
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() throws Exception {
		return "member/login";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(Model model, @RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		if(id.equals("admin") && pwd.equals("0000")) {
			model.addAttribute("msg", "admin");
			return "admin/main";
		}
		
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
	
	@RequestMapping(value = "/check_pur")
	public ModelAndView check_pur(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		IamportResponse<Payment> api;
		List<OrderVO> orderList;

		String id = (String)session.getAttribute("user_id");
		orderList = memberService.orderList(id);
		List<String> orderNum = memberService.orderNum(id);
		for (int i = 0; i < orderList.size(); i++) {
		    if (i == 0 || !orderList.get(i).getOrder_num().equals(orderList.get(i - 1).getOrder_num()) && orderList.get(i).getStatus() == null) {
		    	api = restapi.paymentLookup(orderList.get(i).getImp_uid());
		        orderList.get(i).setStatus(api.getResponse().getStatus());
		        orderList.get(i).setPaymethod(api.getResponse().getPayMethod());
		    }
		    else {
		    	if(orderList.get(i).getOrder_num().equals(orderList.get(i - 1).getOrder_num())) {
		    		orderList.get(i).setPur_date(null);
		    		orderList.get(i).setStatus(orderList.get(i-1).getStatus());
		    	}
		    	else{
		    		api = restapi.paymentLookup(orderList.get(i).getImp_uid());
		    		orderList.get(i).setPaymethod(api.getResponse().getPayMethod());
		    	}
		    }
		}
		
		mav.addObject("orderNum",orderNum);
		mav.addObject("orderList", orderList);
		mav.setViewName("member/chkMypur");
		return mav;
	}
	
	@RequestMapping(value = "/review/{product_id}/{name}/{img}/{order_num}")
	public ModelAndView review(@PathVariable(value= "product_id") String product_id  ,@PathVariable(value= "name") String name  
			,@PathVariable(value= "img") String img   ,@PathVariable(value= "order_num") String order_num  
			,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("product_id", product_id);
		mav.addObject("name", name);
		mav.addObject("img", img);
		mav.addObject("order_num",order_num);
		mav.setViewName("member/review");
		return mav;
	}
	
	@RequestMapping(value = "/add_review/{order_num}", method = {RequestMethod.GET, RequestMethod.POST})
	public void add_review(HttpServletRequest request, HttpServletResponse response
			,@RequestParam("product_id") String product_id  ,@RequestParam("rating") int rating
			,@RequestParam("content") String content  ,@RequestParam("img") MultipartFile img
			,@PathVariable(value= "order_num") String order_num  ) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		
		String id =	(String)session.getAttribute("user_id");
		
		if(!img.isEmpty()) {
			String imgFileName = img.getOriginalFilename();
			File saveFile = new File("C:\\JavaProgram\\SummerBoot\\src\\main\\webapp\\resources\\assets\\img", imgFileName);
			img.transferTo(saveFile);
			memberService.Add_review(id, Integer.parseInt(product_id), content, rating, imgFileName);
		}
		else { memberService.Add_review(id, Integer.parseInt(product_id), content, rating, null);}
		
		memberService.After_review(order_num, Integer.parseInt(product_id));
		
		ArrayList<ReviewVO> review = shopService.Load_Review(product_id);
		
		int point = 0;
		for(ReviewVO f_review : review) { point += f_review.getPoint();}
		
		memberService.Update_rating(Integer.parseInt(product_id), point / review.size());
		
	}
	
	@RequestMapping(value = "/update_status", method = RequestMethod.GET)
	public void update_status(
			@RequestParam(value= "status") String status  ,@RequestParam(value= "order_num") String order_num
			,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		memberService.update_status(status, order_num);
	}
	
	@RequestMapping(value = "/vbankcancel/{order_num}")
	public ModelAndView vbankcancel(@PathVariable(value= "order_num") String order_num,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("order_num", order_num);
		mav.setViewName("member/vbankcancel");
		return mav;
	}
	
	@RequestMapping(value = "/requestrefund/{order_num}", method = {RequestMethod.GET, RequestMethod.POST})
	public void requestrefund(
			@PathVariable(value= "order_num") String order_num	,@RequestParam("bank") String bank
			,@RequestParam("name") String name	,@RequestParam("account") String account
			,@RequestParam("tel") String tel ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		memberService.request_refund(order_num, Integer.parseInt(bank), name, account, Integer.parseInt(tel));
		memberService.update_status("취소 요청", order_num);
	}
	
	@RequestMapping(value = "/findID", method = RequestMethod.GET)
	public String findID() {
		return "member/findID";
	}
	
	@RequestMapping(value = "/findID.do", method = RequestMethod.GET)
	public void findIDact(@RequestParam("name") String name, @RequestParam("tel") String tel, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		String findID = memberService.findID(name, tel);
		System.out.println("ID >>>" + findID);
		if(!findID.equals("")) {
			writer.print("'" + name + "'님의 아이디 > '" + findID + "'");
		} else {
			writer.print("WASHBOOT의 회원이 아닙니다");
		}
	}
	
	@RequestMapping(value = "/findPW", method = RequestMethod.GET)
	public String findPW() {
		return "member/findPW";
	}
	
	@RequestMapping(value = "/findPW.do", method = RequestMethod.GET)
	public void findPWact(@RequestParam("id") String id, @RequestParam("name") String name, @RequestParam("tel") String tel, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if(memberService.findPW(id, name, tel)) {
			writer.print("change");
		} else {
			writer.print("해당 아이디가 없습니다");
		}
	}
	
	@RequestMapping(value = "/pwChange", method = RequestMethod.GET)
	public String findPW_Change() {
		return "member/findPWChange";
	}
	
	@RequestMapping(value = "/findPW_update", method = RequestMethod.POST)
	public void pwd_update(@RequestParam("id") String id, @RequestParam("new_pwd") String new_pwd, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("Controller!!!!!!!!!!!!");

		memberService.pwd_change(id, new_pwd);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>window.close();</script>");
	}
}
