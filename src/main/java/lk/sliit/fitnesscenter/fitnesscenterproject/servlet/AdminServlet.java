package lk.sliit.fitnesscenter.fitnesscenterproject.servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.sliit.fitnesscenter.fitnesscenterproject.dao.MembershipPlanManager;
import lk.sliit.fitnesscenter.fitnesscenterproject.model.Member;
import lk.sliit.fitnesscenter.fitnesscenterproject.dao.MemberManager;


import java.io.IOException;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    private MemberManager memberManager = new MemberManager();
    private MembershipPlanManager membershipPlanManager = new MembershipPlanManager();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        HttpSession session = request.getSession();
        Member currentUser = (Member)session.getAttribute("currentUser");

        if(currentUser == null || !currentUser.isAdmin()) {
            response.sendRedirect("login.jsp");
            return;
        }


        String action = request.getParameter("action");

        switch (action){
            case "addPlan":
                break;
            case "deleteMember":
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        HttpSession session = request.getSession();
        Member currentUser = (Member)session.getAttribute("currentUser");

        if (currentUser == null || !currentUser.isAdmin()) {
            response.sendRedirect("login.jsp");
            return;
        }

        request.setAttribute("member", memberManager.getAllMembers());
        request.setAttribute("plans", membershipPlanManager.getAllPlans());
        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }
}