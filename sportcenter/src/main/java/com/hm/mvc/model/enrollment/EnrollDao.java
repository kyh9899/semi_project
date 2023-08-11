package com.hm.mvc.model.enrollment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.hm.mvc.common.jdbc.JDBCTemplate.close;

public class EnrollDao {
	public List<Enroll> findAllEnroll(Connection connection) {
        List<Enroll> enrolls = new ArrayList<>();
        String sql = "SELECT P.PG_TITLE, F.FC_NAME, C.CH_NAME, P.PG_TIME, P.PG_FEE, P.PG_MAX, P.PG_NUM, E.ERM_AVA " +
                "FROM ENROLLMENT E " +
                "JOIN PROGRAM P ON E.PG_CODE = P.PG_CODE " +
                "JOIN COACH C ON P.CH_CODE = C.CH_CODE " +
                "JOIN FACILITY F ON P.FC_CODE = F.FC_CODE";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                Enroll enroll = new Enroll();
                enroll.setPgTitle(resultSet.getString("PG_TITLE"));
                enroll.setFcName(resultSet.getString("FC_NAME"));
                enroll.setChName(resultSet.getString("CH_NAME"));
                enroll.setPgTime(resultSet.getString("PG_TIME"));
                enroll.setPgFee(resultSet.getString("PG_FEE"));
                enroll.setPgMax(resultSet.getInt("PG_MAX"));
                enroll.setPgNum(resultSet.getInt("PG_NUM"));
                enroll.setErmAva(resultSet.getString("ERM_AVA"));
                enrolls.add(enroll);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return enrolls;
    }
	public List<Enroll> searchCourses(Connection connection, String search) {
        List<Enroll> searchResults = new ArrayList<>();
        String sql = "SELECT P.PG_TITLE, F.FC_NAME, C.CH_NAME, P.PG_TIME, P.PG_FEE, P.PG_MAX, P.PG_NUM, E.ERM_AVA " +
                "FROM ENROLLMENT E " +
                "JOIN PROGRAM P ON E.PG_CODE = P.PG_CODE " +
                "JOIN COACH C ON P.CH_CODE = C.CH_CODE " +
                "JOIN FACILITY F ON P.FC_CODE = F.FC_CODE " +
                "WHERE P.PG_TITLE LIKE ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
        	pstmt.setString(1, "%" + search + "%");
            ResultSet resultSet = pstmt.executeQuery();
            
            while (resultSet.next()) {
                Enroll enroll = new Enroll();
                enroll.setPgTitle(resultSet.getString("PG_TITLE"));
                enroll.setFcName(resultSet.getString("FC_NAME"));
                enroll.setChName(resultSet.getString("CH_NAME"));
                enroll.setPgTime(resultSet.getString("PG_TIME"));
                enroll.setPgFee(resultSet.getString("PG_FEE"));
                enroll.setPgMax(resultSet.getInt("PG_MAX"));
                enroll.setPgNum(resultSet.getInt("PG_NUM"));
                enroll.setErmAva(resultSet.getString("ERM_AVA"));
                searchResults.add(enroll);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return searchResults;
    }
}
