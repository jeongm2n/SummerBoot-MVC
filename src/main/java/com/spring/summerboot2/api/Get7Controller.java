package com.spring.summerboot2.api;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.ArrayList;

@Controller
@RequestMapping("/api")
public class Get7Controller {
	
	@RequestMapping(value = "/weekweather.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public List<WeatherVO> getWeather(@RequestParam("today") String today, @RequestParam("nx") String nx, @RequestParam("ny") String ny, @RequestParam("location") String location) throws Exception{
		//today는 발표일자를 오늘로 설정하기 위한 변수, nx,ny,location은 위치 정보
		
		WeatherDAO wdao = new WeatherDAO();
		
		List<WeatherVO> weather3 = wdao.get3Days(today);  //오늘~3일까지의 날씨정보를 weather3 리스트에 받아옴
		List<WeatherVO> weather4 = wdao.get4Days(today); //4일~7일까지의 날씨정보를 weather4 리스트에 받아옴
		
		List<WeatherVO> weekWeather = new ArrayList<>();
		weekWeather.addAll(weather3);
		weekWeather.addAll(weather4);
		//weekWeather 리스트에 7일간의 날씨 정보를 합침
		
		return weekWeather;
	}
}
