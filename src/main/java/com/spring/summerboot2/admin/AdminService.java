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
		return dao.addProduct(vo);
	}
	
	public boolean addStore(WashlistVO vo) {
		AdminDAO dao = new AdminDAO();
		return dao.addStore(vo);
	}
	
	public boolean overlappedName(String name) {
		AdminDAO dao = new AdminDAO();
		return dao.overlapped(name);
	}
	
	public boolean updateStore(WashlistVO vo) {
		AdminDAO dao = new AdminDAO();
		return dao.update(vo);
	}
	
	public boolean updateStoreImg(WashlistVO vo) {
		AdminDAO dao = new AdminDAO();
		return dao.updateImg(vo);
	}
	
	public boolean deleteStore(int no) {
		AdminDAO dao = new AdminDAO();
		return dao.deleteStore(no);
	}
	
	public List<ReservationVO> reservationList(int no){
		ReservationDAO resdao = new ReservationDAO();
		return resdao.showList(no);
	}
}
