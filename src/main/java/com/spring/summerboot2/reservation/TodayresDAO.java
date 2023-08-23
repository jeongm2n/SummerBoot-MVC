package com.spring.summerboot2.reservation;

import com.spring.summerboot2.DBconn;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class TodayresDAO {

    private Connection con;
    private PreparedStatement pstmt;
    private ResultSet rs;
    public List<ReservationVO> todayresList(String param) {
        List<ReservationVO> list = new ArrayList<ReservationVO>();
        if (param == null) {
            param = "1";
        }
        try {
            con = DBconn.getDBCP();
            String sql = "SELECT no, member_id, res_date, site, startTime, useTime FROM sb_reservation WHERE no = '" + param + "'";
//            "SELECT no, member_id, res_date, site, startTime, useTime FROM sb_reservation WHERE no = '" + param + "' and DATE_FORMAT(STR_TO_DATE(res_date, '%m-%d'), '%m-%d')=date_format(curdate(), '%m-%d') order by startTime";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int no = rs.getInt("no");
                String id = rs.getString("member_id");
                String date = rs.getString("res_date");
                int site = rs.getInt("site");
                String stime = rs.getString("startTime");
                String utime = rs.getString("useTime");

                ReservationVO vo = new ReservationVO(no, id, date, site, stime, utime);
                list.add(vo);
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
