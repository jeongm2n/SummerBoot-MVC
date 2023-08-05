package com.spring.summerboot2.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private DataSource dataFactory;
	private ResultSet rs;
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");

			dataFactory = (DataSource) envContext.lookup("jdbc/washboot");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void join(MemberVO vo) {
		try {
			con = dataFactory.getConnection();
			
			String sql = "INSERT INTO member(id, pwd, name, tel) VALUES (?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getTel());
			
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
			con = dataFactory.getConnection();
			
			String sql = "SELECT count(*) as cnt FROM member";
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
			con = dataFactory.getConnection();
			
			String sql = "SELECT count(*) as cnt FROM member";
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
}
