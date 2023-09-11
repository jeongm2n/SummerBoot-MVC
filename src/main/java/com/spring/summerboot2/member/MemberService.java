package com.spring.summerboot2.member;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.summerboot2.admin.OrderVO;

@Service
public interface  MemberService  {
	
	public void regist(MemberVO vo);
	
	public boolean login(String id, String pwd);
	public boolean overlappedID(String id);
	public boolean pwd_change(String id, String origin_pwd, String new_pwd);
	public boolean update(String user_id, String tel, String address, String email, String email_yn);
	public boolean findPW(String id, String name, String tel);
	
	public List<MemberVO> my_info(String user_id);
	public List<OrderVO> orderList(String id);
	public List<String> orderNum(String id);
	public void Add_review(String id, int product_id, String contents, int rating, String img);
	public void After_review(String order_num, int product_id);
	public void Update_rating(int product_id, int rating);
	public void update_status(String status, String order_num);
	public void pwd_change(String id, String new_pwd);
	
	public String findID(String name, String tel);
}
