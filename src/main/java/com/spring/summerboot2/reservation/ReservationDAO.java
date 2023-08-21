package com.spring.summerboot2.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
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
	
	public List<ReservationVO> showresList(int no){
		PreparedStatement pstmt;
		List<ReservationVO> resVO = new ArrayList<>();
		ReservationVO vo;
		
		try {
			conn = DBconn.getDBCP();
			
			String sql = "SELECT member_id, res_date, site, startTime, useTime FROM sb_reservation WHERE no="+no
					+ " ORDER BY res_date, startTime ASC";
			
			System.out.println("sql : " + sql);
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);
			
			while(rs.next()) {
				String member_id = rs.getString("member_id");
				String res_date = rs.getString("res_date");
				int site = rs.getInt("site");
				String startTime = rs.getString("startTime");
				String useTime = rs.getString("useTime");
				
				vo = new ReservationVO(member_id,res_date,site,startTime,useTime);
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
}
