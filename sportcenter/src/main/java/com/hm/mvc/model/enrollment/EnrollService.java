package com.hm.mvc.model.enrollment;

import java.util.List;
import com.hm.mvc.model.enrollment.*;

public interface EnrollService {
    List<Enroll> findAllEnroll();
    List<Enroll> searchCourses(String query);
    int getEnrollCount(); // 총 강의 수를 얻기위한 메서드를 추가
    List<Enroll> getEnrollList(int currentPage, int listLimit);
}