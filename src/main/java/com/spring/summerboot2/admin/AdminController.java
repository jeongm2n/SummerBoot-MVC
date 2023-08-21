package com.spring.summerboot2.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.summerboot2.branch.WashlistVO;
import com.spring.summerboot2.member.MemberVO;
import com.spring.summerboot2.product.ProductVO;
import com.spring.summerboot2.reservation.ReservationDAO;
import com.spring.summerboot2.reservation.ReservationVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public String admin() {
        return "admin/main";
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
	
	@RequestMapping(value = "/reservationList", method = RequestMethod.GET)
	public ModelAndView showresList(@RequestParam("carwash_no") int carwash_no) {
		
		List<ReservationVO> resList;
		resList = adminService.reservationList(carwash_no);
		 
		ModelAndView mav = new ModelAndView();
		mav.addObject("resList", resList); 
		mav.setViewName("admin/reservationList");
		return mav;
	}
	
	@RequestMapping(value = "/deleteres", method = RequestMethod.POST)
	public void deleteRes(@RequestParam("res_no") int res_no) {
		adminService.deleteres(res_no);
	}
}
