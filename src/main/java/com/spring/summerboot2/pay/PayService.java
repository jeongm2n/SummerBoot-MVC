package com.spring.summerboot2.pay;

import org.springframework.stereotype.Service;

@Service
public interface PayService {
	
	public InformVO Load_Inform(String ID);
	
}
