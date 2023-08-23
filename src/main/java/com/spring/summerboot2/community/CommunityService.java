package com.spring.summerboot2.community;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class CommunityService {
	InquiryDAO dao = new InquiryDAO();
	public boolean regist_inquiry(InquiryVO vo) {
		return dao.insert_inquiry(vo);
	}
	
	public List<InquiryVO> inquiryList(int start) {
		return dao.inquiryList(start);
	}
	
	public int inquiryCount() {
		return dao.InquiryCount();
	}
}
