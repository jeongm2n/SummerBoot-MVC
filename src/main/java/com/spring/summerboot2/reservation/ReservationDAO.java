package com.spring.summerboot2.reservation;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.spring.summerboot2.DBconn;
import com.spring.summerboot2.shop.ReviewVO;

public class ReservationDAO {

	private Connection conn;
	private ResultSet rs;
	
	public List<Integer> chkSite(int no, String date, String startTime, int useTime){
		PreparedStatement pstmt;

		List<Integer> sites = new ArrayList();
		sites.add(2);
		for (int i = 1; i < 9; i++) {
            sites.add(0);
        }
		
		try {
			conn = DBconn.getDBCP();
	
			String sql = "select distinct site from sb_reservation where no="+no+" and res_date='"+date+"' "
					+ "and (startTime between time_format('"+startTime+"','%T') "
					+ "and (SEC_TO_TIME(TIME_TO_SEC('"+startTime+"') + (118 * "+useTime+"))) "
					+ "or date_add(startTime, interval useTime minute) between time_format('"+startTime+"','%T') "
							+ "and SEC_TO_TIME(TIME_TO_SEC('"+startTime+"') + (118 * "+useTime+")))";

			System.out.println("sql : " + sql);
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);
			
			while(rs.next()) {
				int rs_site = rs.getInt("site");
				sites.set(rs_site,1);
				System.out.print(rs_site+", ");
			}
			System.out.println("");
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sites;
	}
	
	private String timeCal(String startTime, int useTime) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
        LocalTime parsedTime = LocalTime.parse(startTime, formatter);
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("HH:mm");
        startTime = parsedTime.format(outputFormatter);
        
        LocalTime newTime = parsedTime.plusMinutes(useTime);
        
		String endTime = newTime.format(outputFormatter);
		System.out.println("startTime, endTime : " + startTime +","+ endTime);
		
		return endTime;
	}
	
	public List<ReservationVO> showresList(int no, String res_date){
		PreparedStatement pstmt;
		List<ReservationVO> resVO = new ArrayList();
		ReservationVO vo;
		
		try {
			conn = DBconn.getDBCP();
			
			String sql = "SELECT res_no, order_num, member_id, site, startTime, useTime FROM sb_reservation WHERE no="+no
					+ " AND res_date='"+res_date+"' ORDER BY startTime,site ASC";
			
			System.out.println("sql : " + sql);
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);
			
			while(rs.next()) {
				int res_no = rs.getInt("res_no");
				String order_num = rs.getString("order_num");
				String member_id = rs.getString("member_id");
				int site = rs.getInt("site");
				String startTime = rs.getString("startTime").substring(0,5);
				int useTime = rs.getInt("useTime");
				
				String endTime = timeCal(startTime,useTime);
				vo = new ReservationVO(res_no,order_num,member_id,site,startTime,endTime);
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
	
	public List<ReservationVO> myres(String user_id){
		PreparedStatement pstmt;
		List<ReservationVO> res = new ArrayList();
		ReservationVO vo;
		
		try {
			conn = DBconn.getDBCP();
			
			String sql = "SELECT order_num, sb_carwash.no, name, res_date, site, startTime, useTime, qr_img, res_no, review FROM sb_reservation, sb_carwash "
					+ "WHERE member_id='"+user_id+"' AND sb_carwash.no = sb_reservation.no";
			
			System.out.println("sql : " + sql);
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);
			
			while(rs.next()) {
				String startTime = rs.getString("startTime").substring(0,5);
				int useTime = rs.getInt("useTime");
				
				String endTime = timeCal(startTime,useTime);
				vo = new ReservationVO(rs.getString("order_num"),rs.getString("name"),rs.getString("res_date"),rs.getInt("site"),startTime,
						Integer.toString(useTime),endTime,rs.getString("qr_img"),rs.getInt("sb_carwash.no"), rs.getInt("res_no"), rs.getBoolean("review"));
				res.add(vo);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public boolean reviewInsert(String id, String text, int rating, int store, int res_no) {
		PreparedStatement pstmt;
		try {
			conn = DBconn.getDBCP();
			
			String sql = "INSERT INTO sb_reviews(member_id, point, contents, carwash_no) VALUES (?, ?, ?, ?)";
			
			System.out.println("sql : " + sql);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setInt(2, rating);
			pstmt.setString(3, text);
			pstmt.setInt(4, store);
			
			if(pstmt.executeUpdate() == 1) {
				sql = "UPDATE sb_reservation SET review=1 WHERE res_no = ?";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, res_no);
				pstmt.executeUpdate();
				return true;
			}
			
			pstmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public List<ReviewVO> reviewList(int store){
		PreparedStatement pstmt;
		List<ReviewVO> review = new ArrayList();
		ReviewVO vo;
		
		try {
			conn = DBconn.getDBCP();
			
			String sql = "SELECT member_id, point, contents, DATE_FORMAT(rev_date, '%Y-%m-%d') as rev_date FROM sb_reviews WHERE carwash_no=" + store;
			
			System.out.println("sql : " + sql);
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(sql);
			
			while(rs.next()) {
				String member_id = rs.getString("member_id");
				int point = rs.getInt("point");
				String contents = rs.getString("contents");
				String date = rs.getString("rev_date");
				
				vo = new ReviewVO(member_id, point, contents, date);
				review.add(vo);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return review;
	}
}
