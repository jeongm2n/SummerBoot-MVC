package com.spring.summerboot2;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.summerboot2.api.WeatherDAO;
import com.spring.summerboot2.api.WeatherVO;
import com.spring.summerboot2.branch.WashlistService;
import com.spring.summerboot2.branch.WashlistVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	WashlistService washlistService;
	
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView home(@RequestParam(value="store_no", defaultValue="1") int num) throws IOException, ParseException {
    	List<WashlistVO> washList;
    	washList = washlistService.washList();
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("washList", washList);

		LocalDate today = LocalDate.now();

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formattedDate = today.format(formatter);

		WeatherDAO wdao = new WeatherDAO();

		List<WeatherVO> weather1 = wdao.getOneday(formattedDate,"60","127");
		mav.addObject("store_no",num);
		mav.addObject("weather1",weather1);
		mav.setViewName("home");
    	
		return mav;
    }
    
}
