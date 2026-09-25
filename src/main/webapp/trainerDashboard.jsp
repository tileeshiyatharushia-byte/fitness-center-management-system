<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.model.Trainer" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.model.FullTimeTrainer" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Iron Forge Fitness | Trainer Dashboard</title>
  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
      text-align: center;
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
      padding: 30px;
    }

    .profile-img {
      width: 150px;
      height: 150px;
      border-radius: 50%;
      object-fit: cover;
      border: 5px solid var(--accent-orange);
    }

    .profile-card {
      background-color: var(--secondary-black);
      border-radius: 10px;
      padding: 30px;
      margin-bottom: 30px;
      border-left: 4px solid var(--accent-orange);
    }

    .form-label {
      font-weight: 600;
    }

    .form-control {
      background-color: var(--dark-gray);
      border: 1px solid var(--medium-gray);
      color: var(--light-gray);
      padding: 10px 15px;
      margin-bottom: 15px;
    }

    .form-control:focus {
      background-color: var(--dark-gray);
      color: var(--light-gray);
      border-color: var(--accent-orange);
      box-shadow: 0 0 0 0.25rem rgba(255, 107, 53, 0.25);
    }

    .btn-update {
      background-color: var(--accent-orange);
      color: var(--white);
      border: none;
      padding: 10px 25px;
      font-weight: 600;
      transition: all 0.3s;
    }

    .btn-update:hover {
      background-color: var(--accent-dark-orange);
      transform: translateY(-3px);
      box-shadow: 0 5px 15px rgba(255, 107, 53, 0.3);
    }

    .stats-card {
      background-color: var(--secondary-black);
      border-radius: 10px;
      padding: 20px;
      margin-bottom: 20px;
      text-align: center;
      transition: all 0.3s;
      border-left: 4px solid transparent;
    }

    .stats-card:hover {
      border-left: 4px solid var(--accent-orange);
      transform: translateY(-5px);
    }

    .stats-icon {
      font-size: 2rem;
      color: var(--accent-orange);
      margin-bottom: 10px;
    }

    .stats-number {
      font-size: 1.8rem;
      font-weight: 700;
      color: var(--accent-orange);
    }

    .stats-label {
      font-size: 0.9rem;
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    .badge-fulltime {
      background-color: #28a745;
      padding: 8px 12px;
      font-size: 0.9rem;
    }

    .badge-parttime {
      background-color: #17a2b8;
      padding: 8px 12px;
      font-size: 0.9rem;
    }
  </style>
</head>
<body>
<div class="container-fluid">
  <div class="row">
    <!-- Sidebar -->
    <div class="col-md-3 col-lg-2 d-md-block sidebar">
      <div class="sidebar-header">
        <h4>IRON<span style="color: var(--accent-orange);">FORGE</span></h4>
        <p class="text-muted">Trainer Portal</p>
      </div>
      <div class="sidebar-menu">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" href="trainerDashboard.jsp">
              <i class="fas fa-tachometer-alt me-2"></i> Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="trainerProfile.jsp">
              <i class="fas fa-user me-2"></i> My Profile
            </a>
          </li>
<%--          <li class="nav-item">--%>
<%--            <a class="nav-link" href="trainerSchedule.jsp">--%>
<%--              <i class="fas fa-calendar-alt me-2"></i> My Schedule--%>
<%--            </a>--%>
<%--          </li>--%>
<%--          <li class="nav-item">--%>
<%--            <a class="nav-link" href="trainerMembers.jsp">--%>
<%--              <i class="fas fa-users me-2"></i> My Members--%>
<%--            </a>--%>
<%--          </li>--%>

          <li class="nav-item mt-4">
            <a class="nav-link" href="TrainerLogoutServlet">
              <i class="fas fa-sign-out-alt me-2"></i> Logout
            </a>
          </li>
        </ul>
      </div>
    </div>

    <!-- Main Content -->
    <div class="col-md-9 col-lg-10 ms-sm-auto main-content">
      <h2 class="mb-4">Trainer Dashboard</h2>

      <%-- Get trainer from session --%>
      <% Trainer trainer = (Trainer) session.getAttribute("trainer");
        if (trainer == null) {
          response.sendRedirect("loginTrainer.jsp");
          return;
        }
      %>

      <div class="row mb-4">
        <div class="col-md-3">
          <div class="stats-card">
            <div class="stats-icon">
              <i class="fas fa-calendar-check"></i>
            </div>
            <div class="stats-number">12</div>
            <div class="stats-label">Sessions This Week</div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="stats-card">
            <div class="stats-icon">
              <i class="fas fa-users"></i>
            </div>
            <div class="stats-number">8</div>
            <div class="stats-label">Active Members</div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="stats-card">
            <div class="stats-icon">
              <i class="fas fa-star"></i>
            </div>
            <div class="stats-number">4.9</div>
            <div class="stats-label">Average Rating</div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="stats-card">
            <div class="stats-icon">
              <% if (trainer instanceof FullTimeTrainer) { %>
              <i class="fas fa-user-tie"></i>
              <% } else { %>
              <i class="fas fa-user-clock"></i>
              <% } %>
            </div>
            <div class="stats-label">Trainer Type</div>
            <% if (trainer instanceof FullTimeTrainer) { %>
            <span class="badge badge-fulltime">Full-Time</span>
            <% } else { %>
            <span class="badge badge-parttime">Part-Time</span>
            <% } %>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-4 text-center">
          <img src="https://ui-avatars.com/api/?name=<%= trainer.getName() %>&background=ff6b35&color=fff&size=150"
               alt="Profile Image" class="profile-img mb-3">
          <h4><%= trainer.getName() %></h4>
          <p class="text-muted"><%= trainer.getSpecialty() %> Specialist</p>
        </div>
        <div class="col-md-8">
          <div class="profile-card">
            <h4 class="mb-4">Upcoming Sessions</h4>
            <div class="table-responsive">
              <table class="table">
                <thead>
                <tr>
                  <th>Date</th>
                  <th>Time</th>
                  <th>Member</th>
                  <th>Type</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>2023-06-15</td>
                  <td>09:00 AM</td>
                  <td>John Doe</td>
                  <td>Personal Training</td>
                </tr>
                <tr>
                  <td>2023-06-15</td>
                  <td>11:00 AM</td>
                  <td>Sarah Smith</td>
                  <td>Weight Loss</td>
                </tr>
                <tr>
                  <td>2023-06-16</td>
                  <td>10:00 AM</td>
                  <td>Group Class</td>
                  <td>HIIT</td>
                </tr>
                </tbody>
              </table>
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