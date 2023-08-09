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
        String sql = "SELECT * FROM ENROLL";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            ResultSet resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                Enroll enroll = new Enroll();
                enroll.setPgTitle(resultSet.getString("PG_TITLE"));
                enroll.setFcName(resultSet.getString("FC_NAME"));
                enroll.setChName(resultSet.getString("CH_NAME"));
                enroll.setPgTime(resultSet.getString("PG_TIME"));
                enroll.setPgFee(resultSet.getString("PG_FEE"));
                enroll.setPgNum(resultSet.getInt("PG_NUM"));
                enroll.setErmCode(resultSet.getString("ERM_CODE"));
                enroll.setStatus(resultSet.getString("STATUS"));
                enrolls.add(enroll);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return enrolls;
    }
	

 
}
	
	
	
	

	
//	public int getBoardCount(Connection connection) {
//		int count = 0;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String query = "SELECT COUNT(*) FROM ENROLL WHERE STATUS='Y'";
//		
//		try {
//			pstmt = connection.prepareStatement(query);
//			rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				count = rs.getInt(1);
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(pstmt);
//		}
//		
//		return count;
//		
//	}
//
//	public List<Enroll> findAllEnroll(Connection connection) {
//	    List<Enroll> list = new ArrayList<>();
//	    PreparedStatement pstmt = null;
//	    ResultSet rs = null;
//	    String query = "SELECT PG_TITLE, FC_NAME, CH_NAME, PG_TIME, PG_FEE, PG_NUM, ERM_CODE, STATUS "
//	                 + "FROM Enroll "
//	                 + "WHERE STATUS='Y' "
//	                 + "ORDER BY id DESC";
//
//	    
//	    try {
//	        pstmt = connection.prepareStatement(query);
//	        rs = pstmt.executeQuery();
//
//	        while (rs.next()) {
//	            Enroll enroll = new Enroll();
//
//	            enroll.setPgTitle(rs.getString("PG_TITLE"));
//	            enroll.setFcName(rs.getString("FC_NAME"));
//	            enroll.setChName(rs.getString("CH_NAME"));
//	            enroll.setPgTime(rs.getString("PG_TIME"));
//	            enroll.setPgFee(rs.getString("PG_FEE"));
//	            enroll.setPgNum(rs.getInt("PG_NUM"));
//	            enroll.setErmCode(rs.getString("ERM_CODE"));
//	            enroll.setStatus(rs.getString("STATUS"));
//	            list.add(enroll);
//	        }
//	    } catch (SQLException e) {
//	        e.printStackTrace();
//	    } finally {
//	        close(rs);
//	        close(pstmt);
//	    }
//
//	    return list;
//	}
//
//	public Enroll findEnrollByNo(Connection connection, int id) {
//	    Enroll enroll = null;
//	    PreparedStatement pstmt = null;
//	    ResultSet rs = null;
//	    String query = "SELECT  PG_TITLE, FC_NAME, CH_NAME, PG_TIME, PG_FEE, PG_NUM, ERM_CODE, STATUS "
//	            + "FROM Enroll "
//	            + "WHERE id = ?";
//
//	    try {
//	        pstmt = connection.prepareStatement(query);
//	        pstmt.setInt(1, id);
//	        rs = pstmt.executeQuery();
//
//	        if (rs.next()) {
//	            enroll = new Enroll();
//
//	            enroll.setPgTitle(rs.getString("PG_TITLE"));
//	            enroll.setFcName(rs.getString("FC_NAME"));
//	            enroll.setChName(rs.getString("CH_NAME"));
//	            enroll.setPgTime(rs.getString("PG_TIME"));
//	            enroll.setPgFee(rs.getString("PG_FEE"));
//	            enroll.setPgNum(rs.getInt("PG_NUM"));
//	            enroll.setErmCode(rs.getString("ERM_CODE"));
//	            enroll.setStatus(rs.getString("STATUS"));
//	        }
//	    } catch (SQLException e) {
//	        e.printStackTrace();
//	    } finally {
//	        close(rs);
//	        close(pstmt);
//	    }
//
//	    return enroll;
//	}
//
//
//	public int insertEnroll(Connection connection, Enroll enroll) {
//	    int result = 0;
//	    PreparedStatement pstmt = null;
//	    String query = "INSERT INTO Enroll ( PG_TITLE, FC_NAME, CH_NAME, PG_TIME, PG_FEE, PG_NUM, ERM_CODE, STATUS)"
//	            + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
//
//	    try {
//	        pstmt = connection.prepareStatement(query);
//
//	        pstmt.setString(2, enroll.getPgTitle());
//	        pstmt.setString(3, enroll.getFcName());
//	        pstmt.setString(4, enroll.getChName());
//	        pstmt.setString(5, enroll.getPgTime());
//	        pstmt.setString(6, enroll.getPgFee());
//	        pstmt.setInt(7, enroll.getPgNum());
//	        pstmt.setString(8, enroll.getErmCode());
//
//	        result = pstmt.executeUpdate();
//
//	    } catch (SQLException e) {
//	        e.printStackTrace();
//	    } finally {
//	        close(pstmt);
//	    }
//
//	    return result;
//	}
//
//	public int updateEnroll(Connection connection, Enroll enroll) {
//	    int result = 0;
//	    PreparedStatement pstmt = null;
//	    String query = "UPDATE Enroll SET PG_TITLE=?, FC_NAME=?, CH_NAME=?, PG_TIME=?, PG_FEE=?, PG_NUM=?, ERM_CODE=?, STATUS=? ";
//
//	    try {
//	        pstmt = connection.prepareStatement(query);
//
//	        pstmt.setString(1, enroll.getPgTitle());
//	        pstmt.setString(2, enroll.getFcName());
//	        pstmt.setString(3, enroll.getChName());
//	        pstmt.setString(4, enroll.getPgTime());
//	        pstmt.setString(5, enroll.getPgFee());
//	        pstmt.setInt(6, enroll.getPgNum());
//	        pstmt.setString(7, enroll.getErmCode());
//	        
//	        result = pstmt.executeUpdate();
//
//	    } catch (SQLException e) {
//	        e.printStackTrace();
//	    } finally {
//	        close(pstmt);
//	    }
//
//	    return result;
//	}
//
//	public int updateEnrollStatus(Connection connection, int id, String status) {
//	    int result = 0;
//	    PreparedStatement pstmt = null;
//	    String query = "UPDATE Enroll SET STATUS=? WHERE id=?";
//
//	    try {
//	        pstmt = connection.prepareStatement(query);
//
//	        pstmt.setString(1, status);
//	        pstmt.setInt(2, id);
//
//	        result = pstmt.executeUpdate();
//
//	    } catch (SQLException e) {
//	        e.printStackTrace();
//	    } finally {
//	        close(pstmt);
//	    }
//
//	    return result;
//	}
//	
//}



