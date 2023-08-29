package com.spring.summerboot2.pay;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.spring.summerboot2.cart.CartVO;

@Service
public class PayServiceimpl implements PayService{
	
	public InformVO Load_Inform(String id) {
		PayDAO paydao = new PayDAO();
		return paydao.Load_Inform(id);
	}
	
	public int Load_Point(String id) {
		PayDAO paydao = new PayDAO();
		return paydao.Load_Point(id);
	}
	
	public String Load_address(String id) {
		PayDAO paydao = new PayDAO();
		return paydao.Load_address(id);
	}
	
	public String[] Load_CarWash(String no) {
		PayDAO paydao = new PayDAO();
		return paydao.Load_CarWash(no);
	}
	
	public void Save_Inform(String id, String snssts, String state, String postcode, String city, String town,
			String street_add, String option_add, String save_add) {
		PayDAO paydao = new PayDAO();
		paydao.Save_Inform(id, snssts, state, postcode, city, town, street_add, option_add, save_add);
	}
	
	public void pay_after(int point, String merchant_uid, String id, ArrayList<CartVO> product, InformVO inform) {
		PayDAO paydao = new PayDAO();
		paydao.pay_after(point, merchant_uid, id, product, inform);
	}

}
