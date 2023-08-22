package com.spring.summerboot2.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class TodayresController {
    @Autowired
    TodayresService todayresService;

    @RequestMapping(value = "/getTodayResList", method = RequestMethod.GET)
    @ResponseBody
    public List<ReservationVO> todayresList(@RequestParam("site") String site) {
        return todayresService.todayresList(site);
    }
}
