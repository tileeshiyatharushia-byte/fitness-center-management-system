package lk.sliit.fitnesscenter.fitnesscenterproject.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.sliit.fitnesscenter.fitnesscenterproject.dao.MemberManager;
import lk.sliit.fitnesscenter.fitnesscenterproject.model.Member;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/MemberServlet")
public class   MemberServlet extends HttpServlet {
    private final MemberManager memberManager = new MemberManager();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action is required");
            return;
        }

        try {
            String memberID = request.getParameter("memberID");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String membershipType = request.getParameter("membershipType");
            String contactNumber = request.getParameter("contactNumber");
            LocalDate lastRenewalDate = LocalDate.parse(request.getParameter("lastRenewalDate"));

            Member member = new Member(memberID, name, email, password, membershipType, contactNumber, lastRenewalDate);

            switch (action) {
                case "add":

                    //Validate memberID already exists
                    if(memberManager.memberExists(memberID)) {
                        request.setAttribute("error", "Member ID already exists");
                        request.getRequestDispatcher("addMember.jsp").forward(request, response);
                        return;
                    }

                    // Add the member
                    memberManager.addMember(member);
                    // Redirect to success.jsp after adding the member
                    response.sendRedirect("success.jsp?message=Member added successfully");
                    break;

                case "update":
                    // Update member
                    memberManager.updateMember(member);
                    // Redirect to success.jsp after updating the member
                    response.sendRedirect("success.jsp?message=Member updated successfully");
                    break;

                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=" + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action != null) {
                switch (action) {
                    case "delete":
                        // Handle delete member
                        String deleteMemberID = request.getParameter("memberID");
                        memberManager.deleteMember(deleteMemberID);
                        response.sendRedirect("MemberServlet");
                        return;

                    case "sortByRenewalDate":
                        // Get all members and sort them by renewal date using insertion sort
                        List<Member> sortedMembers = memberManager.getAllMembers();
                        sortedMembers = memberManager.sortMembersByRenewalDate(sortedMembers); // Sorting
                        // Set the sorted members and forward to the admin page
                        request.setAttribute("members", sortedMembers);
                        request.getRequestDispatcher("viewMembers.jsp").forward(request, response);
                        return;
                }
            }

            // Default action: display all members
            List<Member> members = memberManager.getAllMembers();
            request.setAttribute("members", members);
            request.getRequestDispatcher("viewMembers.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=" + e.getMessage());
        }
    }
}
