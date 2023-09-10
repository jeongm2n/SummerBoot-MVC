package com.spring.summerboot2.member;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.summerboot2.DBconn;
import com.spring.summerboot2.admin.OrderVO;

public class MemberDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private ResultSet rs;
	
	
	public void join(MemberVO vo) {
		try {
			con = DBconn.getDBCP();
			
			String sql = "INSERT INTO sb_member(id, pwd, mem_name, tel, email, email_yn, address) VALUES (?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getMem_name());
			pstmt.setString(4, vo.getTel());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getEmail_yn());
			pstmt.setString(7, vo.getAddress());
			
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
				String email = rs.getString("email");
				String email_yn = rs.getString("email_yn");
				String address = rs.getString("address");
				int point = rs.getInt("point");
				
				System.out.println(id);
				System.out.println(pwd);
				System.out.println(name);
				System.out.println(tel);
				System.out.println(email);
				System.out.println(email_yn);
				System.out.println(point);
				
				MemberVO vo = new MemberVO(id, pwd, name, tel, email, email_yn, address, point);
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
			
			System.err.println(cnt);
			
			if (cnt == 1) {
				sql = "UPDATE sb_member";
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
	
	public boolean update(String user_id, String tel, String address, String email, String email_yn) {
		boolean change = false;
		try {
			con = DBconn.getDBCP();
			
			String sql = "UPDATE sb_member";
			sql += " SET tel=?, address=?, email=?, email_yn=? WHERE id = ?";
			System.out.println("prepareStatement : " + sql);

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tel);
			pstmt.setString(2, address);
			pstmt.setString(3, email);
			pstmt.setString(4, email_yn);
			pstmt.setString(5, user_id);

			pstmt.executeUpdate();
			pstmt.close();
			
			change = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return change;
	}
	
	public List<MemberVO> userList(String searchCon, String search, String E_YN, int start) {
		List<MemberVO> list= new ArrayList<MemberVO>();
		try {
			con = DBconn.getDBCP();
			
			String sql = "SELECT * FROM sb_member WHERE 1=1";
			
			if(!search.equals("none")) {
				if(!searchCon.equals("0")) {
					if(searchCon.equals("id")) {
						sql += " AND id like '%"+search+"%'";
					} else if(searchCon.equals("name")) {
						sql += " AND mem_name like '%"+search+"%'";
					} else if(searchCon.equals("addr")) {
						sql += " AND address like '%"+search+"%'";
					}
				} else {
					sql += " AND (id like '%"+search+"%' OR mem_name like '%" + search + "%' OR address like '%" + search + "%')";
				}
			}
			
			if(!E_YN.equals("0")) {
				if(E_YN.equals("Y")) {
					sql += " AND email_yn = 'Y'";
				} else {
					sql += " AND email_yn = 'N'";
				}
			}
			
			sql += " ORDER BY id LIMIT " + start + ", 15";
			System.out.println("prepareStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("mem_name");
				String tel = rs.getString("tel");
				String address = rs.getString("address");
				int point = rs.getInt("point");
				String email = rs.getString("email");
				String email_yn = rs.getString("email_yn");
				
				MemberVO vo = new MemberVO(id, name, tel, address, point, email, email_yn);
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
	
	public int userCnt(String searchCon, String search, String E_YN) {
		int count = 0;
		try {
			con = DBconn.getDBCP();
			
			String sql = "SELECT count(*) as cnt FROM sb_member WHERE 1=1";
			
			if(!search.equals("none")) {
				if(!searchCon.equals("0")) {
					if(searchCon.equals("id")) {
						sql += " AND id like '%"+search+"%'";
					} else if(searchCon.equals("name")) {
						sql += " AND mem_name like '%"+search+"%'";
					} else if(searchCon.equals("addr")) {
						sql += " AND address like '%"+search+"%'";
					}
				} else {
					sql += " AND (id like '%"+search+"%' OR mem_name like '%" + search + "%' OR address like '%" + search + "%')";
				}
			}
			
			if(!E_YN.equals("0")) {
				if(E_YN.equals("Y")) {
					sql += " AND email_yn = 'Y'";
				} else {
					sql += " AND email_yn = 'N'";
				}
			}
			
			System.out.println("prepareStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
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
	
	public List<OrderVO> orderList(String id) {
		List<OrderVO> list= new ArrayList<OrderVO>();
		try {
			con = DBconn.getDBCP();
			
			String sql = "SELECT pur.order_num, pur.product_id, p.img, p.name, p.price, pur.mount, pur.pur_date, pur.address, pur.tracking, pur.status, pur.imp_uid, pur.review FROM sb_purchase as pur INNER JOIN sb_product as p on pur.product_id = p.product_id WHERE member_id = '" + id + "'ORDER BY pur.pur_date, pur.order_num ASC";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String order_num = rs.getString("pur.order_num");
				int product_id = rs.getInt("pur.product_id");
				String img = rs.getString("p.img");
				String product_name = rs.getString("p.name");
				int price = rs.getInt("p.price");
				int mount = rs.getInt("mount");
				Date pur_date = rs.getDate("pur_date");
				String p_address[] = rs.getString("address").split("/");
				
				String post = p_address[0];
				String address = p_address[1] + " " + p_address[2] + " " + p_address[3] + " " + p_address[4];
	
				if(p_address.length==6) {
					address += p_address[5];
				}

				int tracking = rs.getInt("tracking");
				String status = rs.getString("status");
				String imp_uid = rs.getString("imp_uid");
				
				int review = rs.getInt("review");
				
				OrderVO vo = new OrderVO(order_num, product_id, img, product_name, price, mount, pur_date, post, address, tracking, status, imp_uid, review);
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
	
	public List<String> orderNum(String id) {
		List<String> ordernum = new ArrayList<String>();
		try {
			con = DBconn.getDBCP();
			
			String sql = "SELECT DISTINCT pur.order_num FROM sb_purchase as pur WHERE member_id = '" + id + "' ORDER BY pur.order_num ASC";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String num = rs.getString("pur.order_num");
				ordernum.add(num);
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return ordernum;
	}
	
	public void Add_review(String id, int product_id, String contents, int rating, String img) {
		try {
			con = DBconn.getDBCP();
					
			String sql = "insert into sb_reviews (member_id, point, img, contents, product_id) values (?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, rating);
			pstmt.setString(3, img);
			pstmt.setString(4, contents);
			pstmt.setInt(5, product_id);
			pstmt.executeUpdate();
					
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			
	}
	
	public void After_review(String order_num, int product_id) {
		try {
			con = DBconn.getDBCP();
			
			String sql = "update sb_purchase set review = ? where order_num = ? AND product_id = ?";
			pstmt = con.prepareStatement(sql);
			System.out.print(sql);
			pstmt.setInt(1, 1);
			pstmt.setString(2, order_num);
			pstmt.setInt(3, product_id);
			pstmt.executeUpdate();
					
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void Update_rating(int product_id, int rating) {
		try {
			con = DBconn.getDBCP();
			
			String sql = "update sb_product set rating = ? where product_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rating);
			pstmt.setInt(2, product_id);
			pstmt.executeUpdate();
					
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void update_status(String status, String order_num) {
		try {
			con = DBconn.getDBCP();
			
			String sql = "update sb_purchase set status = ? WHERE order_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, status);
			pstmt.setString(2, order_num);
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void request_refund(String order_num, int bank, String name, int account, int tel) {
		try {
			con = DBconn.getDBCP();
			
			String sql = "update sb_purchase set refundbank = ?, rerfundname = ?, refundaccount = ?, refundtel =? WHERE order_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bank);
			pstmt.setString(2, name);
			pstmt.setInt(3, account);
			pstmt.setInt(4, tel);
			pstmt.setString(5, order_num);
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
