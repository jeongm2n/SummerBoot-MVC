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
import com.spring.summerboot2.restapi.ImportApiController;


@Controller
@RequestMapping("/admin/order")
public class OrderController {
	@Autowired
	AdminService adminService;
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
		        orderList.get(i).setPaymethod(api.getResponse().getPayMethod());
		    }
		    else {
		    	if(orderList.get(i).getOrder_num().equals(orderList.get(i - 1).getOrder_num())) {
		    		orderList.get(i).setStatus(orderList.get(i-1).getStatus());
		    	}
		    	else{
		    		api = restapi.paymentLookup(orderList.get(i).getImp_uid());
		    		orderList.get(i).setTotal_price(api.getResponse().getAmount().intValue());
		    		orderList.get(i).setPaymethod(api.getResponse().getPayMethod());
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
}
