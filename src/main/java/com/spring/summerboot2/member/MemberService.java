package com.spring.summerboot2.member;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface  MemberService  {
	
	public void regist(MemberVO vo);
	
	public boolean login(String id, String pwd);
	public boolean overlappedID(String id);
	public boolean pwd_change(String id, String origin_pwd, String new_pwd);
	public boolean update(String user_id, String tel);
	
	public List<MemberVO> my_info(String user_id);
	
}
