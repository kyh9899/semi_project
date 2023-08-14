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
        String sql = "SELECT P.PG_TITLE, F.FC_NAME, C.CH_NAME, P.PG_TIME,PG_DATE ,P.PG_FEE, P.PG_MAX, P.PG_NUM, E.ERM_AVA, M.MB_NAME, M.MB_SSN " +
                "FROM ENROLLMENT E " +
                "JOIN PROGRAM P ON E.PG_CODE = P.PG_CODE " +
                "JOIN COACH C ON P.CH_CODE = C.CH_CODE " +
                "JOIN FACILITY F ON P.FC_CODE = F.FC_CODE" +
        		"JOIN MEMBER M ON E.MB_CODE = M.MB_CODE";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                Enroll enroll = new Enroll();
                enroll.setPgTitle(resultSet.getString("PG_TITLE"));
                enroll.setFcName(resultSet.getString("FC_NAME"));
                enroll.setChName(resultSet.getString("CH_NAME"));
                enroll.setPgTime(resultSet.getString("PG_TIME"));
                enroll.setPgDate(resultSet.getString("PG_DATE"));
                enroll.setPgFee(resultSet.getString("PG_FEE"));
                enroll.setPgMax(resultSet.getInt("PG_MAX"));
                enroll.setPgNum(resultSet.getInt("PG_NUM"));
                enroll.setErmAva(resultSet.getString("ERM_AVA"));
                enroll.setMbName(resultSet.getString("MB_NAME"));
                enroll.setMbSsn(resultSet.getString("MB_SSN"));
                enrolls.add(enroll);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return enrolls;
    }
	
	public List<Enroll> searchCourses(Connection connection, String search) {
        List<Enroll> searchResults = new ArrayList<>();
        String sql = "SELECT P.PG_TITLE, F.FC_NAME, C.CH_NAME, P.PG_TIME, PG_DATE,P.PG_FEE, P.PG_MAX, P.PG_NUM, E.ERM_AVA " +
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
                enroll.setPgDate(resultSet.getString("PG_DATE"));
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
	public List<Enroll> getEnrollList(Connection conn, int currentPage, int listLimit) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<Enroll> enrollList = new ArrayList<>();

	    String query = "SELECT * FROM ("
	            + "SELECT ROWNUM R, PG_TITLE, FC_NAME, CH_NAME, PG_TIME, PG_DATE, PG_FEE, PG_MAX, PG_NUM, ERM_AVA "
	            + "FROM ("
	            + "SELECT P.PG_TITLE, F.FC_NAME, C.CH_NAME, P.PG_TIME, PG_DATE, P.PG_FEE, P.PG_MAX, P.PG_NUM, E.ERM_AVA "
	            + "FROM ENROLLMENT E "
	            + "JOIN PROGRAM P ON E.PG_CODE = P.PG_CODE "
	            + "JOIN COACH C ON P.CH_CODE = C.CH_CODE "
	            + "JOIN FACILITY F ON P.FC_CODE = F.FC_CODE "
	            + "ORDER BY E.ERM_AVA DESC )) "
	            + "WHERE R >= ? AND R <= ?";

	    try {
	        pstmt = conn.prepareStatement(query);
	        int startRow = (currentPage - 1) * listLimit + 1;
	        int endRow = currentPage * listLimit;
	        pstmt.setInt(1, startRow);
	        pstmt.setInt(2, endRow);

	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            Enroll enroll = new Enroll();
	            enroll.setPgTitle(rs.getString("PG_TITLE"));
	            enroll.setFcName(rs.getString("FC_NAME"));
	            enroll.setChName(rs.getString("CH_NAME"));
	            enroll.setPgTime(rs.getString("PG_TIME"));
	            enroll.setPgDate(rs.getString("PG_DATE"));
	            enroll.setPgFee(rs.getString("PG_FEE"));
	            enroll.setPgMax(rs.getInt("PG_MAX"));
	            enroll.setPgNum(rs.getInt("PG_NUM"));
	            enroll.setErmAva(rs.getString("ERM_AVA"));
	            enrollList.add(enroll);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    return enrollList;
	}

	    // 기타 코드들 ...
	
	
	
	
	public int getEnrollCount(Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = 0;

        String query = "SELECT COUNT(*) AS count FROM ENROLLMENT";

        try {
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                result = rs.getInt("count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return result;
    }
	
}
