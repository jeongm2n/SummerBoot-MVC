package com.spring.summerboot2.reservation;

import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.summerboot2.api.WeatherDAO;
import com.spring.summerboot2.api.WeatherVO;

import java.io.IOException;
import java.util.ArrayList;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	ReservationDAO rsDAO = new ReservationDAO();
	

//	 @RequestMapping(value = "/reservation1", method = RequestMethod.GET) 
//	 public String reservation1() { return "reservation/reservation1"; }
	
	 @RequestMapping(value = "/reservation1", method = RequestMethod.GET) 
	 public ModelAndView goreservation1(@RequestParam("no") int no,@RequestParam("date") String today,@RequestParam("resTime") String resTime) throws IOException,ParseException {
	 
		 ModelAndView mav = new ModelAndView();
		 
		 WeatherDAO wdao = new WeatherDAO();
		  
		 List<WeatherVO> weather3 = wdao.get3Days(today); //오늘~3일까지의 날씨정보를weather3 리스트에 받아옴 
		 List<WeatherVO> weather4 = wdao.get4Days(today); //4일~7일까지의 날씨정보를 weather4 리스트에 받아옴 
		 
		 List<WeatherVO> weekWeather = new ArrayList();
		 weekWeather.addAll(weather3); weekWeather.addAll(weather4);
		 
		 mav.addObject("resTime",resTime);
		 String str = today.substring(4);
		 String date = str.substring(0,2) + "-" + str.substring(2,4);
		 mav.addObject("today",date);
		 mav.addObject("weathers",weekWeather);
		 mav.setViewName("reservation/reservation1");
	 
		 return mav; 
	 }
	
	@RequestMapping(value = "/reservation2", method = RequestMethod.GET)
	public ModelAndView reservation2(@RequestParam("no") int no, @RequestParam("date") String date, 
			@RequestParam("startTime") String startTime,@RequestParam("useTime") int useTime,@RequestParam("endTime") String endTime ) {
		
		//예약된 세차 구역의 정보를 가져옴
		List<Integer> sites = rsDAO.chkSite(no, date, startTime, useTime);
		int i = 0;
		
		for (int site : sites) {
		    System.out.println("site "+i+": " + site);
		    i++;
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("no",no);
		mav.addObject("date",date);
		mav.addObject("startTime",startTime);
		mav.addObject("useTime",useTime);
		mav.addObject("endTime",endTime);
		mav.addObject("sites",sites);
		mav.setViewName("reservation/reservation2");
		return mav;
	}
	
	@RequestMapping(value="/chkmyres", method = RequestMethod.GET)
	public ModelAndView chkmyreservation(@RequestParam("user_id") String user_id, @RequestParam("date") String date,
			@RequestParam("nowtime") String nowtime){
		List<ReservationVO> myres = rsDAO.myres(user_id);
		List<ReservationVO> beforeres = new ArrayList();
		List<ReservationVO> afterres = new ArrayList();
		
		for(ReservationVO res : myres) {
			if(date.compareTo(res.getRes_date())==0 && nowtime.compareTo(res.getEndTime())>0) {
				afterres.add(res);
			}
			else if(date.compareTo(res.getRes_date())>0) {
				afterres.add(res);
			}else if(date.compareTo(res.getRes_date())==0 && nowtime.compareTo(res.getStartTime())>=0 && nowtime.compareTo(res.getEndTime())<=0){
				beforeres.add(res);
			}else {beforeres.add(res);}
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("beforeres",beforeres);
		mav.addObject("afterres",afterres);
		mav.setViewName("member/chkMyres");
		return mav;
	}
}

