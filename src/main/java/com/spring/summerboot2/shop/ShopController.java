package com.spring.summerboot2.shop;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Autowired
	private ShopService shopService;
	
	@RequestMapping(value = "/main/{category},{page},{sort}")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response
			 ,@PathVariable(value= "category") String n_category, @PathVariable(value= "page") int n_page, @PathVariable(value= "sort") int sort) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		ModelAndView mav = new ModelAndView();
		
		ArrayList<ProductVO> productVO = shopService.Load_Product(n_category, sort);
		
		int page = productVO.size()/10 + 1;
		
		int b_page = (9 * (n_page - 1));
		int e_page =  8 + (8 * (n_page - 1));
		
		ArrayList<String> type_category = shopService.Load_Category();
		
		
		mav.addObject("sort", sort);
		mav.addObject("type_category", type_category);
		mav.addObject("n_category", n_category);
		mav.addObject("n_page", n_page);
		mav.addObject("b_page", b_page);
		mav.addObject("e_page", e_page);
		mav.addObject("page", page);
		mav.addObject("productVO", productVO);
		mav.setViewName("shop/shop");
		return mav;
	}
	
	@RequestMapping(value = "/product/{product_id}")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response
			 ,@PathVariable(value= "product_id") String product_id) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		
		ProductVO product = shopService.Load_Product(product_id);
		
		
		mav.addObject("id", session.getAttribute("user_id"));
		mav.addObject("product",product);
		mav.setViewName("shop/product");
		return mav;
	}
	
}
