package com.spring.summerboot2.reservation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@RequestMapping(value = "/reservation1", method = RequestMethod.GET)
	public String reservation1() {
		return "reservation/reservation1";
	}

	@RequestMapping(value = "/reservation2", method = RequestMethod.GET)
	public String reservation2() {
		return "reservation/reservation2";
	}
}
