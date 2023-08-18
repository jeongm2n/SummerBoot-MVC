package com.spring.summerboot2.pay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.summerboot2.DBconn;

public class PayDAO {
	
	private PreparedStatement pstmt;
	private Connection conn;
	private ResultSet rs;
	
	public InformVO Load_Inform(String id, InformVO s_inform) {
		try {
			InformVO inform = null;
			conn = DBconn.getDBCP();

			if(s_inform == null) {
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
				
				inform = s_inform;
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
	
	public String[] Add_Session(Map<String, String> Inform) {
		String[] C_Inform = new String[2];
		String tel = Inform.get("tel");
		StringBuffer p_tel = new StringBuffer(tel);
		p_tel.insert(7, "-"); p_tel.insert(3, "-");
		C_Inform[0] = p_tel.toString();
		String state = Inform.get("state");
		String name = Inform.get("name");
		String postcode = Inform.get("postcode");
		String city = Inform.get("city");
		String town = Inform.get("town");
		String street_add = Inform.get("street_add");
		String option_add = Inform.get("option_add");

		C_Inform[1] = postcode + " ";
		switch(state) {
			case "강원특별자치도": case "제주특별자치도": case "세종특별자치시": C_Inform[1] += state + " "; break;
			case "부산": case "대구": case "인천": case "광주": case "대전": case "울산": C_Inform[1] += state + "광역시 "; break;
			case "경기": C_Inform[1] += state + "도 "; break;
			case "서울": C_Inform[1] += state + "특별시 "; break;
			case "충북": C_Inform[1] += "충청북도 "; break;
			case "충남": C_Inform[1] += "충청남도 "; break;
			case "전북": C_Inform[1] += "전라북도 "; break;
			case "전남": C_Inform[1] += "전라남도 "; break;
			case "경북": C_Inform[1] += "경상북도 "; break;
			case "경남": C_Inform[1] += "경상남도 "; break;
			default : break;
		}
		if(city.equals(null)) { }
		else { C_Inform[1] += city + " ";} 	
		C_Inform[1] += town + " ";
		C_Inform[1] += street_add + " ";
		C_Inform[1] += option_add;
		
		return C_Inform;
	}
	
	public void Save_Inform(String id, Map<String, String> inform) {
		try {
			conn = DBconn.getDBCP();

			String snssts = inform.get("snssts");
			
			if(inform.get("save_add").equals("동의")) {
				String state = inform.get("state");
				String postcode = inform.get("postcode");
				String city = inform.get("city");
				String town = inform.get("town");
				String street_add = inform.get("street_add");
				String option_add = inform.get("option_add");
				
				String address = postcode + "/" + state + "/" + city + "/" + town + "/" + street_add + "/" + option_add;
				
				String sql = "update sb_member set snssts = '" + snssts + "', delivery_addr = '" + address + "' where id = '" + id + "'";
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate(sql);
				
			}
			else {
				String sql = "update sb_member set snssts = '" + snssts + "' where id = '" + id + "'";
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate(sql);
				
			}
			
			
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
}
