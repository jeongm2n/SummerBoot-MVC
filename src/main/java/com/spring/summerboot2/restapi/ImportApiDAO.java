package com.spring.summerboot2.restapi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.spring.summerboot2.DBconn;

public class ImportApiDAO {
	
	private PreparedStatement pstmt;
	private Connection conn;
	private ResultSet rs;
	
	public String[] vInformLoad(String order_num){
		try {
			conn = DBconn.getDBCP();
			
			String[] v_data = new String[4];
			
			String sql = "SELECT refundbank, refundname, refundaccount, refundtel from sb_purchase where order_num ='" + order_num + "'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			rs.next();
			
			v_data[0] = rs.getString("refundbank");
			v_data[1] = rs.getString("refundname");
			v_data[2] = rs.getString("refundaccount");
			v_data[3] = rs.getString("refundtel");
			
			rs.close();
			pstmt.close();
			conn.close();
			
			return v_data;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
