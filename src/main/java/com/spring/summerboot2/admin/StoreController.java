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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.summerboot2.branch.WashlistVO;

@Controller
@RequestMapping("/admin/store")
public class StoreController {
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value = "/storeList", method = RequestMethod.GET)
    public ModelAndView storeList() {
		List<WashlistVO> storeList;
		storeList = adminService.washList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("washList", storeList);
		mav.setViewName("admin/storeList");
        return mav;
    }
	
	@RequestMapping(value = "/storeForm", method = RequestMethod.GET)
    public String storeForm() {
        return "admin/addStore";
    }
	
	@RequestMapping(value = "/addStore", method = RequestMethod.POST)
	public ModelAndView addStore(@RequestParam MultipartFile file, @RequestParam Map<String, String> store, HttpSession session) throws IOException {
		String path = session.getServletContext().getRealPath("/");
		System.out.println("path : " + path);
		String uploadPath = path + "resources\\assets\\img\\";
		System.out.println("uploadpath : " + uploadPath);
		
		String name = store.get("name");
		String road_addr = store.get("road_addr");
		String rest_addr = store.get("rest_addr");
		int sites =Integer.parseInt(store.get("sites"));
		String tel = store.get("tel");
		String open_time = store.get("open_time");
		String end_time = store.get("end_time");
		
		String address = road_addr + " " + rest_addr;
		String time = open_time + "~" + end_time;
		
		System.out.println("name : " + name);
		System.out.println("address" + road_addr + " " + rest_addr);
		System.out.println("sites : " +sites); 
		System.out.println("tel : " + tel);
		System.out.println("open_time : " + open_time);
		System.out.println("end_time : " + end_time);
		System.out.println("time : " + time);
		
		String saveName="";
		if(!file.isEmpty()) {
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!");
			String filename=file.getOriginalFilename(); //파일 이름
			
			System.out.println("file.getOriginalFilename = " + filename);
			int index = filename.lastIndexOf(".");
			saveName= store.get("name") + filename.substring(index); // 사진파일의 확장자명 구하기
			
			String fullPath = uploadPath + saveName; //파일이름을 지점명으로 변경
			file.transferTo(new File(fullPath)); //파일 저장
		}
		
		ModelAndView mav = new ModelAndView();
		  
		WashlistVO vo = new WashlistVO(name, address, sites, tel, time, saveName);
		if(adminService.addStore(vo)) {
			mav.addObject("msg", 888);
		} else {
			mav.addObject("msg", 4);
		}
		mav.setViewName("admin/addStore");
 
		return mav;
	}
	
	@RequestMapping(value = "/overlappedName", method = RequestMethod.POST)
	public void overlapped(@RequestParam("name") String name, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		boolean overlappedName = adminService.overlappedName(name);
		
		if(!overlappedName) {
			writer.print("not_usable");
		} else {
			writer.print("usable");
		}
	}
	
	@RequestMapping(value = "/updateStore", method = RequestMethod.POST)
	public ModelAndView updateStore(HttpSession session, HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();
		
		System.err.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		String path = session.getServletContext().getRealPath("/");
		System.out.println("path : " + path);
		String uploadPath = path + "resources\\assets\\img\\";
		System.out.println("uploadpath : " + uploadPath);
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
		MultipartFile file = multi.getFile("img"); // 파일 객체 가져오기
		
		int no = Integer.parseInt(multi.getParameter("store_no"));
		String address = multi.getParameter("address");
		int sites =Integer.parseInt(multi.getParameter("sites"));
		String tel = multi.getParameter("tel");
		String open_time = multi.getParameter("open_time");
		String end_time = multi.getParameter("end_time");
		
		String time = open_time + "~" + end_time;
		
		System.out.println("empty : " + file.isEmpty());
		System.out.println("origin : " + file.getOriginalFilename());
		System.out.println("no : " + no);
		System.out.println("address" + address);
		System.out.println("sites : " +sites); 
		System.out.println("tel : " + tel);
		System.out.println("open_time : " + open_time);
		System.out.println("end_time : " + end_time);
		System.out.println("time : " + time);
		
		if(!file.isEmpty()) { // 사진도 변경한 경우
			String saveName="";
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!");
			String filename=file.getOriginalFilename(); //파일 이름
			
			System.out.println("file.getOriginalFilename = " + filename);
			int index = filename.lastIndexOf(".");
			saveName= request.getParameter("name") + filename.substring(index); // 사진파일의 확장자명 구하기
			
			String fullPath = uploadPath + saveName; //파일이름을 지점명으로 변경
			file.transferTo(new File(fullPath)); //파일 저장
			
			WashlistVO vo = new WashlistVO(no, address, sites, tel, time, saveName);
			if(adminService.updateStoreImg(vo)) {
				mav.addObject("msg", 888);
			} else {
				mav.addObject("msg", 4);
			}
		} else { // 사진 변경없는 경우
			System.out.println("@@@@@@@@@@@@");
			WashlistVO vo = new WashlistVO(no, address, sites, tel, time);
			if(adminService.updateStore(vo)) {
				mav.addObject("msg", 888);
			} else {
				mav.addObject("msg", 4);
			}
		}
		mav.setViewName("admin/storeList");
 
		return mav;
	}
	
	@RequestMapping(value = "/deleteStore", method = RequestMethod.POST)
	public void deleteStore(@RequestParam("store_no") String store_no, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		int no = Integer.parseInt(store_no);
		boolean deleteStore = adminService.deleteStore(no);
		
		if(deleteStore) {
			writer.print("delete");
		} else {
			writer.print("fail");
		}
	}
}
