package com.spring.summerboot2.member;

import java.util.List;

import org.springframework.stereotype.Service;

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
	public boolean update(String user_id, String tel, String address) {
		MemberDAO dao =  new MemberDAO();
		return dao.update(user_id, tel, address);
	}
	
	
}