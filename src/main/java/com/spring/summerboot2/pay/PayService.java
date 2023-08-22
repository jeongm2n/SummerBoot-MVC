package com.spring.summerboot2.pay;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

@Service
public interface PayService {
	public InformVO Load_Inform(String id, boolean s_inform);
	public void Save_Inform(String id, String snssts, String state, String postcode, String city, String town,
			String street_add, String option_add, String save_add);
	public void pay_after(int point, String merchant_uid, String id, ArrayList<ProductVO> product, InformVO inform);
	
}
	