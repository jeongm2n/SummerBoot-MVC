package com.spring.summerboot2.reservation;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.summerboot2.shop.ReviewVO;

@Controller
@RequestMapping("/review")
public class ResreviewController {

    //ReservationDAO res = new ReservationDAO();
    private  String reviewText = "";
    ReservationDAO dao = new ReservationDAO();

    //세차장리뷰 팝업띄우기
    @RequestMapping(value = "/new_rv")
    public ModelAndView showRv(Model model, @RequestParam("store") int store){
    	ModelAndView mav = new ModelAndView();
        model.addAttribute("reviewText", reviewText);
        List<ReviewVO> list;
        list = dao.reviewList(store);
		
        mav.addObject("list", list);
		mav.setViewName("member/wash_review");
        return mav;
    }
    
    @RequestMapping(value = "/reviewWrite")
    public String rvWrite(){
    	return "member/wash_reviewWrite";
    }

    @RequestMapping(value = "/submitReview", method = RequestMethod.POST)
    public void submitReview(HttpServletRequest request, HttpServletResponse response, @RequestParam("text") String text, @RequestParam("rating") int rating, @RequestParam("store") int store, @RequestParam("res_no") int res_no) throws Exception {
        response.setCharacterEncoding("UTF-8");
        PrintWriter writer = response.getWriter();
        String id = (String) request.getSession().getAttribute("user_id");
        
        if(dao.reviewInsert(id, text, rating, store, res_no)) {
			writer.print("insert");
		} else {
			writer.print("fail");
		}
    }
}
