package com.hm.mvc.model.enrollment;

import java.util.List;
import com.hm.mvc.model.enrollment.*;

public interface EnrollService {
    List<Enroll> findAllEnroll();
    List<Enroll> searchCourses(String query);
    
}