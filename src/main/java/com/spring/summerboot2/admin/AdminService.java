package com.spring.summerboot2.admin;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.summerboot2.branch.WashlistDAO;
import com.spring.summerboot2.branch.WashlistVO;
import com.spring.summerboot2.member.MemberDAO;
import com.spring.summerboot2.member.MemberVO;
import com.spring.summerboot2.product.ProductVO;
import com.spring.summerboot2.reservation.*;

@Service
public class AdminService {
	public List<MemberVO> userList() {
		MemberDAO member = new MemberDAO();
		return member.userList();
	}
	
	public List<WashlistVO> washList() {
		WashlistDAO washlist = new WashlistDAO();
		return washlist.washList();
	}
	
	public List<ProductVO> productList() {
		AdminDAO dao = new AdminDAO();
		return dao.productList();
	}
	
	public boolean addProduct(ProductVO vo) {
		AdminDAO dao = new AdminDAO();
		return dao.add(vo);
	}
	
	public List<ReservationVO> reservationList(int no){
		ReservationDAO resdao = new ReservationDAO();
		return resdao.showList(no);
	}
}
