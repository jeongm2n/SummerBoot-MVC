package com.spring.summerboot2.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.summerboot2.product.ProductVO;

@Controller
@RequestMapping("/admin/order")
public class OrderController {
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
    public ModelAndView userList() {
		List<OrderVO> orderList;
		List<ProductVO> productList;
		orderList = adminService.orderList();
		productList = adminService.productList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("orderList", orderList);
		mav.addObject("productList", productList);
		mav.setViewName("admin/orderCheck");
        return mav;
    }
}
