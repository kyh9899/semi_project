package com.hm.mvc.model.enrollment;

import java.util.List;

public interface EnrollService {
    List<Enroll> findAllEnroll();
    
    List<Enroll> searchCourses(String query);
    
    // 총 강의 수를 얻기 위한 메서드
    int getEnrollCount();
    
    List<Enroll> getEnrollList(int currentPage, int listLimit);
}
