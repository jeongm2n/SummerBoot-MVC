package com.spring.summerboot2.shop;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		ArrayList<ProductVO> productVO = shopService.Load_Product(n_category, sort, n_page);
		ArrayList<String> type_category = shopService.Load_Category();
		
		int page = shopService.Load_Size();
		
		if(page % 9 > 0) {page = page/9 + 1;}
		else {page = page/9;}
		
		System.out.println(page);
		
		mav.addObject("sort", sort);
		mav.addObject("type_category", type_category);
		mav.addObject("n_category", n_category);
		mav.addObject("n_page", n_page);
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
		ArrayList<ReviewVO> review = shopService.Load_Review(product_id);
		
		int review_count = review.size();
		int[] s_review_count = new int[5];
		Arrays.fill(s_review_count, 0);
		
		for(ReviewVO c_review : review) {
			switch (c_review.getPoint()) {
				case 1:{ s_review_count[0]++; break;}
				case 2:{ s_review_count[1]++; break;}
				case 3:{ s_review_count[2]++; break;}
				case 4:{ s_review_count[3]++; break;}
				case 5:{ s_review_count[4]++; break;}
				default : break;
			}
		}
		
		mav.addObject("id", session.getAttribute("user_id"));
		mav.addObject("review",review);
		mav.addObject("review_count",review_count);
		mav.addObject("s_review_count",s_review_count);
		mav.addObject("product",product);
		mav.setViewName("shop/product");
		return mav;
	}
	
	@RequestMapping(value = "/add_cart", method = RequestMethod.GET)
	public void add_cart(HttpServletRequest request, HttpServletResponse response
			 ,@RequestParam(value= "product_id") String product_id  ,@RequestParam(value= "quantity") String quantity 
			 ,@RequestParam(value= "amount") String amount) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		
		shopService.Add_Cart((String)session.getAttribute("user_id"), Integer.parseInt(product_id), Integer.parseInt(quantity), Integer.parseInt(amount));
		
	}
	
	
}
