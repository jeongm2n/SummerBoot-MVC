package com.spring.summerboot2.admin;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.spring.summerboot2.member.MemberService;
import com.spring.summerboot2.restapi.ImportApiController;


@Controller
@RequestMapping("/admin/order")
public class OrderController {
	@Autowired
	AdminService adminService;
	
	@Autowired
	MemberService memberService;
	
	ImportApiController restapi = new ImportApiController();
	
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
    public ModelAndView userList() throws IamportResponseException, IOException {
		List<OrderVO> orderList;
		IamportResponse<Payment> api;
		orderList = adminService.orderList();
		
		for (int i = 0; i < orderList.size(); i++) {
		    if (i == 0 || !orderList.get(i).getOrder_num().equals(orderList.get(i - 1).getOrder_num()) && orderList.get(i).getStatus() == null) {
		    	api = restapi.paymentLookup(orderList.get(i).getImp_uid());
		        orderList.get(i).setStatus(api.getResponse().getStatus());
		        orderList.get(i).setTotal_price(api.getResponse().getAmount().intValue());
		    }
		    else {
		    	if(orderList.get(i).getOrder_num().equals(orderList.get(i - 1).getOrder_num())) {
		    		orderList.get(i).setStatus(orderList.get(i-1).getStatus());
		    	}
		    	else{
		    		api = restapi.paymentLookup(orderList.get(i).getImp_uid());
		    		orderList.get(i).setTotal_price(api.getResponse().getAmount().intValue());
		    	}
		    }
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("orderList", orderList);
		mav.setViewName("admin/orderCheck");
        return mav;
    }
	
	@RequestMapping(value = "/searchOrder", method = RequestMethod.POST)
	public ModelAndView searchOrder(@RequestParam("column") String column, @RequestParam("str") String str) {
		List<OrderVO> orderList;
		
		orderList = adminService.filterOrderList(column,str);
		ModelAndView mav = new ModelAndView();
		mav.addObject("orderList", orderList);
		mav.setViewName("admin/orderCheck");
        return mav;
	}
	
	@RequestMapping(value = "/check_payment/{Imp_uid}/{Pur_date}")
	public ModelAndView check_payment(
			@PathVariable(value= "Imp_uid") String Imp_uid ,@PathVariable(value= "Pur_date") Date Pur_date
			,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		ModelAndView mav = new ModelAndView();
		IamportResponse<Payment> api;
		PaymentVO payment = null;
		
		api = restapi.paymentLookup(Imp_uid);
		String pay_method = api.getResponse().getPayMethod();
		if(pay_method.equals("card")) {
			pay_method = "카드 결제";
			String buyer_name = api.getResponse().getBuyerName();
			StringBuffer buyer_tel = new StringBuffer(api.getResponse().getBuyerTel());
			String card_name = api.getResponse().getCardName();
			String card_number = api.getResponse().getCardNumber();
			payment = new PaymentVO(buyer_name, buyer_tel.toString(), pay_method, card_name, card_number);
		}
		
		else if(pay_method.equals("vbank")) {
			pay_method = "무통장 입금";
			String buyer_name = api.getResponse().getBuyerName();
			StringBuffer buyer_tel = new StringBuffer(api.getResponse().getBuyerTel());
			SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = Calendar.getInstance();
            cal.setTime(Pur_date);	cal.add(Calendar.DATE, 3);
            String vbank_date = sdformat.format(cal.getTime());
            String vbank_name = api.getResponse().getVbankName();
            String vbank_num = api.getResponse().getVbankNum();
			payment = new PaymentVO(buyer_name, buyer_tel.toString(), pay_method, vbank_date, vbank_name, vbank_num);
		}
		
		mav.addObject("payment",payment);
		mav.setViewName("admin/payment_check");
		return mav;
	}
	
	//무통장이 작동 안할시 사용할 컨트롤러
	@RequestMapping(value = "/check_account/{order_num}")
	public ModelAndView check_payment(
			@PathVariable(value= "order_num") String order_num
			,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		ModelAndView mav = new ModelAndView();
		OrderVO account = null;
		
		account = adminService.Load_Account(order_num);
		
		String bank_name = null;
		int bank_code = account.getRefundbank();
		switch(bank_code){
			case 04 : { bank_name = "KB국민은행"; break;} case 23 : { bank_name = "SC제일은행"; break;}
			case 39 : { bank_name = "경남은행"; break;} case 34 : { bank_name = "광주은행"; break;}
			case 03 : { bank_name = "기업은행"; break;} case 11 : { bank_name = "NH농협은행"; break;}
			case 31 : { bank_name = "대구은행"; break;} case 32 : { bank_name = "부산은행"; break;}
			case 02 : { bank_name = "산업은행"; break;} case 37 : { bank_name = "전북은행"; break;}
			case 07 : { bank_name = "수협은행"; break;} case 71 : { bank_name = "우체국"; break;}
			case 20 : { bank_name = "우리은행"; break;} case 81 : { bank_name = "하나은행"; break;}
			case 88 : { bank_name = "신한은행"; break;} case 89 : { bank_name = "케이뱅크"; break;}
			case 92 : { bank_name = "토스뱅크"; break;} case 45 : { bank_name = "새마을금고"; break;}
		}
		
		mav.addObject("bank_name", bank_name);
		mav.addObject("account",account);
		mav.setViewName("admin/account_check");
		return mav;
	}
	
	@RequestMapping(value = "/popuptracking/{order_num}")
	public ModelAndView popuptracking(
			@PathVariable(value= "order_num") String order_num
			,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("order_num",order_num);
		mav.setViewName("admin/tracking");
		return mav;
	}
	
	@RequestMapping(value = "/add_tracking/{order_num}", method = {RequestMethod.POST})
	public void updatetracking(
			@PathVariable(value= "order_num") String order_num	,@RequestParam("tracking") String tracking
			,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		adminService.add_tracking(order_num, tracking);
		memberService.update_status("배송중", order_num);
	}
	
}
