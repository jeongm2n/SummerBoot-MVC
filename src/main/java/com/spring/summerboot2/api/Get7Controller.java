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

@Controller
@RequestMapping("/api")
public class Get7Controller {
	
	@RequestMapping(value = "/getWeather.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public List<WeatherVO> getWeather(@RequestParam("today") String today, @RequestParam("nx") String nx, @RequestParam("ny") String ny) throws Exception{
		WeatherDAO wdao = new WeatherDAO();
		
		List<WeatherVO> weekWeather = wdao.get3Days(today, nx, ny);
		
		return weekWeather;
	}
}
