package com.spring.summerboot2.pay;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.spring.summerboot2.api.QRcodeDAO;
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
	
	public void pay_point(int point, int u_point, String id) {
		PayDAO paydao = new PayDAO();
		paydao.pay_point(point, u_point, id);
	}
	
	public void pay_after(String merchant_uid, String id, ArrayList<CartVO> product, InformVO inform, String imp_uid) {
		PayDAO paydao = new PayDAO();
		paydao.pay_after(merchant_uid, id, product, inform, imp_uid);
	}
	
	public String makeQRcode(String merchant_uid, String id, String no, String date, String startTime, String useTime, String site, String savePath) {
		QRcodeDAO qrDAO = new QRcodeDAO();
		return qrDAO.makeQR(merchant_uid, id, no, date, startTime, useTime, site, savePath);
	}
	
	public void reservation_after(String merchant_uid, String id, String no, String date, String startTime, String useTime, String site, String qrCode, String imp_uid) {
		PayDAO paydao = new PayDAO();
		paydao.reservation_after(merchant_uid, id, no, date, startTime, useTime, site, qrCode, imp_uid);
	}
}
