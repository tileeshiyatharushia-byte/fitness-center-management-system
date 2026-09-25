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

@WebServlet("/MemberLoginServlet")
public class MemberLoginServlet extends HttpServlet {
    private MemberManager memberManager = new MemberManager();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Member member = memberManager.authenticate(email, password);

        if (member != null) {
            HttpSession session = request.getSession();
            session.setAttribute("member", member);

            response.sendRedirect("memberDashboard.jsp");
        }
        else {
            response.sendRedirect("loginMember.jsp?error=true");
        }
    }
}
