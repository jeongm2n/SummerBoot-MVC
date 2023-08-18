package com.spring.summerboot2.pay;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
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
@RequestMapping("/pay")
public class PayController {
	
	@Autowired
	private PayService payService;

	
	@RequestMapping(value = "/inform", method = RequestMethod.GET)
	public ModelAndView inform(@RequestParam("product_id") String[] product_id, @RequestParam("product_name") String[] name, @RequestParam("quantity") String[] quantity,
			@RequestParam("price") String[] price, @RequestParam("product_img") String[] img,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		
		InformVO inform = null;
		ArrayList<ProductVO> product = new ArrayList<ProductVO>();
		
		for(int i = 0; i < product_id.length; i++) { product.add(new ProductVO(Integer.parseInt(product_id[i]), name[i], Integer.parseInt(quantity[i]), Integer.parseInt(price[i]), img[i]));}
		
		int product_price = 0;
		for(String p_price : price) {
			product_price += Integer.parseInt(p_price);
		}
		
		boolean p_view;
		if(session.getAttribute("user_id") == null) {
			p_view = false;
			if(session.getAttribute("Inform") == null) { }	
			else { inform = (InformVO)session.getAttribute("Inform");}
		}
		else {
			p_view = true;
			String user_id = (String)session.getAttribute("user_id");
			if(session.getAttribute("Inform") == null) { inform = payService.Load_Inform(user_id, inform);}	
			else {
				inform = (InformVO)session.getAttribute("Inform");
				inform = payService.Load_Inform(user_id, inform);
			}
		}
		
		
		session.setAttribute("Product", product);
		
		
		mav.addObject("product_price",product_price);
		mav.addObject("product",product);
		mav.addObject("p_view",p_view);
		mav.addObject("inform",inform);
		mav.setViewName("pay/inform");
		return mav;
	}

	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public ModelAndView payment(@RequestParam Map<String, String> inform, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		String tel = inform.get("tel");
		String snssts = inform.get("snssts");
		String state = inform.get("state");
		String name = inform.get("name");
		String postcode = inform.get("postcode");
		String city = inform.get("city");
		String town = inform.get("town");
		String street_add = inform.get("street_add");
		String option_add = inform.get("option_add");
		String save_add = inform.get("save_add");
		int point = 0;
		
		if(!inform.get("h_point").isEmpty()) {point = Integer.parseInt(inform.get("h_point")); 	mav.addObject("point",point);}
		String[] C_Inform = payService.Add_Session(inform);		
		
		InformVO s_inform = new InformVO(tel, name, postcode, state, city, town, street_add, option_add);
		
		session.setAttribute("Inform", s_inform);
		
		if(session.getAttribute("user_id") == null) {
			
		}
		else {
			String user_id = (String)session.getAttribute("user_id");
			payService.Save_Inform(user_id, inform);
		}
		
		ArrayList<ProductVO> product = (ArrayList<ProductVO>) session.getAttribute("Product");
		
		int product_price = 0;
		int shipping_price = 3000;
		
		for(ProductVO p_product : product) {
			product_price += p_product.getPrice();
		}
		
		if(s_inform.getState().equals("제주특별자치도")) {
			shipping_price = 5000;
		}
		
		int total_price = product_price + shipping_price - point;
		
		
		mav.addObject("product_price",product_price);
		mav.addObject("shipping_price",shipping_price);
		mav.addObject("total_price",total_price);
		mav.addObject("product",product);
		mav.addObject("C_Inform", C_Inform);
		mav.setViewName("pay/payment");
		return mav;
	}
	
}
