<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.model.Trainer" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.model.FullTimeTrainer" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.model.PartTimeTrainer" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Iron Forge Fitness | Trainer Profile</title>
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

    .form-control:disabled {
      background-color: var(--dark-gray);
      opacity: 0.7;
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

    .trainer-details {
      background-color: var(--dark-gray);
      padding: 20px;
      border-radius: 5px;
      margin-bottom: 20px;
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
            <a class="nav-link" href="trainerDashboard.jsp">
              <i class="fas fa-tachometer-alt me-2"></i> Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="trainerProfile.jsp">
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
      <h2 class="mb-4">My Profile</h2>

      <%-- Get trainer from session --%>
      <% Trainer trainer = (Trainer) session.getAttribute("trainer");
        if (trainer == null) {
          response.sendRedirect("loginTrainer.jsp");
          return;
        }
      %>

      <div class="row">
        <div class="col-md-4 text-center">
          <img src="https://ui-avatars.com/api/?name=<%= trainer.getName() %>&background=ff6b35&color=fff&size=150"
               alt="Profile Image" class="profile-img mb-3">
          <h4><%= trainer.getName() %></h4>
          <% if (trainer instanceof FullTimeTrainer) { %>
          <span class="badge badge-fulltime">Full-Time Trainer</span>
          <% } else { %>
          <span class="badge badge-parttime">Part-Time Trainer</span>
          <% } %>

          <!-- Trainer-specific details -->
          <div class="trainer-details mt-3">
            <h5 class="mb-3">Professional Details</h5>
            <% if (trainer instanceof FullTimeTrainer) {
              FullTimeTrainer ft = (FullTimeTrainer) trainer;
            %>
            <p><strong>Monthly Salary:</strong> $<%= String.format("%.2f", ft.getSalary()) %></p>
            <p><strong>Working Hours:</strong> <%= ft.getWorkingHours() %> hrs/week</p>
            <% } else if (trainer instanceof PartTimeTrainer) {
              PartTimeTrainer pt = (PartTimeTrainer) trainer;
            %>
            <p><strong>Hourly Rate:</strong> $<%= String.format("%.2f", pt.getHourlyRate()) %></p>
            <p><strong>Weekly Hours:</strong> <%= pt.getHoursPerWeek() %> hrs</p>
            <% } %>
            <p><strong>Specialty:</strong> <%= trainer.getSpecialty() %></p>
          </div>
        </div>
        <div class="col-md-8">
          <div class="profile-card">
            <h4 class="mb-4">Personal Information</h4>
            <form action="UpdateForTrainerServlet" method="POST">
              <input type="hidden" name="trainerId" value="<%= trainer.getTrainerId() %>">

              <div class="row">
                <div class="col-md-6">
                  <div class="mb-3">
                    <label for="trainerId" class="form-label">Trainer ID</label>
                    <input type="text" class="form-control" id="trainerId" value="<%= trainer.getTrainerId() %>" disabled>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="mb-3">
                    <label for="name" class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="<%= trainer.getName() %>" required>
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= trainer.getEmail() %>" required>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="mb-3">
                    <label for="contactNumber" class="form-label">Contact Number</label>
                    <input type="tel" class="form-control" id="contactNumber" name="contactNumber" value="<%= trainer.getContactNumber() %>" required>
                  </div>
                </div>
              </div>

              <div class="mb-3">
                <label for="specialty" class="form-label">Specialty</label>
                <input type="text" class="form-control" id="specialty" name="specialty" value="<%= trainer.getSpecialty() %>" required>
              </div>

              <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" value="<%= trainer.getPassword() %>" required>
              </div>

              <!-- Hidden fields for trainer type specific data -->
              <% if (trainer instanceof FullTimeTrainer) {
                FullTimeTrainer ft = (FullTimeTrainer) trainer;
              %>
              <input type="hidden" name="salary" value="<%= ft.getSalary() %>">
              <input type="hidden" name="workingHours" value="<%= ft.getWorkingHours() %>">
              <% } else if (trainer instanceof PartTimeTrainer) {
                PartTimeTrainer pt = (PartTimeTrainer) trainer;
              %>
              <input type="hidden" name="hourlyRate" value="<%= pt.getHourlyRate() %>">
              <input type="hidden" name="hoursPerWeek" value="<%= pt.getHoursPerWeek() %>">
              <% } %>

              <button type="submit" class="btn btn-update">Update Profile</button>
            </form>
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