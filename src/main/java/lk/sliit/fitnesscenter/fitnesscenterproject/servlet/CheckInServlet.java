package lk.sliit.fitnesscenter.fitnesscenterproject.servlet;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lk.sliit.fitnesscenter.fitnesscenterproject.dao.AttendanceDAO;
import lk.sliit.fitnesscenter.fitnesscenterproject.model.Attendance;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "CheckInServlet", value = "/checkIn")
public class CheckInServlet extends HttpServlet {
    private AttendanceDAO attendanceDAO;

    @Override
    public void init() {
        attendanceDAO = new AttendanceDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int memberId = Integer.parseInt(request.getParameter("memberId"));
            Attendance attendance = new Attendance(memberId, LocalDateTime.now());
            attendanceDAO.addAttendance(attendance);

            request.getSession().setAttribute("message", "Check-in successful!");
            request.getSession().setAttribute("messageType", "success");
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("message", "Invalid member ID!");
            request.getSession().setAttribute("messageType", "danger");
        }
        response.sendRedirect("memberCheckIn.jsp");
    }
}
