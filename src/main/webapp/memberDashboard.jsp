<%--
  Created by IntelliJ IDEA.
  User: ashen
  Date: 4/5/25
  Time: 9:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.model.Member" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Iron Forge Fitness | Member Dashboard</title>
  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700;900&family=Oswald:wght@500;700&display=swap" rel="stylesheet">
  <!-- Custom CSS -->
  <style>
    :root {
      --primary-black: #121212;
      --secondary-black: #1e1e1e;
      --dark-gray: #2d2d2d;
      --medium-gray: #4a4a4a;
      --light-gray: #e0e0e0;
      --accent-orange: #ff6b35;
      --accent-dark-orange: #e05a2b;
      --white: #ffffff;
    }

    body {
      font-family: 'Montserrat', sans-serif;
      background-color: var(--primary-black);
      color: var(--light-gray);
    }

    .sidebar {
      background-color: var(--secondary-black);
      min-height: 100vh;
      border-right: 1px solid var(--medium-gray);
    }

    .sidebar-header {
      padding: 20px;
      border-bottom: 1px solid var(--medium-gray);
    }

    .sidebar-menu {
      padding: 20px 0;
    }

    .sidebar-menu .nav-link {
      color: var(--light-gray);
      padding: 10px 20px;
      margin: 5px 0;
      border-radius: 0;
      transition: all 0.3s;
    }

    .sidebar-menu .nav-link:hover {
      background-color: var(--dark-gray);
      color: var(--accent-orange);
    }

    .sidebar-menu .nav-link.active {
      background-color: var(--dark-gray);
      color: var(--accent-orange);
      border-left: 4px solid var(--accent-orange);
    }

    .main-content {
      padding: 20px;
    }

    .card {
      background-color: var(--secondary-black);
      border: none;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
      margin-bottom: 20px;
      border-left: 4px solid transparent;
      transition: all 0.3s;
      color: #dddddd;
    }

    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
      border-left: 4px solid var(--accent-orange);
    }

    .card-header {
      background-color: var(--dark-gray);
      border-bottom: 1px solid var(--medium-gray);
      font-weight: 700;
    }

    .welcome-section {
      background: linear-gradient(135deg, var(--dark-gray) 0%, var(--secondary-black) 100%);
      padding: 30px;
      border-radius: 10px;
      margin-bottom: 30px;
      border-left: 4px solid var(--accent-orange);
    }

    .profile-img {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      border: 3px solid var(--accent-orange);
    }

    .logout-btn {
      background-color: transparent;
      border: 1px solid var(--accent-orange);
      color: var(--accent-orange);
      padding: 5px 15px;
      border-radius: 5px;
      transition: all 0.3s;
    }

    .logout-btn:hover {
      background-color: var(--accent-orange);
      color: var(--white);
    }
  </style>
</head>
<body>
<div class="container-fluid">
  <div class="row">
    <!-- Sidebar (same as dashboard) -->
    <div class="col-md-3 col-lg-2 d-md-block sidebar">
      <div class="sidebar-header text-center">
        <h4>IRON<span style="color: var(--accent-orange);">FORGE</span></h4>
        <p class="text-muted">Member Portal</p>
      </div>
      <div class="sidebar-menu">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link" href="memberDashboard.jsp">
              <i class="fas fa-tachometer-alt me-2"></i> Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="memberProfile.jsp">
              <i class="fas fa-user me-2"></i> My Profile
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="submitReview.jsp">
              <i class="fas fa-receipt me-2"></i> Submit Review
            </a>
          </li>
          <li class="nav-item mt-4">
            <a class="nav-link" href="MemberLogoutServlet">
              <i class="fas fa-sign-out-alt me-2"></i> Logout
            </a>
          </li>
        </ul>
      </div>
    </div>

    <!-- Main Content -->
    <div class="col-md-9 col-lg-10 ms-sm-auto main-content">
      <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Member Dashboard</h2>
        <form action="MemberLogoutServlet" method="post">
          <button type="submit" class="logout-btn">
            <i class="fas fa-sign-out-alt me-1"></i> Logout
          </button>
        </form>
      </div>

      <%-- Get member from session --%>
      <% Member member = (Member) session.getAttribute("member"); %>

      <!-- Welcome Section -->
      <div class="welcome-section">
        <div class="row align-items-center">
          <div class="col-md-2 text-center">
            <img src="https://ui-avatars.com/api/?name=<%= member.getName() %>&background=ff6b35&color=fff&size=100"
                 alt="Profile Image" class="profile-img">
          </div>
          <div class="col-md-10">
            <h3>Welcome back, <%= member.getName() %>!</h3>
            <p class="mb-0">Member since <%= member.getLastRenewalDate() %></p>
          </div>
        </div>
      </div>

      <!-- Dashboard Cards -->
      <div class="row">
        <div class="col-md-6">
          <div class="card">
            <div class="card-header">
              <i class="fas fa-id-card me-2"></i> Membership Details
            </div>
            <div class="card-body">
              <p><strong>Member ID:</strong> <%= member.getMemberId() %></p>
              <p><strong>Membership Type:</strong> <%= member.getMembershipType() %></p>
              <p><strong>Last Renewal Date:</strong> <%= member.getLastRenewalDate() %></p>
              <p><strong>Contact Number:</strong> <%= member.getContactNumber() %></p>
              <a href="memberProfile.jsp" class="btn btn-sm" style="background-color: var(--accent-orange); color: white;">
                Update Profile
              </a>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="card">
            <div class="card-header">
              <i class="fas fa-dumbbell me-2"></i> Quick Actions
            </div>
            <div class="card-body">
              <div class="d-grid gap-2">
                <a href="memberCheckIn.jsp" class="btn btn-dark">Check-In</a>
                <a href="memberCheckOut.jsp" class="btn btn-dark">Check-Out</a>
              </div>
            </div>
          </div>
        </div>
      </div>


    </div>
  </div>
</div>

<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>