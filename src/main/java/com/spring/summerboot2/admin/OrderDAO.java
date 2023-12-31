package com.spring.summerboot2.admin;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.spring.summerboot2.DBconn;

public class OrderDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private ResultSet rs;
	
	public List<OrderVO> orderList() {
		List<OrderVO> list= new ArrayList<OrderVO>();
		try {
			con = DBconn.getDBCP();
			
//			추가로 만든 칼럼들도 조회 할 수 있게
			String sql = "SELECT pur.order_num, pur.member_id, pur.product_id, p.name, p.price, pur.mount, pur.pur_date, pur.address, tracking, status, imp_uid FROM sb_purchase as pur INNER JOIN sb_product as p on pur.product_id = p.product_id ORDER BY pur.pur_date, pur.order_num ASC";

			System.out.println("prepareStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String order_num = rs.getString("pur.order_num");
				String member_id = rs.getString("pur.member_id");
				int product_id = rs.getInt("pur.product_id");
				String product_name = rs.getString("p.name");
				int price = rs.getInt("p.price");
				int mount = rs.getInt("mount");
				Date pur_date = rs.getDate("pur_date");
				String address[] = rs.getString("address").split("/");
				
				String post = address[0];
				String str1 = address[1] + " " + address[2] + " " + address[3];
				String str2 = address[4];
				
				if(address.length==6) {
					str2 += address[5];
				}

				String tracking = rs.getString("tracking");
				String status = rs.getString("status");
				String imp_uid = rs.getString("imp_uid");
				System.out.println(order_num+","+ member_id+","+product_id+","+mount+","+pur_date+","+address+","+tracking+","+status+","+imp_uid);
				
				OrderVO vo = new OrderVO(order_num, member_id, product_id, product_name, price, mount, pur_date, post, str1, str2, tracking, status, imp_uid);
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
	
	public List<OrderVO> filterOrderList(String column, String str) {
		List<OrderVO> list= new ArrayList<OrderVO>();
		try {
			con = DBconn.getDBCP();
			
			String sql;
			if(column.equals("pur_date")) {
				String str1 = str + " 00:00:00";
				String str2 = str + " 23:59:59";
				sql = "SELECT pur.order_num, pur.member_id, pur.product_id, p.name, p.price, pur.mount, pur.pur_date, pur.address tracking, status, imp_uid FROM sb_purchase as pur INNER JOIN sb_product as p on pur.product_id = p.product_id "
						+ "WHERE "+column+" BETWEEN '"+str1+"' AND '"+str2+"' ORDER BY pur.pur_date,pur.order_num ASC";
			}
			else{
				sql = "SELECT pur.order_num, pur.member_id, pur.product_id, p.name, p.price, pur.mount, pur.pur_date, pur.address tracking, status, imp_uid FROM sb_purchase as pur INNER JOIN sb_product as p on pur.product_id = p.product_id "
						+ "WHERE "+column+"='"+str+"' ORDER BY pur.pur_date,pur.order_num ASC";
			}
					
			System.out.println("prepareStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String order_num = rs.getString("pur.order_num");
				String member_id = rs.getString("pur.member_id");
				int product_id = rs.getInt("pur.product_id");
				String product_name = rs.getString("p.name");
				int price = rs.getInt("p.price");
				int mount = rs.getInt("mount");
				Date pur_date = rs.getDate("pur_date");
				String address[] = rs.getString("address").split("/");
				
				String post = address[0];
				String str1 = address[1] + " " + address[2] + " " + address[3];
				String str2 = address[4];
				
				if(address.length==6) {
					str2 += address[5];
				}
				
				String tracking = rs.getString("tracking");
				String status = rs.getString("status");
				String imp_uid = rs.getString("imp_uid");
				System.out.println(order_num+","+ member_id+","+product_id+","+mount+","+pur_date+","+address+","+tracking+","+status+","+imp_uid);
				
				OrderVO vo = new OrderVO(order_num, member_id, product_id, product_name, price, mount, pur_date, post, str1, str2, tracking, status, imp_uid);
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
	
	public OrderVO Load_Account(String order_num) {
		List<OrderVO> list= new ArrayList<OrderVO>();
		try {
			con = DBconn.getDBCP();
			
			OrderVO account = null;
			
			String sql = "SELECT refundbank, refundname, refundaccount, refundtel FROM sb_purchase WHERE order_num = '" + order_num +"'";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			rs.next();
			int refundbank = rs.getInt("refundbank");
			String refundname = rs.getString("refundname");
			String refundaccount = rs.getString("refundaccount");
			int refundtel = rs.getInt("refundtel");
			account = new OrderVO(refundbank, refundname, refundaccount, refundtel);
			
			
			rs.close();
			pstmt.close();
			con.close();
			
			return account;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void add_tracking(String order_num, String tracking) {
		try {
			con = DBconn.getDBCP();
			
			String sql = "update sb_purchase set tracking = ? WHERE order_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tracking);
			pstmt.setString(2, order_num);
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
