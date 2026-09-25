package lk.sliit.fitnesscenter.fitnesscenterproject.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lk.sliit.fitnesscenter.fitnesscenterproject.model.FitnessClass;
import lk.sliit.fitnesscenter.fitnesscenterproject.dao.FitnessClassDAO;
import lk.sliit.fitnesscenter.fitnesscenterproject.model.GroupClass;
import lk.sliit.fitnesscenter.fitnesscenterproject.model.PersonalTraining;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "AddClassServlet", value = "/AddClassServlet")
public class AddClassServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String classId = request.getParameter("classId");
        String className = request.getParameter("className");
        String dateTimeStr = request.getParameter("dateTime");
        int duration = Integer.parseInt(request.getParameter("duration"));
        String trainerId = request.getParameter("trainerId");
        int maxParticipants = Integer.parseInt(request.getParameter("maxParticipants"));
        String description = request.getParameter("description");
        String classType = request.getParameter("classType");

        LocalDateTime dateTime = LocalDateTime.parse(dateTimeStr, DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm"));

        FitnessClassDAO classDAO = new FitnessClassDAO();
        boolean success = false;

        if ("group".equals(classType)) {
            String groupType = request.getParameter("groupType");
            GroupClass groupClass = new GroupClass(classId, className, dateTime, duration,
                    trainerId, maxParticipants, description, groupType);
            success = classDAO.addClass(groupClass);
        } else if ("personal".equals(classType)) {
            String focusArea = request.getParameter("focusArea");
            PersonalTraining personalTraining = new PersonalTraining(classId, className, dateTime, duration,
                    trainerId, maxParticipants, description, focusArea);
            success = classDAO.addClass(personalTraining);
        } else {
            FitnessClass fitnessClass = new FitnessClass(classId, className, dateTime, duration,
                    trainerId, maxParticipants, description);
            success = classDAO.addClass(fitnessClass);
        }

        if (success) {
            response.sendRedirect("manageClasses.jsp?success=Class added successfully");
        } else {
            response.sendRedirect("addClass.jsp?error=Failed to add class");
        }
    }
}


