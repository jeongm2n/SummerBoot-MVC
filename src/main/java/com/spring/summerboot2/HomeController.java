package com.spring.summerboot2;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home() {
        return "home";
    }
    
    @RequestMapping(value = "/qna", method = RequestMethod.GET)
    public String inquiry() {
        return "inquiry";
    }
}
