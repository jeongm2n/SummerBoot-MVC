package com.spring.summerboot2.branch;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.spring.summerboot2.DBconn;

public class WashlistDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private ResultSet rs;
	
	public List<WashlistVO> washList() {
		List<WashlistVO> list= new ArrayList<WashlistVO>();
		try {
			con = DBconn.getDBCP();
			
			String sql = "SELECT * FROM sb_carwash ORDER BY no ASC";
			System.out.println("prepareStatement : " + sql);
			
			pstmt = con.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String address = rs.getString("address");
				int sites = rs.getInt("sites");
				String tel = rs.getString("tel");
				String time = rs.getString("time");
				String img = rs.getString("img");
				
				System.out.println(no);
				System.out.println(name);
				System.out.println(address);
				System.out.println(sites);
				System.out.println(time);
				
				WashlistVO vo = new WashlistVO(no, name, address, sites, tel, time, img);
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
}
