package com.hm.mvc.model.enrollment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import com.hm.mvc.model.enrollment.EnrollService;
import com.hm.mvc.model.enrollment.EnrollServiceImpl;
import com.hm.mvc.model.enrollment.Enroll;



@WebServlet(name = "enrollment", urlPatterns = { "/application/enrollment"})
public class EnrollmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private EnrollService service = new EnrollServiceImpl();

    public EnrollmentServlet() {
    }

    @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 String keyword = request.getParameter("keyword");
    	 List<Enroll> list;
    	    if (keyword != null && !keyword.trim().isEmpty()) {
    	        list = service.searchCourses(keyword);
    	    } else {
    	        list = service.findAllEnroll();
    	    }
    	 
//        List<Enroll> list = service.findAllEnroll();


        // 리스트를 request에 저장
        request.setAttribute("list", list);

        // 포워드를 사용하여 enroll.jsp 경로로 이동합니다.
        request.getRequestDispatcher("/views/application/enroll.jsp").forward(request, response);
        
    }
      
   


   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   }

}