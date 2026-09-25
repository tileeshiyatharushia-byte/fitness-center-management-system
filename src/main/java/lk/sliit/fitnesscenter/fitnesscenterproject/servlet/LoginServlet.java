package lk.sliit.fitnesscenter.fitnesscenterproject.servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.sliit.fitnesscenter.fitnesscenterproject.dao.MemberManager;
import lk.sliit.fitnesscenter.fitnesscenterproject.model.Member;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {  // Added extends HttpServlet
    private MemberManager memberManager = new MemberManager();
    // Admin credentials
    private static final String ADMIN_EMAIL = "admin@email.com";
    private static final String ADMIN_PASSWORD = "1234";

    @Override  // Added @Override annotation
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Check for admin login first
        if (ADMIN_EMAIL.equals(email) && ADMIN_PASSWORD.equals(password)) {
            HttpSession session = request.getSession();
            // Create a simple admin user object
            Member adminUser = new Member();
            adminUser.setAdmin(true);
            adminUser.setEmail(email);
            session.setAttribute("currentUser", adminUser);
            response.sendRedirect("adminDashboard.jsp");
            return;
        }

        // Regular member login
        Member authenticatedMember = memberManager.authenticate(email, password);

        if (authenticatedMember != null) {
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", authenticatedMember);
            response.sendRedirect("memberDashboard.jsp");
        }
        else {
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}