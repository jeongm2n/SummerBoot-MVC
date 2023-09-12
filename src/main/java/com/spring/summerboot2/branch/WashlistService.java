package com.spring.summerboot2.branch;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class WashlistService {
	public List<WashlistVO> washList() {
		WashlistDAO dao = new WashlistDAO();
		return dao.washList();
	}
	public Map<Integer, Object> storeStar() {
		WashlistDAO dao = new WashlistDAO();
		return dao.storeStar();
	}
	public Map<Integer, Object> reviewCnt() {
		WashlistDAO dao = new WashlistDAO();
		return dao.storeReview();
	}
}
