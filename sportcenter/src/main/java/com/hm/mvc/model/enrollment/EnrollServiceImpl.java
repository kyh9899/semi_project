package com.hm.mvc.model.enrollment;

import static com.hm.mvc.common.jdbc.JDBCTemplate.close;
import static com.hm.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

public class EnrollServiceImpl implements EnrollService {
    private EnrollDao dao = new EnrollDao();

    @Override
    public List<Enroll> findAllEnroll() {
        Connection conn = getConnection();
        List<Enroll> list = dao.findAllEnroll(conn);
        close(conn);
        return list;
    }
    @Override
    public List<Enroll> searchCourses(String search) {
        Connection conn = getConnection();
        List<Enroll> list = dao.searchCourses(conn, search);
        close(conn);
        return list;
    }
    
}

