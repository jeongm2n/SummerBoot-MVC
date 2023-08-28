package com.spring.summerboot2.community;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.spring.summerboot2.DBconn;
import com.spring.summerboot2.member.MemberVO;

public class InquiryDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private ResultSet rs;
	
	public boolean insert_inquiry(InquiryVO vo) {
		try {
			con = DBconn.getDBCP();
			
			String sql = "INSERT INTO sb_inquiry(writer, category, title, content, secret, state) VALUES (?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getCategory());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getSecret());
			pstmt.setString(6, vo.getState());
			
			System.out.println("prepareStatement : " + sql);
			pstmt.executeUpdate();
			pstmt.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
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
			
			sql += " ORDER BY ins_date LIMIT " + start + ", 10";
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
	
}
