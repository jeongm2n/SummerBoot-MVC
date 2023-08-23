package com.spring.summerboot2.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import com.spring.summerboot2.DBconn;

public class ReservationDAO {

	private Connection conn;
	private ResultSet rs;
	
	public List<ReservationVO> chkReservation1(int no, String date){
		List<ReservationVO> forres1 = new ArrayList();
		PreparedStatement pstmt;
		try {
			conn = DBconn.getDBCP();
			
			String startTime;
			String useTime;
			
			String sql = "SELECT startTime,useTime FROM sb_reservation WHERE no="+no+" AND res_date='"+date+"'";
			
			System.out.println("sql : " + sql);
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);

			while(rs.next()) {
				startTime = rs.getString("startTime");
				useTime = rs.getString("useTime");
				ReservationVO resVO = new ReservationVO(startTime,useTime);
				forres1.add(resVO);
				System.out.println(startTime);
				System.out.println(useTime);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forres1;
	}
	
	public List<Integer> chkSite(int no, String date, String startTime){
		PreparedStatement pstmt;

		List<Integer> sites = new ArrayList();
		sites.add(2);
		for (int i = 1; i < 9; i++) {
            sites.add(0);
        }
		
		try {
			conn = DBconn.getDBCP();
	
			String sql = "SELECT site FROM sb_reservation WHERE no="+no+" AND res_date='"+date+"' AND startTime='"+startTime+"'"
					+ " ORDER BY site ASC";

			System.out.println("sql : " + sql);
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);
			
			while(rs.next()) {
				int rs_site = rs.getInt("site");
				sites.set(rs_site,1);
				System.out.println(rs_site);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sites;
	}
	
	public List<ReservationVO> showresList(int no, String res_date){
		PreparedStatement pstmt;
		List<ReservationVO> resVO = new ArrayList<>();
		ReservationVO vo;
		
		try {
			conn = DBconn.getDBCP();
			
			String sql = "SELECT res_no, member_id, site, startTime, useTime FROM sb_reservation WHERE no="+no
					+ " AND res_date='"+res_date+"' ORDER BY startTime,site ASC";
			
			System.out.println("sql : " + sql);
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);
			
			while(rs.next()) {
				int res_no = rs.getInt("res_no");
				String member_id = rs.getString("member_id");
				int site = rs.getInt("site");
				String startTime = rs.getString("startTime");
				int useTime = rs.getInt("useTime");
				
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		        LocalTime parsedTime = LocalTime.parse(startTime, formatter);
		        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("HH:mm");
		        startTime = parsedTime.format(outputFormatter);
		        
		        LocalTime newTime = parsedTime.plusMinutes(useTime);
		        
				String endTime = newTime.format(outputFormatter);
				System.out.println("startTime, endTime : " + startTime +","+ endTime);
				vo = new ReservationVO(res_no,member_id,site,startTime,endTime);
				resVO.add(vo);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return resVO;
	}
	
	public int deleteres(int res_no) {
		PreparedStatement pstmt;
		int result = 0;
		try {
			conn = DBconn.getDBCP();
			
			String sql = "DELETE FROM sb_reservation WHERE res_no="+res_no;
			System.out.println("sql : " + sql);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			result = 1;
			
			pstmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
