package com.spring.summerboot2.pay;

import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class PayServiceimpl implements PayService{
	
	public InformVO Load_Inform(String id, InformVO s_inform) {
		PayDAO paydao = new PayDAO();
		return paydao.Load_Inform(id, s_inform);
	}

	@Override
	public String[] Make_Inform(Map<String, String> inform) {
		PayDAO paydao = new PayDAO();
		return paydao.Make_Inform(inform);
	}
	
	public void Save_Inform(String id, Map<String, String> inform) {
		PayDAO paydao = new PayDAO();
		paydao.Save_Inform(id, inform);
	}
}
