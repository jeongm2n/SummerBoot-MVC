package com.spring.summerboot2.community;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class CommunityService {
	InquiryDAO dao = new InquiryDAO();
	public boolean regist_inquiry(InquiryVO vo) {
		return dao.insert_inquiry(vo);
	}
	
	public List<InquiryVO> inquiryList(int start, String category, String searchCon, String search, String stateCon) {
		return dao.inquiryList(start, category, searchCon, search, stateCon);
	}
	
	public int inquiryCount(String category, String searchCon, String search, String stateCon) {
		return dao.InquiryCount(category, searchCon, search, stateCon);
	}
}
