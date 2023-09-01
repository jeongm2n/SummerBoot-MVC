package com.spring.summerboot2.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/file")
public class QRController {

	@RequestMapping(value="/showqr", method = RequestMethod.GET)
	public ModelAndView showPop(@RequestParam("qrCode") String qrCode) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("qrCode",qrCode);
		mav.setViewName("/member/qrPopup");
		return mav;
	}
}
