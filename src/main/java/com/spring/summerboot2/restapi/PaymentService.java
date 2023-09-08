package com.spring.summerboot2.restapi;

import org.springframework.stereotype.Service;

@Service
public class PaymentService {

	public String code(String bankName) {
		String code="";
		if(bankName.equals("우리은행")||bankName.equals("우리")) code="20";
		else if(bankName.equals("국민은행")||bankName.equals("국민")) code="04";
		return code;
	}

	
}
