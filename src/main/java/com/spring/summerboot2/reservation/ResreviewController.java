package com.spring.summerboot2.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

@Controller
@RequestMapping("/review")
public class ResreviewController {

    //ReservationDAO res = new ReservationDAO();
    private  String reviewText = "";

    //세차장리뷰 팝업띄우기
    @RequestMapping(value = "/new_rv")
    public String showRv(Model model){
        model.addAttribute("reviewText", reviewText);
        return "member/wash_review";
    }

    @RequestMapping(value = "/submitReview", method = RequestMethod.POST)
    @ResponseBody
    public String submitReview(HttpServletRequest request, HttpServletResponse response, @RequestParam("text") String text) throws UnsupportedEncodingException {
        response.setCharacterEncoding("UTF-8");

        reviewText = text;
        return reviewText;
    }
}
