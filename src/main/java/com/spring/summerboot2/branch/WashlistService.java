package com.spring.summerboot2.branch;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class WashlistService {
	public List<WashlistVO> washList() {
		WashlistDAO dao = new WashlistDAO();
		return dao.washList();
	}
}
