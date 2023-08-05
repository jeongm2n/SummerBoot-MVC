package com.spring.summerboot2.branch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/branch")
public class WashlistController {

    @RequestMapping(value="/list", method= RequestMethod.GET)
    public String washList() { return "washList"; }

}
