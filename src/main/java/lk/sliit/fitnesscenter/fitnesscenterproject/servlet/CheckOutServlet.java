package lk.sliit.fitnesscenter.fitnesscenterproject.servlet;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lk.sliit.fitnesscenter.fitnesscenterproject.dao.AttendanceDAO;

import java.io.IOException;

@WebServlet(name = "CheckOutServlet", value = "/checkOut")
public class CheckOutServlet extends HttpServlet {
    private AttendanceDAO attendanceDAO;

    @Override
    public void init() {
        attendanceDAO = new AttendanceDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int memberId = Integer.parseInt(request.getParameter("memberId"));
            boolean success = attendanceDAO.updateCheckOut(memberId);

            if (success) {
                request.getSession().setAttribute("message", "Check-out successful!");
                request.getSession().setAttribute("messageType", "success");
            } else {
                request.getSession().setAttribute("message", "No active check-in found!");
                request.getSession().setAttribute("messageType", "warning");
            }
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("message", "Invalid member ID!");
            request.getSession().setAttribute("messageType", "danger");
        }
        response.sendRedirect("memberCheckOut.jsp");
    }
}
