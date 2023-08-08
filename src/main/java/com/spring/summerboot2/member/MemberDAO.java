package com.spring.summerboot2.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.spring.summerboot2.DBconn;

public class MemberDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private ResultSet rs;
	
	
	public void join(MemberVO vo) {
		try {
			con = DBconn.getDBCP();
			
			String sql = "INSERT INTO sb_member(id, pwd, mem_name, tel, address) VALUES (?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getMem_name());
			pstmt.setString(4, vo.getTel());
			pstmt.setString(5, vo.getAddress());
			
			System.out.println("prepareStatement : " + sql);
			pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean login(String id, String pwd) {
		int count = 0;
		
		try {
			con = DBconn.getDBCP();
			
			String sql = "SELECT count(*) as cnt FROM sb_member";
			sql += " WHERE id = '" + id + "' AND pwd = '" + pwd + "'";
			
			System.out.println("prepareStatement : " + sql);
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);

			while(rs.next()) {
				count = rs.getInt("cnt");
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(count == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean overlappedID(String id) {
		int count = 0;
		
		try {
			con = DBconn.getDBCP();
			
			String sql = "SELECT count(*) as cnt FROM sb_member";
			sql += " WHERE id = '" + id + "'";
			
			System.out.println("prepareStatement : " + sql);
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);

			while(rs.next()) {
				count = rs.getInt("cnt");
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(count == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public List<MemberVO> my_info(String user_id) {
		List<MemberVO> list= new ArrayList<MemberVO>();
		try {
			con = DBconn.getDBCP();
			
			String sql = "SELECT * FROM sb_member where id=?";
			System.out.println("prepareStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("mem_name");
				String tel = rs.getString("tel");
				String address = rs.getString("address");
				int point = rs.getInt("point");
				
				System.out.println(id);
				System.out.println(pwd);
				System.out.println(name);
				System.out.println(tel);
				System.out.println(point);
				
				MemberVO vo = new MemberVO(id, pwd, name, tel, address, point);
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean pwd_change(String id, String origin_pwd, String new_pwd) {
		boolean change = false;
		try {
			int cnt=0;
			con = DBconn.getDBCP();

			String sql = "SELECT count(*) as cnt FROM sb_member WHERE id = '" + id + "' AND pwd = '" + origin_pwd + "'";
			System.out.println("prepareStatement : " + sql);
			pstmt = con.prepareStatement(sql);
			// 4) 실행
			rs = pstmt.executeQuery();
			// 5) 결과를 테이블에 출력
			
			while(rs.next()) {
				cnt = rs.getInt("cnt");
			}
			
			if (cnt == 0) {
				sql = "UPDATE member";
				sql += " SET pwd=? WHERE id = ?";
				System.out.println("prepareStatement : " + sql);
	
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, new_pwd);
				pstmt.setString(2, id);
	
				pstmt.executeUpdate();
				pstmt.close();
				
				change = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return change;
	}
	
	public boolean update(String user_id, String tel, String address) {
		boolean change = false;
		try {
			con = DBconn.getDBCP();
			
			String sql = "UPDATE sb_member";
			sql += " SET tel=?, address=? WHERE id = ?";
			System.out.println("prepareStatement : " + sql);

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tel);
			pstmt.setString(2, address);
			pstmt.setString(3, user_id);

			pstmt.executeUpdate();
			pstmt.close();
			
			change = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return change;
	}
}
