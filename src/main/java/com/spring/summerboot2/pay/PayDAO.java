package com.spring.summerboot2.pay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;

import com.spring.summerboot2.DBconn;

public class PayDAO {
	
	private PreparedStatement pstmt;
	private Connection conn;
	private ResultSet rs;
	
	public InformVO Load_Inform(String id, boolean s_inform) {
		try {
			InformVO inform = null;
			conn = DBconn.getDBCP();

			if(!s_inform) {
				String sql = "SELECT tel, mem_name, delivery_addr, point from sb_member where id='" + id + "'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery(sql);
				rs.next();
				
				String u_name = rs.getString("mem_name");
				String u_tel = rs.getString("tel").replace("-", "");
				int point = rs.getInt("point");
				String d_address = rs.getString("delivery_addr");
				if(rs.wasNull()) {
					inform = new InformVO(u_tel, u_name, point);
				}
				else {
					String[] address = d_address.split("/");
					inform = new InformVO(u_tel, u_name, point, address[0], address[1], address[2], address[3], address[4], address[5]);
				}
			}
			else {
				String sql = "SELECT point from sb_member where id='" + id + "'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery(sql);
				rs.next();
				int point = rs.getInt("point");
			
				inform.setPoint(point);
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

	public void pay_after(int point, String merchant_uid, String id, ArrayList<ProductVO> product, InformVO inform) {
		try {
			conn = DBconn.getDBCP();
			LocalDate now = LocalDate.now();
			
			String address = inform.getPostcode() + inform.getState() + inform.getCity() + inform.getTown() + inform.getStreet_add() + inform.getOption_add();
			String sql;
			
			for(ProductVO i_product : product) {
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
			
			if(point != 0) {
				sql = "update sb_member set point = ? where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, inform.getPoint() - point);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
			}
			
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
}
