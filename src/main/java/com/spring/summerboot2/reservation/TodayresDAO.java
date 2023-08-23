package com.spring.summerboot2.reservation;

import com.spring.summerboot2.DBconn;
import org.springframework.stereotype.Component;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class TodayresDAO {

    private Connection con;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public List<Map<String, String>> todayresList(int no) {
        //carwash_no: 지점1~4까지, 지점별 startTime: 9~23시까지 조회하여 sql문에서 데이터출력
        List<Map<String, String>> resultList = new ArrayList<>();
        try {
            con = DBconn.getDBCP();
            String sql = "select r.*, c.sites from sb_reservation r join sb_carwash c on r.no = c.no where res_date = date_format(curdate(), '%m-%d') and r.no = '" + no + "';";

            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Map<String, String> result = new HashMap<>();
                String resNo = rs.getString("res_no");
                String memberId = rs.getString("member_id");
                String resDate = rs.getString("res_date");
                String site = rs.getString("site");
                String startTime = rs.getString("startTime");
                String useTime = rs.getString("useTime");
                String sites = rs.getString("sites");
                result.put("resNo", resNo);
                result.put("memberId", memberId);
                result.put("resDate", resDate);
                result.put("site", site);
                result.put("startTime", startTime);
                result.put("useTime", useTime);
                result.put("sites", sites);
                resultList.add(result);
            }
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultList;
    }
}
