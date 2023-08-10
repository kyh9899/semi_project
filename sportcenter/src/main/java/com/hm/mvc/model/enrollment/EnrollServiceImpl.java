package com.hm.mvc.model.enrollment;

import java.sql.Connection;
import java.util.List;

import com.hm.mvc.model.enrollment.EnrollDao;
import com.hm.mvc.model.enrollment.Enroll;

import static com.hm.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.hm.mvc.common.jdbc.JDBCTemplate.close;

public class EnrollServiceImpl implements EnrollService {
    private EnrollDao dao = new EnrollDao();

    @Override
    public List<Enroll> findAllEnroll() {
        Connection conn = getConnection();
        List<Enroll> list = dao.findAllEnroll(conn);
        close(conn);
        return list;
    }
}