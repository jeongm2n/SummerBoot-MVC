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

import com.spring.summerboot2.api.WeatherDAO;
import com.spring.summerboot2.api.WeatherVO;

import java.util.List;
import com.spring.summerboot2.api.*;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	ReservationDAO rsDAO = new ReservationDAO();
	

	 @RequestMapping(value = "/reservation1", method = RequestMethod.GET) public
	 String reservation1() {
		 return "reservation/reservation1"; 
	 }
	
	@RequestMapping(value = "/chkReservation1.do", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<ReservationVO> chkReservation(@RequestParam("carwash_no") int carwash_no, @RequestParam("date") String date) throws Exception {
		List<ReservationVO> forres1 = rsDAO.chkReservation1(carwash_no, date);
		for (ReservationVO resVO : forres1) {
		    String startTime = resVO.getStartTime();
		    String useTime = resVO.getUseTime();
		    //해당 날짜의 예약된 정보를 가져옴
		    System.out.println("StartTime: " + startTime + ", UseTime: " + useTime);
		}
		return forres1;
	}
	
	@RequestMapping(value = "/reservation2", method = RequestMethod.GET)
	public ModelAndView reservation2(@RequestParam("carwash_no") int carwash_no, @RequestParam("date") String date, @RequestParam("startTime") String startTime,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//예약된 세차 구역의 정보를 가져옴
		List<Integer> sites = rsDAO.chkSite(carwash_no, date, startTime);
		int i = 0;
		
		for (int site : sites) {
		    System.out.println("site "+i+": " + site);
		    i++;
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("sites",sites);
		mav.setViewName("reservation/reservation2");
		return mav;
	}
}

