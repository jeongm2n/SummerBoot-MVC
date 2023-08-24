package com.spring.summerboot2.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.spring.summerboot2.DBconn;
import com.spring.summerboot2.community.InquiryVO;

public class AdminCommunityDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private ResultSet rs;
	
	public List<InquiryVO> inquiryList() {
		List<InquiryVO> list= new ArrayList<InquiryVO>();
		try {
			con = DBconn.getDBCP();
			
			String sql = "SELECT * FROM sb_inquiry ORDER BY q_no ASC";
			System.out.println("prepareStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int q_no = rs.getInt("q_no");
				String writer = rs.getString("writer");
				String category = rs.getString("category");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String secret = rs.getString("secret");
				Timestamp ins_date = rs.getTimestamp("ins_date");
				String answer = rs.getString("answer");
				Timestamp answer_date = rs.getTimestamp("answer_date");
				String state = rs.getString("state");
				
				InquiryVO vo = new InquiryVO(q_no, writer, category, title, content, secret, ins_date, answer, answer_date, state);
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
	
	public int deleteInquiry(int q_no) {
		int delete = 0;
		try {
			con = DBconn.getDBCP();
			
			String sql = "DELETE FROM sb_inquiry";
			sql += " WHERE q_no = ?";
			System.out.println("prepareStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, q_no);
			
			delete = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return delete;
	}
	
	public int update(InquiryVO vo) {
		int change = 0;
		Timestamp now = new Timestamp(System.currentTimeMillis());
		try {
			con = DBconn.getDBCP();
			
			String sql = "UPDATE sb_inquiry";
			sql += " SET answer=?, answer_date=?, state=? WHERE q_no = ?";
			System.out.println("prepareStatement : " + sql);

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getAnswer());
			pstmt.setTimestamp(2, now);
			pstmt.setString(3, vo.getState());
			pstmt.setInt(4, vo.getQ_no());

			change = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return change;
	}
}
