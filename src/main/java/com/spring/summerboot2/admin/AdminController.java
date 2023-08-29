package com.spring.summerboot2.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.summerboot2.community.InquiryVO;
import com.spring.summerboot2.member.MemberVO;
import com.spring.summerboot2.product.ProductVO;
import com.spring.summerboot2.reservation.ReservationVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView admin() {
		List<InquiryVO> inquiry;
		inquiry = adminService.inquiryMain();
		int count = adminService.inquiryCount();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("count", count);
		mav.addObject("inquiry", inquiry);
		mav.setViewName("admin/main");
        return mav;
    }
	
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
    public ModelAndView userList() {
		List<MemberVO> userList;
		userList = adminService.userList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("users", userList);
		mav.setViewName("admin/userList");
        return mav;
    }
	
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public ModelAndView productList() {
		
		List<ProductVO> productList;
		productList = adminService.productList();
		 
		ModelAndView mav = new ModelAndView();
		mav.addObject("productList", productList); 
		mav.setViewName("admin/productList");
		return mav;
	}
	
	@RequestMapping(value = "/productForm", method = RequestMethod.GET)
    public String productForm() {
        return "admin/addProduct";
    }
	
	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public ModelAndView addProduct(@RequestParam MultipartFile file, @RequestParam Map<String, String> product) throws IOException {
		String uploadPath = "C:/ThisIsJava/workspace/SummerBoot-MVC/src/main/webapp/resources/assets/img/";
		
		int product_id = Integer.parseInt(product.get("product_id"));
		String name = product.get("name");
		int amount =Integer.parseInt(product.get("amount"));
		int price =Integer.parseInt(product.get("price"));
		
		System.out.println("product_id : " + product_id);
		System.out.println("name : " + name);
		System.out.println("amount : " +amount); 
		System.out.println("price : " + price);
		
		String saveName="";
		if(!file.isEmpty()) {
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!");
			String filename=file.getOriginalFilename(); //파일 이름
			
			System.out.println("file.getOriginalFilename = " + filename);
			int index = filename.lastIndexOf(".");
			saveName= product.get("product_id") + filename.substring(index); // 사진파일의 확장자명 구하기
			
			String fullPath = uploadPath + saveName; //파일이름을 상품코드로 변경
			file.transferTo(new File(fullPath)); //파일 저장
		}
		 
		ModelAndView mav = new ModelAndView();
		 
		ProductVO vo = new ProductVO(product_id, name, amount, price, saveName);
		if (adminService.addProduct(vo)) {
			mav.addObject("msg", 888);
		} else {
			mav.addObject("msg", 4);
		}
		mav.setViewName("admin/addProduct");
		return mav;
	}
	
	@RequestMapping(value = "/reservationList1", method = RequestMethod.GET)
	public ModelAndView goresList(@RequestParam("no") int no,@RequestParam("res_date") String res_date){
		 
		ModelAndView mav = new ModelAndView();
		mav.addObject("no", no); 
		mav.addObject("res_date",res_date);
		mav.setViewName("admin/reservationList");
		return mav;
	}
	
	@RequestMapping(value = "/reservationList2", method = RequestMethod.POST)
	public ModelAndView showresList(@RequestParam("no") int no,@RequestParam("res_date") String res_date){
		
		List<ReservationVO> resList;
		resList = adminService.reservationList(no,res_date);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("no", no); 
		mav.addObject("res_date",res_date);
		mav.addObject("resList", resList); 
		mav.setViewName("admin/reservationList");
		return mav;
	}
	
	@RequestMapping(value = "/deleteres", method = RequestMethod.POST)
	@ResponseBody
	public int deleteRes(@RequestParam("res_no") int res_no) {
		int result = adminService.deleteres(res_no);
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
	public void deleteStore(@RequestParam("user_id") String user_id, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		boolean deleteUser = adminService.deleteUser(user_id);
		
		if(deleteUser) {
			writer.print("delete");
		} else {
			writer.print("fail");
		}
	}
}
