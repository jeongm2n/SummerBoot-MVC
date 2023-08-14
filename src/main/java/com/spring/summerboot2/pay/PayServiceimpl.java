package com.spring.summerboot2.pay;

import org.springframework.stereotype.Service;

@Service
public class PayServiceimpl implements PayService{
	
	public InformVO Load_Inform(String ID) {
		PayDAO dao = new PayDAO();
		return dao.Load_Inform(ID);
	}
}
