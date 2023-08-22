package com.spring.summerboot2.pay;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	@Autowired
	private PayService payService;

	
	@RequestMapping(value = "/inform", method = RequestMethod.GET)
	public ModelAndView inform(@RequestParam("product_id") String[] product_id, @RequestParam("product_name") String[] name, 
			@RequestParam("quantity") String[] quantity, @RequestParam("price") String[] price, @RequestParam("product_img") String[] img,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		
		InformVO inform = null;
		ArrayList<ProductVO> product = new ArrayList<ProductVO>();
		
		for(int i = 0; i < product_id.length; i++) { product.add(new ProductVO(Integer.parseInt(product_id[i]), name[i], Integer.parseInt(quantity[i]), Integer.parseInt(price[i]), img[i]));}
		
		int product_price = 0;
		for(String p_price : price) { product_price += Integer.parseInt(p_price);}
		
		session.setAttribute("Product", product);
		
		boolean p_view;
		if(session.getAttribute("user_id") == null) {
			p_view = false;
			if(session.getAttribute("Inform") != null) { inform = (InformVO)session.getAttribute("Inform");}
		}
		else {
			p_view = true;
			String user_id = (String)session.getAttribute("user_id");
			if(session.getAttribute("Inform") == null) {inform = payService.Load_Inform(user_id, false);}	
			else { 
				inform = (InformVO)session.getAttribute("Inform");
			}
		}
		
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
		
		if(session.getAttribute("Product") != null) {
			String tel = inform.get("tel"); String email = inform.get("email"); String snssts = inform.get("snssts");
			String state = inform.get("state"); String name = inform.get("name"); String postcode = inform.get("postcode"); String city = inform.get("city");
			String town = inform.get("town"); String street_add = inform.get("street_add"); String option_add = inform.get("option_add"); String save_add = inform.get("save_add");
	
			String[] b_Inform = new String[5];
			
			StringBuffer p_tel = new StringBuffer(tel);
			p_tel.insert(7, "-"); p_tel.insert(3, "-");
			b_Inform[0] = p_tel.toString();
			b_Inform[1] = email;
			
			b_Inform[2] = postcode + " ";
			switch(state) {
				case "강원특별자치도": case "제주특별자치도": case "세종특별자치시": b_Inform[2] += state + " "; break;
				case "부산": case "대구": case "인천": case "광주": case "대전": case "울산": b_Inform[2] += state + "광역시 "; break;
				case "경기": b_Inform[2] += state + "도 "; break; case "서울": b_Inform[2] += state + "특별시 "; break; case "충북": b_Inform[2] += "충청북도 "; break;
				case "충남": b_Inform[2] += "충청남도 "; break; case "전북": b_Inform[2] += "전라북도 "; break; case "전남": b_Inform[2] += "전라남도 "; break;
				case "경북": b_Inform[2] += "경상북도 "; break; case "경남": b_Inform[2] += "경상남도 "; break; default : break;
			}
			if(!city.equals(null)) { b_Inform[2] += city + " ";}
			b_Inform[2] += town + " " + street_add + " " + option_add;
			b_Inform[3] = postcode;
			b_Inform[4] = name;
			
			int point = 0;
			
			point = Integer.parseInt(inform.get("h_f_point"));
			
			InformVO s_inform = new InformVO(tel, email, name, point, postcode, state, city, town, street_add, option_add);
			session.setAttribute("Inform", s_inform);
			
			if(session.getAttribute("user_id") != null && save_add.equals("동의")) { payService.Save_Inform((String)session.getAttribute("user_id"), snssts, state, postcode, city, town, street_add, option_add, save_add);}
			
			ArrayList<ProductVO> product = (ArrayList<ProductVO>) session.getAttribute("Product");
			
			int product_price = 0;
			int shipping_price = 3000;
			
			for(ProductVO p_product : product) { product_price += p_product.getPrice();}
			
			point = 0;
			if(!inform.get("h_point").isEmpty()) {point = Integer.parseInt(inform.get("h_point")); 	mav.addObject("point",point); }	
			
			if(s_inform.getState().equals("제주특별자치도")) { shipping_price = 5000;}
			
			int total_price = product_price + shipping_price - point;
			
			mav.addObject ("product_price",product_price);
			mav.addObject("shipping_price",shipping_price);
			mav.addObject("total_price",total_price);
			mav.addObject("product",product);
			mav.addObject("B_Inform", b_Inform);
			mav.setViewName("pay/payment");
		}
		else {    
			PrintWriter out = response.getWriter();
			out.println("<script>alert('세션이 만료되었습니다.');</script>");
			mav.setViewName("../member/cart");
			out.close();
		}
		return mav;
	}
	
	@RequestMapping(value = "/back_inform", method = RequestMethod.GET)
	public ModelAndView inform(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("Product") != null) {
			InformVO inform = null;
			ArrayList<ProductVO> product = (ArrayList<ProductVO>) session.getAttribute("Product");
			
			int product_price = 0;
			for(ProductVO p_product : product) {
				product_price += p_product.getPrice();
			}
			
			inform = (InformVO)session.getAttribute("Inform");
			
			boolean p_view;
			if(inform.getPoint() == 0) { p_view = false;}
			else { p_view = true;}
			
			session.setAttribute("Product", product);
			
			
			mav.addObject("product_price",product_price);
			mav.addObject("product",product);
			mav.addObject("p_view",p_view);
			mav.addObject("inform",inform);
			mav.setViewName("pay/inform");
		}
		else {    
			PrintWriter out = response.getWriter();
			out.println("<script>alert('세션이 만료되었습니다.');</script>");
			mav.setViewName("../member/cart");
			out.close();
		}
		return mav;
	}
	
	 @ResponseBody
	 @RequestMapping(value="/pay_after/{merchant_uid},{point}")
	 public ModelAndView pay_after(HttpServletRequest request, HttpServletResponse response
			 ,@PathVariable(value= "merchant_uid") String merchant_uid ,@PathVariable(value= "point") String s_point) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		
		String user_id = (String)session.getAttribute("user_id");
		ArrayList<ProductVO> product = (ArrayList<ProductVO>) session.getAttribute("Product");
		InformVO inform = (InformVO)session.getAttribute("Inform");
		
		int point = 0;
		if(!s_point.equals("")) { point = Integer.parseInt(s_point);}
		
		payService.pay_after(point, merchant_uid, user_id, product, inform);
		
		mav.setViewName("pay/Complate");
		return mav;
		
		
	}
	
}
