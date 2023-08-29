package com.spring.summerboot2.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.summerboot2.DBconn;
import com.spring.summerboot2.community.InquiryVO;

public class AdminCommunityDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private ResultSet rs;
	
	public List<InquiryVO> inquiryMain() {
		List<InquiryVO> list= new ArrayList<InquiryVO>();
		try {
			con = DBconn.getDBCP();
			
			String sql = "SELECT * FROM sb_inquiry WHERE state='답변대기' ORDER BY ins_date LIMIT 0,6";
			
			System.out.println("prepareStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String category = rs.getString("category");
				String title = rs.getString("title");
				Timestamp ins_date = rs.getTimestamp("ins_date");
				
				InquiryVO vo = new InquiryVO(category, title, ins_date);
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
	
	public int InquiryCount() {
		int count = 0; 
		try {
			con = DBconn.getDBCP();
			
			String sql = "SELECT count(*) as cnt FROM sb_inquiry WHERE state='답변대기'";
			
			System.out.println("preparedStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				count = rs.getInt("cnt");
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public List<InquiryVO> inquiryList(int start, String cate, String searchCon, String search, String stateCon) {
		List<InquiryVO> list= new ArrayList<InquiryVO>();
		try {
			con = DBconn.getDBCP();
			
			String sql = "SELECT * FROM sb_inquiry WHERE 1=1";
			
			if(!cate.equals("0")) {
				if(cate.equals("shop")) {
					sql += " AND category like '쇼핑%'";
				} else if(cate.equals("car")) {
					sql += " AND category like '세차%'";
				} else if(cate.equals("etc")) {
					sql += " AND category like '기타%'";
				}
			}
			
			if(!search.equals("none")) {
				if(!searchCon.equals("0")) {
					if(searchCon.equals("title")) {
						sql += " AND title like '%"+search+"%'";
					} else if(searchCon.equals("writer")) {
						sql += " AND writer like '%"+search+"%'";
					}
				} else {
					sql += " AND (writer like '%"+search+"%' OR title like '%" + search + "%')";
				}
			}
			
			if(!stateCon.equals("0")) {
				if(stateCon.equals("wait")) {
					sql += " AND state='답변대기'";
				} else {
					sql += " AND state='답변완료'";
				}
			}
			
			sql += " ORDER BY ins_date LIMIT " + start + ", 20";
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
	
	public int InquiryCount(String category, String searchCon, String search, String stateCon) {
		int count = 0; 
		try {
			con = DBconn.getDBCP();
			
			String sql = "SELECT count(*) as cnt FROM sb_inquiry WHERE 1=1";
			
			if(!category.equals("0")) {
				if(category.equals("shop")) {
					sql += " AND category like '쇼핑%'";
				} else if(category.equals("car")) {
					sql += " AND category like '세차%'";
				} else if(category.equals("etc")) {
					sql += " AND category like '기타%'";
				}
			}
			
			if(!search.equals("none")) {
				if(!searchCon.equals("0")) {
					if(searchCon.equals("title")) {
						sql += " AND title like '%"+search+"%'";
					} else if(searchCon.equals("writer")) {
						sql += " AND writer like '%"+search+"%'";
					}
				} else {
					sql += " AND (writer like '%"+search+"%' OR title like '%" + search + "%')";
				}
			}
			
			if(!stateCon.equals("0")) {
				if(stateCon.equals("wait")) {
					sql += " AND state='답변대기'";
				} else {
					sql += " AND state='답변완료'";
				}
			}
			
			System.out.println("preparedStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				count = rs.getInt("cnt");
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	

	public Map<String, Object> qna(int q_no) {
		Map<String, Object> inquiry = new HashMap<String, Object>();
		try {
			con = DBconn.getDBCP();
			
			String sql = "SELECT writer, category, title, content, ins_date FROM sb_inquiry WHERE q_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, q_no);
			System.out.println("prepareStatement : " + sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String writer = rs.getString("writer");
				String category = rs.getString("category");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp ins_date = rs.getTimestamp("ins_date");
				
				inquiry.put("writer", writer);
				inquiry.put("category", category);
				inquiry.put("title", title);
				inquiry.put("content", content);
				inquiry.put("ins_date", ins_date);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return inquiry;
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
