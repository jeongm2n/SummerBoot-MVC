package com.spring.summerboot2.member;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.summerboot2.admin.OrderVO;
import com.spring.summerboot2.shop.ShopDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Override
	public void regist(MemberVO vo) {
		MemberDAO dao =  new MemberDAO();
		
		System.err.println("serviceImpl");
		dao.join(vo);
	}

	@Override
	public boolean login(String id, String pwd) {
		MemberDAO dao =  new MemberDAO();
		return dao.login(id, pwd);
	}

	@Override
	public boolean overlappedID(String id) {
		MemberDAO dao =  new MemberDAO();
		return dao.overlappedID(id);
	}

	@Override
	public List<MemberVO> my_info(String user_id) {
		MemberDAO dao =  new MemberDAO();
		return dao.my_info(user_id);
	}

	@Override
	public boolean pwd_change(String id, String origin_pwd, String new_pwd) {
		MemberDAO dao =  new MemberDAO();
		return dao.pwd_change(id, origin_pwd, new_pwd);
	}

	@Override
	public boolean update(String user_id, String tel, String address, String email, String email_yn) {
		MemberDAO dao =  new MemberDAO();
		return dao.update(user_id, tel, address, email, email_yn);
	}
	
	public List<OrderVO> orderList(String id){
		MemberDAO dao =  new MemberDAO();
		return dao.orderList(id);
	}
	
	public List<String> orderNum(String id) {
		MemberDAO dao =  new MemberDAO();
		return dao.orderNum(id);
	}
	
	public void Add_review(String id, int product_id, String contents, int rating, String img) {
		MemberDAO dao = new MemberDAO();
		dao.Add_review(id, product_id, contents, rating, img);
	}
	
	public void After_review(String order_num, int product_id) {
		MemberDAO dao = new MemberDAO();
		dao.After_review(order_num, product_id);
	}
	
	public void Update_rating(int product_id, int rating) {
		MemberDAO dao = new MemberDAO();
		dao.Update_rating(product_id, rating);
	}
	
	public void update_status(String status, String order_num) {
		MemberDAO dao =  new MemberDAO();
		dao.update_status(status, order_num);
	}
	
	public void request_refund(String order_num, int bank, String name, String account, int tel) {
		MemberDAO dao =  new MemberDAO();
		dao.request_refund(order_num, bank, name, account, tel);
	}
	
}