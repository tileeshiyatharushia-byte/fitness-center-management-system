package lk.sliit.fitnesscenter.fitnesscenterproject.servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.sliit.fitnesscenter.fitnesscenterproject.dao.MembershipPlanManager;

import java.io.IOException;

@WebServlet("/MembershipPlanServletPublic")
public class MembershipPlanServletPublic extends HttpServlet {
    private MembershipPlanManager planManager = new MembershipPlanManager();



    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        request.setAttribute("plans", planManager.getAllPlans());
        request.getRequestDispatcher("publicPlans.jsp").forward(request, response);
    }
}
