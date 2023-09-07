package com.spring.summerboot2.pay;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.spring.summerboot2.cart.CartVO;
import com.spring.summerboot2.reservation.ReservationVO;

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
		ArrayList<CartVO> product = new ArrayList<CartVO>();
		
		String user_id = (String)session.getAttribute("user_id");
		
		int product_price = 0;
		
		for(int i = 0; i < product_id.length; i++) { product.add(new CartVO(Integer.parseInt(product_id[i]), name[i], Integer.parseInt(quantity[i]), Integer.parseInt(price[i]), img[i]));}
		
		for(String p_price : price) { product_price += Integer.parseInt(p_price);}
		
		session.setAttribute("Product", product);
		
		if(session.getAttribute("Inform") != null) { inform = (InformVO)session.getAttribute("Inform"); inform.setPoint(payService.Load_Point(user_id));}
		else { inform = payService.Load_Inform(user_id);}
		
		mav.addObject("product_price",product_price);
		mav.addObject("product",product);
		mav.addObject("inform",inform);
		mav.setViewName("pay/inform");
		return mav;
	}

	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public ModelAndView payment(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		if(session.getAttribute("Product") != null) {
			String tel = request.getParameter("tel");
			String email = request.getParameter("email");
			String snssts = request.getParameter("snssts");
			String state = request.getParameter("state");
			String name = request.getParameter("name");
			String postcode = request.getParameter("postcode");
			String city = request.getParameter("city");
			String town = request.getParameter("town");
			String street_add = request.getParameter("street_add");
			String option_add = request.getParameter("option_add");
			String save_add = request.getParameter("save_add");
	
			String[] b_Inform = new String[5];
			
			StringBuffer p_tel = new StringBuffer(tel);			
			p_tel.insert(7, "-"); p_tel.insert(3, "-");
			b_Inform[0] = p_tel.toString();
			b_Inform[1] = email;
			
			b_Inform[2] = postcode + " ";
			switch(state) {
				case "강원특별자치도": case "제주특별자치도": case "세종특별자치시": b_Inform[2] += state + " "; break;
				case "부산": case "대구": case "인천": case "광주": case "대전": case "울산": b_Inform[2] += state + "광역시 "; break;
				case "경기": b_Inform[2] += state + "도 "; break; 
				case "서울": b_Inform[2] += state + "특별시 "; break; 
				case "충북": b_Inform[2] += "충청북도 "; break;
				case "충남": b_Inform[2] += "충청남도 "; break; 
				case "전북": b_Inform[2] += "전라북도 "; break; 
				case "전남": b_Inform[2] += "전라남도 "; break;
				case "경북": b_Inform[2] += "경상북도 "; break; 
				case "경남": b_Inform[2] += "경상남도 "; break; 
				default : break;
			}
			
			if(!city.equals(null)) { b_Inform[2] += city + " ";}
			b_Inform[2] += town + " " + street_add + " " + option_add;
			b_Inform[3] = postcode;
			b_Inform[4] = name;
			
			int point = 0;
			point = Integer.parseInt(request.getParameter("h_f_point"));			
			
			InformVO s_inform = new InformVO(tel, email, name, point, postcode, state, city, town, street_add, option_add);
			session.setAttribute("Inform", s_inform);
			
			if(session.getAttribute("user_id") != null && save_add != null) { payService.Save_Inform((String)session.getAttribute("user_id"), snssts, state, postcode, city, town, street_add, option_add, save_add);}
			
			ArrayList<CartVO> product = (ArrayList<CartVO>) session.getAttribute("Product");
			
			int product_price = 0;
			int shipping_price = 3000;
			
			for(CartVO p_product : product) { product_price += p_product.getPrice();}
			
			point = 0;
			if(!request.getParameter("h_point").isEmpty()) {point = Integer.parseInt(request.getParameter("h_point")); 	mav.addObject("point",point); }	
			
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
			mav.setViewName("home");
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
			ArrayList<CartVO> product = (ArrayList<CartVO>) session.getAttribute("Product");
			
			int product_price = 0;
			for(CartVO p_product : product) {
				product_price += p_product.getPrice();
			}
			
			inform = (InformVO)session.getAttribute("Inform");
						
			mav.addObject("product_price",product_price);
			mav.addObject("product",product);
			mav.addObject("inform",inform);
			mav.setViewName("pay/inform");
		}
		else {    
			mav.setViewName("home");
		}
		
		return mav;
	}
	
	 @ResponseBody
	 @RequestMapping(value="/pay_after/{merchant_uid},{point},{imp_uid}")
	 public ModelAndView pay_after(HttpServletRequest request, HttpServletResponse response
			 ,@PathVariable(value= "merchant_uid") String merchant_uid ,@PathVariable(value= "point") String s_point
			 ,@PathVariable(value= "imp_uid") String imp_uid) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		
		String user_id = (String)session.getAttribute("user_id");
		ArrayList<CartVO> product = (ArrayList<CartVO>) session.getAttribute("Product");
		InformVO inform = (InformVO)session.getAttribute("Inform");
		
		int point = 0;
		if(!s_point.equals("")) { point = Integer.parseInt(s_point);}
		payService.pay_point(inform.getPoint(), point, user_id);
		payService.pay_after(merchant_uid, user_id, product, inform, imp_uid);
		
		session.removeAttribute("Product");
		session.removeAttribute("Inform");
		
		mav.addObject("merchant_uid", merchant_uid);
		mav.setViewName("pay/Complate");
		return mav;
	}
	 
	 @ResponseBody
	 @RequestMapping(value="/reservation_pay/{no},{date},{startTime},{useTime},{site}")
	 public ModelAndView resevation_pay(HttpServletRequest request, HttpServletResponse response
			 ,@PathVariable(value= "no") String no ,@PathVariable(value= "date") String date
			 ,@PathVariable(value= "startTime") String startTime ,@PathVariable(value= "useTime") String useTime
			 ,@PathVariable(value= "site") String site) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		
		String id = (String)session.getAttribute("user_id");
		
		int point = payService.Load_Point(id);
		InformVO inform = payService.Load_Inform(id);
		String[] b_Inform = new String[5];
		String[] address = payService.Load_address(id).split("/");
		
		b_Inform[0] = inform.getTel();
		b_Inform[1] = inform.getEmail();
		b_Inform[2] = address[1];
		b_Inform[3] = address[0];
		b_Inform[4] = inform.getName();
		
		String[] carwash = payService.Load_CarWash(no);
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		Date date1 = sdf.parse(startTime);
		String[] f_date = date.split("-");
		
		if(f_date[0].charAt(0) == '0') { f_date[0] = f_date[0].substring(1);}
		
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(date1);
	    cal.add(Calendar.MINUTE, Integer.parseInt(useTime));
	    
	    String endTime = sdf.format(cal.getTime());  
	    
		ReservationVO reservation = new ReservationVO(Integer.parseInt(no), date, Integer.parseInt(site), startTime, useTime, endTime);
		
		int price = 0;
		
		if(useTime.equals("29")) {price = 2500;}
		else if(useTime.equals("59")) {price = 5000;}
		else if(useTime.equals("89")) {price = 7500;}
		else if(useTime.equals("119")) {price = 10000;}
		
		
		mav.addObject("price",price);
		mav.addObject("point",point);
		mav.addObject("f_date",f_date);
		mav.addObject("name",carwash[0]);
		mav.addObject("img", carwash[1]);
		mav.addObject("B_Inform", b_Inform);
		mav.addObject("reservation",reservation);
		mav.setViewName("pay/res_pay");
		return mav;
	}
	    
	 @ResponseBody
	 @RequestMapping(value="/reservation_after/{merchant_uid},{point},{no},{date},{startTime},{useTime},{site},{imp_uid}")
	 public ModelAndView reservation_after(HttpServletRequest request, HttpServletResponse response
			 ,@PathVariable(value= "merchant_uid") String merchant_uid ,@PathVariable(value= "point") int s_point
			 ,@PathVariable(value= "no") String no ,@PathVariable(value= "date") String date
			 ,@PathVariable(value= "startTime") String startTime ,@PathVariable(value= "useTime") String useTime
			 ,@PathVariable(value= "site") String site, @PathVariable(value= "imp_uid") String imp_uid ) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		
		String user_id = (String)session.getAttribute("user_id");
		payService.pay_point(payService.Load_Point(user_id), s_point, user_id);
		
		//String savePath = servletContext.getRealPath("resources/assets/img/qr/");
		String savePath = request.getSession().getServletContext().getRealPath("resources/assets/img/qr/");
		System.out.println(savePath);
		
		String qrCode = payService.makeQRcode(merchant_uid, user_id, no, date, startTime, useTime, site, savePath);
		
		payService.reservation_after(merchant_uid, user_id, no, date, startTime, useTime, site, qrCode, imp_uid);
		
		mav.addObject("merchant_uid", merchant_uid);
		mav.addObject("qrCode", qrCode);
		mav.setViewName("pay/Complate");
		return mav;
	}
}
