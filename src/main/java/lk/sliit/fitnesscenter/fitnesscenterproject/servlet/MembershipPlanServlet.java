package lk.sliit.fitnesscenter.fitnesscenterproject.servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.sliit.fitnesscenter.fitnesscenterproject.dao.MembershipPlanManager;
import lk.sliit.fitnesscenter.fitnesscenterproject.model.MembershipPlan;

import java.io.IOException;
import java.util.List;

@WebServlet("/MembershipPlanServlet")
public class MembershipPlanServlet extends HttpServlet {
    private MembershipPlanManager planManager = new MembershipPlanManager();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
                String planId = request.getParameter("planId");
                String planName = request.getParameter("planName");
                int duration = Integer.parseInt(request.getParameter("duration"));
                double price = Double.parseDouble(request.getParameter("price"));

                MembershipPlan newPlan = new MembershipPlan(planId, planName, duration, price);
                planManager.addPlan(newPlan);
                response.sendRedirect("MembershipPlanServlet?action=sortByRenewalDate");
                break;

            case "update":
                String updateId = request.getParameter("planId");
                String updatedPlanName = request.getParameter("planName");
                int updatedDuration = Integer.parseInt(request.getParameter("duration"));
                double updatedPrice = Double.parseDouble(request.getParameter("price"));

                MembershipPlan updatedPlan = new MembershipPlan(updateId, updatedPlanName, updatedDuration, updatedPrice);
                planManager.updatePlan(updateId, updatedPlan);
                response.sendRedirect("MembershipPlanServlet?action=sortByRenewalDate");
                break;

            case "delete":
                String deleteId = request.getParameter("planId");
                planManager.deletePlan(deleteId);
                response.sendRedirect("MembershipPlanServlet?action=sortByRenewalDate");
                break;

            case "dequeue":
                List<MembershipPlan> allPlans = planManager.getAllPlans();
                if (!allPlans.isEmpty()) {
                    MembershipPlan firstPlan = allPlans.get(0);
                    planManager.deletePlan(firstPlan.getPlanId());
                    request.setAttribute("dequeuedPlan", firstPlan);
                }
                response.sendRedirect("MembershipPlanServlet?action=sortByRenewalDate");
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("plans", planManager.getAllPlans());
        request.getRequestDispatcher("viewPlans.jsp").forward(request, response);
    }
}