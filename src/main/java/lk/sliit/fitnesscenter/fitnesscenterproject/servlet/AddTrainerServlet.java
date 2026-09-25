package lk.sliit.fitnesscenter.fitnesscenterproject.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lk.sliit.fitnesscenter.fitnesscenterproject.model.FullTimeTrainer;
import lk.sliit.fitnesscenter.fitnesscenterproject.model.PartTimeTrainer;
import lk.sliit.fitnesscenter.fitnesscenterproject.model.Trainer;
import lk.sliit.fitnesscenter.fitnesscenterproject.dao.TrainerDAO;

import java.io.IOException;

@WebServlet(name = "AddTrainerServlet", value = "/AddTrainerServlet")
public class AddTrainerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String trainerId = request.getParameter("trainerId");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contactNumber");
        String specialty = request.getParameter("specialty");
        String password = request.getParameter("password");
        String trainerType = request.getParameter("trainerType");

        Trainer trainer;

        if (trainerType.equals("FULLTIME")) {
            double salary = Double.parseDouble(request.getParameter("salary"));
            int workingHours = Integer.parseInt(request.getParameter("workingHours"));
            trainer = new FullTimeTrainer(trainerId, name, email, contactNumber, specialty, password, salary, workingHours);
        } else {
            double hourlyRate = Double.parseDouble(request.getParameter("hourlyRate"));
            int hoursPerWeek = Integer.parseInt(request.getParameter("hoursPerWeek"));
            trainer = new PartTimeTrainer(trainerId, name, email, contactNumber, specialty, password, hourlyRate, hoursPerWeek);
        }

        TrainerDAO trainerDAO = new TrainerDAO();
        boolean success = trainerDAO.addTrainer(trainer);

        if (success) {
            request.setAttribute("message", "Trainer added successfully!");
        } else {
            request.setAttribute("message", "Failed to add trainer. Please try again.");
        }

        request.getRequestDispatcher("addTrainer.jsp").forward(request, response);
    }
}
