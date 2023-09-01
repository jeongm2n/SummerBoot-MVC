package com.spring.summerboot2;

import com.spring.summerboot2.api.WeatherDAO;
import com.spring.summerboot2.api.WeatherVO;
import com.spring.summerboot2.branch.WashlistService;
import com.spring.summerboot2.branch.WashlistVO;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	WashlistService washlistService;
	
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView home() throws IOException, ParseException {
    	List<WashlistVO> washList;
    	washList = washlistService.washList();
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("washList", washList);

		LocalDate today = LocalDate.now();

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formattedDate = today.format(formatter);

		WeatherDAO wdao = new WeatherDAO();
		List<WeatherVO> weather3 = wdao.getOneday(formattedDate,"60","127");
		List<WeatherVO> weekWeather = new ArrayList<>();
		weekWeather.addAll(weather3);
		mav.addObject("weathers",weekWeather);
		mav.setViewName("home");
    	
		return mav;
    }
    
}
