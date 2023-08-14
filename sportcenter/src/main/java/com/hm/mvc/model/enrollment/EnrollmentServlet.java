package com.hm.mvc.model.enrollment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.List;
import com.hm.mvc.model.enrollment.EnrollService;
import com.hm.mvc.model.enrollment.EnrollServiceImpl;
import com.hm.mvc.member.model.vo.Member;
import com.hm.mvc.model.enrollment.Enroll;

@WebServlet(name = "enrollment", urlPatterns = {"/application/enrollment", "/application/payment"})
public class EnrollmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private EnrollService service = new EnrollServiceImpl();

    public EnrollmentServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        Member member = null;
        HttpSession session = request.getSession();
        Member loginMember = (Member) session.getAttribute("loginMember");

        member = new Member();
        member.setName(request.getParameter("userName"));
        member.setSSN1(request.getParameter("SSN1"));

        switch (path) {
            case "/application/enrollment":
                processEnrollmentRequest(request, response);
                break;
            case "/application/payment":
                showPayment(request, response);
                break;
        }
    }

    private void processEnrollmentRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageParam = request.getParameter("page");
        int currentPage = pageParam == null ? 1 : Integer.parseInt(pageParam);
        int listCount = service.getEnrollCount();
        EnrollmentPageInfo pageInfo = new EnrollmentPageInfo(currentPage, 10, listCount, 10);
        List<Enroll> enrollList = service.getEnrollList(currentPage, pageInfo.getListLimit());
        request.setAttribute("list", enrollList);
        request.setAttribute("pageInfo", pageInfo);

        String keyword = request.getParameter("search");
        if (keyword != null && !keyword.trim().isEmpty()) {
            List<Enroll> list = service.searchCourses(keyword);
            request.setAttribute("list", list);
            request.getRequestDispatcher("/views/application/enroll.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/views/application/enroll.jsp").forward(request, response);
        }
    }

    private void showPayment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/application/payment.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
