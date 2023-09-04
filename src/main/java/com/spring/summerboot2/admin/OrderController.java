package com.spring.summerboot2.admin;

import java.io.IOException;
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

import com.spring.summerboot2.shop.ProductVO;
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
		    if (i == 0 || orderList.get(i).getOrder_num() != orderList.get(i - 1).getOrder_num()) {
		        api = restapi.paymentLookup(orderList.get(i).getImp_uid());
		        String payMethod = api.getResponse().getPayMethod();
		        if (payMethod.equals("card")) {
		            orderList.get(i).setPay_method("카드 결제");
		            if (orderList.get(i).getStatus() == null) {
		                orderList.get(i).setStatus(api.getResponse().getStatus());
		            }
		        } else if (payMethod.equals("vbank")) {
		            orderList.get(i).setPay_method("무통장 입금");
		            if (orderList.get(i).getStatus() == null) {
		                SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
		                Calendar cal = Calendar.getInstance();
		                cal.setTime(orderList.get(i).getPur_date());
		                cal.add(Calendar.DATE, 3);
		                orderList.get(i).setStatus(api.getResponse().getStatus());
		                orderList.get(i).setVbank_name(api.getResponse().getVbankName());
		                orderList.get(i).setVbank_num(api.getResponse().getVbankNum());
		                orderList.get(i).setVbank_due(sdformat.format(cal.getTime()));
		            }
		        }
		        System.out.println(orderList.get(i).getStatus());
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
	
	@RequestMapping(value = "/check_payment/{pay_method}/{vbank_name}/{vbank_num}/{vbank_due}")
	public ModelAndView check_payment(
			@PathVariable(value= "pay_method") String pay_method  ,@PathVariable(value= "vbank_name") String vbank_name
			,@PathVariable(value= "vbank_num") String vbank_num   ,@PathVariable(value= "vbank_due") String vbank_due
			,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pay_method", pay_method);
		mav.addObject("vbank_name", vbank_name);
		mav.addObject("vbank_num", vbank_num);
		mav.addObject("vbank_num", vbank_due);
		mav.setViewName("admin/payment_check");
		return mav;
	}
}
