package lk.sliit.fitnesscenter.fitnesscenterproject.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lk.sliit.fitnesscenter.fitnesscenterproject.dao.AttendanceDAO;
import lk.sliit.fitnesscenter.fitnesscenterproject.model.Attendance;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AttendanceRecordsServlet", value = "/attendanceRecords")
public class AttendanceRecordsServlet extends HttpServlet {
    private AttendanceDAO attendanceDAO;

    @Override
    public void init() {
        attendanceDAO = new AttendanceDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filterType = request.getParameter("filterType");
        String filterValue = request.getParameter("filterValue");

        List<Attendance> attendanceList;

        if (filterType != null && filterValue != null && !filterValue.isEmpty()) {
            if (filterType.equals("member")) {
                try {
                    int memberId = Integer.parseInt(filterValue);
                    attendanceList = attendanceDAO.getAttendanceByMember(memberId);
                } catch (NumberFormatException e) {
                    attendanceList = attendanceDAO.getAllAttendance();
                    request.getSession().setAttribute("message", "Invalid member ID!");
                    request.getSession().setAttribute("messageType", "danger");
                }
            } else if (filterType.equals("date")) {
                attendanceList = attendanceDAO.getAttendanceByDate(filterValue);
            } else {
                attendanceList = attendanceDAO.getAllAttendance();
            }
        } else {
            attendanceList = attendanceDAO.getAllAttendance();
        }

        request.setAttribute("attendanceList", attendanceList);
        request.getRequestDispatcher("attendanceRecords.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("action") != null && request.getParameter("action").equals("delete")) {
            int attendanceId = Integer.parseInt(request.getParameter("attendanceId"));
            boolean success = attendanceDAO.deleteAttendance(attendanceId);

            if (success) {
                request.getSession().setAttribute("message", "Record deleted successfully!");
                request.getSession().setAttribute("messageType", "success");
            } else {
                request.getSession().setAttribute("message", "Failed to delete record!");
                request.getSession().setAttribute("messageType", "danger");
            }
        }
        response.sendRedirect("attendanceRecords");
    }
}
