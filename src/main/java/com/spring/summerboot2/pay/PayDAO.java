package com.spring.summerboot2.pay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;

import com.spring.summerboot2.DBconn;
import com.spring.summerboot2.cart.CartVO;

public class PayDAO {
	
	private PreparedStatement pstmt;
	private Connection conn;
	private ResultSet rs;
	
	public InformVO Load_Inform(String id) {
		try {
			InformVO inform = null;
			conn = DBconn.getDBCP();

			String sql = "SELECT tel, email, mem_name, delivery_addr, point from sb_member where id='" + id + "'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			rs.next();
			
			String email = rs.getString("email"); String u_name = rs.getString("mem_name"); String u_tel = rs.getString("tel").replace("-", "");
			int point = rs.getInt("point");	String d_address = rs.getString("delivery_addr");
			if(rs.wasNull()) {
				inform = new InformVO(u_tel, email, u_name, point);
			}
			else {
				String[] address = d_address.split("/");
				inform = new InformVO(u_tel, email, u_name, point, address[0], address[1], address[2], address[3], address[4], address[5]);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
			return inform;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String Load_address(String id) {
		try {
			InformVO inform = null;
			conn = DBconn.getDBCP();

			String sql = "SELECT address from sb_member where id='" + id + "'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			rs.next();
			
			String address = rs.getString("address");

			rs.close();
			pstmt.close();
			conn.close();
			
			return address;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int Load_Point(String id) {
		try {
			conn = DBconn.getDBCP();

			String sql = "SELECT point from sb_member where id='" + id + "'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			rs.next();
			int point = rs.getInt("point");
			
			rs.close();
			pstmt.close();
			conn.close();
			
			return point;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public String[] Load_CarWash(String no) {
		try {
			conn = DBconn.getDBCP();

			String sql = "SELECT name, img from sb_carwash where no='" + no + "'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			rs.next();
			String[] carwash = new String[2];
			
			carwash[0] = rs.getString("name");
			carwash[1] = rs.getString("img");
			
			rs.close();
			pstmt.close();
			conn.close();
			
			return carwash;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void Save_Inform(String id, String snssts, String state, String postcode, String city, String town,
			String street_add, String option_add, String save_add) {
		try {
			conn = DBconn.getDBCP();
			
			if(save_add.equals("동의")) {
				
				String address = postcode + "/" + state + "/" + city + "/" + town + "/" + street_add + "/" + option_add;
				
				String sql = "update sb_member set snssts = '" + snssts + "', delivery_addr = '" + address + "' where id = '" + id + "'";
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				
			}
			else {
				String sql = "update sb_member set snssts = '" + snssts + "' where id = '" + id + "'";
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
				
			}
			
			
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void pay_point(int point, int u_point, String id) {
		try {
			conn = DBconn.getDBCP();
			
			String sql = "update sb_member set point = ? where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, point - u_point);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void pay_after(String merchant_uid, String id, ArrayList<CartVO> product, InformVO inform) {
		try {
			conn = DBconn.getDBCP();
			
			String address = inform.getPostcode() + inform.getState() + inform.getCity() + inform.getTown() + inform.getStreet_add() + inform.getOption_add();
			String sql;	
			
			for(CartVO i_product : product) {
				sql = "insert into sb_purchase (order_num, member_id, product_id, mount, address) values (?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, merchant_uid);
				pstmt.setString(2, id);
				pstmt.setInt(3, i_product.getProduct_id());
				pstmt.setInt(4, i_product.getQuantity());
				pstmt.setString(5, address);
				pstmt.executeUpdate();
			}
			
			sql = "delete from sb_cart where member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void reservation_after(String merchant_uid, String id, String no, String date, String startTime, String useTime, String site) {
		try {
			conn = DBconn.getDBCP();
			
			String sql = "insert into sb_reservation (no, member_id, res_date, site, startTime, useTime, qr_img, order_num) values (?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(no));
			pstmt.setString(2, id);
			pstmt.setString(3, date);
			pstmt.setInt(4, Integer.parseInt(site));
			pstmt.setString(5, startTime);
			pstmt.setInt(6, Integer.parseInt(useTime));
			pstmt.setString(7, "1");
			pstmt.setString(8, merchant_uid);
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
