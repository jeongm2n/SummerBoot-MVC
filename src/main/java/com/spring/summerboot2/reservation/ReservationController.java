package com.spring.summerboot2.reservation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	ReservationDAO rsDAO = new ReservationDAO();
	

	 @RequestMapping(value = "/reservation1", method = RequestMethod.GET) public
	 String reservation1() {
		 return "reservation/reservation1"; 
	 }
	
	/*
	 * @RequestMapping(value = "/reservation1", method = RequestMethod.GET) public
	 * ModelAndView chkReservation(HttpServletRequest request,HttpServletResponse
	 * response) throws Exception { request.setCharacterEncoding("utf-8");
	 * response.setContentType("text/html; charset=utf-8");
	 * 
	 * List<ReservationVO> forres1 = rsDAO.forReservation1();
	 * 
	 * ModelAndView mav = new ModelAndView(); mav.addObject("forres1",forres1);
	 * mav.setViewName("reservation/reservation1"); 
	 * return mav; 
	 * }
	 */
	
	
	@RequestMapping(value = "/chkReservation1.do", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<ReservationVO> chkReservation(@RequestParam("no") int no, @RequestParam("date") String date) throws Exception {
		List<ReservationVO> forres1 = rsDAO.chkReservation1(no, date);
		for (ReservationVO resVO : forres1) {
		    String startTime = resVO.getStartTime();
		    String useTime = resVO.getUseTime();
		    System.out.println("StartTime: " + startTime + ", UseTime: " + useTime);
		}
		return forres1;
	}
	
	@RequestMapping(value = "/reservation2", method = RequestMethod.GET)
	public ModelAndView reservation2(@RequestParam("no") int no, @RequestParam("date") String date, @RequestParam("startTime") String startTime,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		List<Integer> sites = rsDAO.chkSite(no, date, startTime);
		
		for (int site : sites) {
		    System.out.println("site: " + site);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("sites",sites);
		mav.setViewName("reservation/reservation2");
		return mav;
	}
}

