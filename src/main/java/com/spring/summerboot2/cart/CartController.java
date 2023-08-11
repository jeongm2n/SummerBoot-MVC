package com.spring.summerboot2.cart;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/cart")
public class CartController {
		
	@Autowired
	CartService cartService;
	
	@RequestMapping(value = "/my_cart", method = RequestMethod.GET)
	public ModelAndView cart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		  
		List<CartVO> my_cart;
		my_cart = cartService.my_cart(user_id);
		System.out.println("Controller!!!!!!!!!!!!");
		request.setAttribute("my_cart", my_cart);
		  
		ModelAndView mav = new ModelAndView();
		mav.addObject(my_cart);
		mav.setViewName("member/cart");
			  
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/quantity", method = RequestMethod.POST)
	public void update_quantity(@RequestParam("p_id") int p_id, @RequestParam("quantity") int quantity, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		  
		System.out.println("update!!!!!!!!!!!!");
		System.out.println(user_id);
		System.out.println(p_id);
		System.out.println(quantity);
		cartService.update_Quan(user_id, p_id, quantity);
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String update_quantity(@RequestParam("p_id") int p_id, HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		  
		System.out.println("delete!!!!!!!!!!!!");
		System.out.println(p_id);
		cartService.delete(user_id, p_id);
		List<CartVO> my_cart = cartService.my_cart(user_id);
		 
		model.addAttribute("my_cart", my_cart); 
		return "";
	}
	
	
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	public ModelAndView check(@RequestParam Map<String, String> cart, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("order", cart);
		mav.setViewName("member/check");
		
		return mav;
	}
}
