package com.spring.summerboot2.pay;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.spring.summerboot2.cart.CartVO;

@Service
public interface PayService {
	public InformVO Load_Inform(String id);
	public int Load_Point(String id);
	public String Load_address(String id);
	public String[] Load_CarWash(String no);
	public void Save_Inform(String id, String snssts, String state, String postcode, String city, String town,
			String street_add, String option_add, String save_add);
	public void pay_point(int point, int u_point, String id);
	public void pay_after(String merchant_uid, String id, ArrayList<CartVO> product, InformVO inform);
	public void reservation_after(String merchant_uid, String id, String no, String date, String startTime, String useTime, String site, String qrCode);
	
	public String makeQRcode(String merchant_uid, String id, String no, String date, String startTime, String useTime, String site, String savePath);
}
	