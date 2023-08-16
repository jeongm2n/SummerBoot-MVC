package com.spring.summerboot2.pay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.spring.summerboot2.DBconn;

public class PayDAO {
	
	private PreparedStatement pstmt;
	private Connection conn;
	private ResultSet rs;
	
	public InformVO Load_Inform(String ID) {
		try {
			InformVO inform = null;
			conn = DBconn.getDBCP();
			
			String sql = "SELECT tel, delivery_address, mem_name from sb_reservation where id='" + ID + "'";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);
			
			while(rs.next()) {
				String u_name = rs.getString("mem_name");
				String u_tel = rs.getString("tel").replace("-", "");
				if(rs.getString("address").equals(null)) {
					inform = new InformVO(u_tel, u_name);	
				}
				else {
					String[] address = rs.getString("address").split("/");
					inform = new InformVO(u_tel, u_name, address[0], address[1], address[2], address[3], address[4], address[5]);
				}
				return inform;
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
