<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.*, java.util.List, java.time.format.DateTimeFormatter" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.dao.FitnessClassDAO" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.dao.TrainerDAO" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.model.FitnessClass" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.model.Trainer" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.model.GroupClass" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.model.PersonalTraining" %>
<!DOCTYPE html>
<html>
<head>
  <title>Class Management | IRON FORGE FITNESS</title>
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
      --glow-orange: 0 0 10px rgba(255, 107, 53, 0.7);
    }

    body {
      font-family: 'Montserrat', sans-serif;
      background-color: var(--primary-black);
      color: var(--light-gray);
      overflow-x: hidden;
    }

    h1, h2, h3, h4, h5, h6 {
      font-family: 'Oswald', sans-serif;
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    .navbar {
      background-color: rgba(18, 18, 18, 0.95) !important;
      border-bottom: 2px solid var(--accent-orange);
      padding: 15px 0;
      transition: all 0.3s ease;
    }

    .navbar-brand {
      font-weight: 700;
      font-size: 1.8rem;
      color: var(--white) !important;
    }

    .navbar-brand span {
      color: var(--accent-orange);
    }

    .nav-link {
      color: var(--light-gray) !important;
      font-weight: 500;
      margin: 0 10px;
      position: relative;
      padding: 5px 0 !important;
    }

    .nav-link:before {
      content: '';
      position: absolute;
      width: 0;
      height: 2px;
      bottom: 0;
      left: 0;
      background-color: var(--accent-orange);
      visibility: hidden;
      transition: all 0.3s ease-in-out;
    }

    .nav-link:hover:before {
      visibility: visible;
      width: 100%;
    }

    .nav-link:hover {
      color: var(--accent-orange) !important;
    }

    .nav-link.active {
      color: var(--accent-orange) !important;
    }

    .nav-link.active:before {
      visibility: visible;
      width: 100%;
    }

    .card {
      background-color: var(--secondary-black);
      border-radius: 10px;
      border-left: 4px solid var(--accent-orange);
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
      overflow: hidden;
      margin-top: 80px;
    }

    .card-header {
      background-color: var(--dark-gray);
      color: var(--white);
      border-bottom: 1px solid var(--medium-gray);
      padding: 20px;
    }

    .table-container {
      background-color: var(--secondary-black);
      border-radius: 0 0 10px 10px;
      overflow: hidden;
    }

    .table {
      color: var(--light-gray);
      margin-bottom: 0;
    }

    .table thead {
      background-color: var(--dark-gray);
      color: var(--white);
      text-transform: uppercase;
      font-size: 0.9rem;
    }

    .table th {
      border-bottom: 2px solid var(--accent-orange);
      padding: 15px;
    }

    .table td {
      border-bottom: 1px solid var(--medium-gray);
      padding: 15px;
      vertical-align: middle;
    }

    .table tbody tr:hover {
      background-color: rgba(255, 107, 53, 0.05);
    }

    .btn-orange {
      background-color: var(--accent-orange);
      color: var(--white);
      border: none;
      font-weight: 700;
      padding: 8px 15px;
      border-radius: 30px;
      text-transform: uppercase;
      letter-spacing: 1px;
      font-size: 0.8rem;
      transition: all 0.3s;
    }

    .btn-orange:hover {
      background-color: var(--accent-dark-orange);
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(255, 107, 53, 0.3);
    }

    .btn-outline-gray {
      border: 2px solid var(--medium-gray);
      color: var(--light-gray);
      background-color: transparent;
      font-weight: 700;
      padding: 8px 15px;
      border-radius: 30px;
      text-transform: uppercase;
      letter-spacing: 1px;
      font-size: 0.8rem;
      transition: all 0.3s;
    }

    .btn-outline-gray:hover {
      border-color: var(--accent-orange);
      color: var(--accent-orange);
      transform: translateY(-2px);
    }

    .badge-group {
      background-color: #0d6efd;
      color: var(--white);
      font-weight: 700;
      padding: 6px 12px;
      border-radius: 20px;
      text-transform: uppercase;
      font-size: 0.7rem;
    }

    .badge-personal {
      background-color: #0dcaf0;
      color: var(--white);
      font-weight: 700;
      padding: 6px 12px;
      border-radius: 20px;
      text-transform: uppercase;
      font-size: 0.7rem;
    }

    .badge-general {
      background-color: var(--medium-gray);
      color: var(--light-gray);
      font-weight: 700;
      padding: 6px 12px;
      border-radius: 20px;
      text-transform: uppercase;
      font-size: 0.7rem;
    }

    .action-buttons {
      white-space: nowrap;
    }

    .card-footer {
      background-color: var(--dark-gray);
      border-top: 1px solid var(--medium-gray);
      padding: 20px;
    }

    footer {
      background-color: var(--primary-black);
      padding: 30px 0;
      border-top: 1px solid var(--medium-gray);
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
      .table-responsive {
        overflow-x: auto;
      }

      .action-buttons {
        white-space: normal;
      }

      .btn-orange, .btn-outline-gray {
        display: block;
        width: 100%;
        margin-bottom: 5px;
      }
    }
  </style>
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">
      IRON<span>FORGE</span>
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="index.jsp"><i class="fas fa-home me-1"></i> Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminDashboard.jsp"><i class="fas fa-tachometer-alt me-1"></i> Dashboard</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="viewMembers.jsp"><i class="fas fa-users me-1"></i> Members</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="manageClasses.jsp"><i class="fas fa-calendar-alt me-1"></i> Classes</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="index.jsp"><i class="fas fa-sign-out-alt me-1"></i> Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Main Content -->
<div class="container">
  <div class="card">
    <div class="card-header">
      <div class="d-flex justify-content-between align-items-center">
        <h3 class="mb-0"><i class="fas fa-calendar-alt me-2"></i>CLASS MANAGEMENT</h3>
        <div>
          <a href="addClass.jsp" class="btn btn-orange">
            <i class="fas fa-plus me-1"></i> ADD CLASS
          </a>
        </div>
      </div>
    </div>

    <% String success = request.getParameter("success");
      String error = request.getParameter("error");
      if (success != null) { %>
    <div class="alert alert-success m-3"><%= success %></div>
    <% } %>
    <% if (error != null) { %>
    <div class="alert alert-danger m-3"><%= error %></div>
    <% } %>

    <div class="table-container">
      <div class="table-responsive">
        <table class="table table-hover mb-0">
          <thead>
          <tr>
            <th>CLASS ID</th>
            <th>CLASS NAME</th>
            <th>DATE & TIME</th>
            <th>DURATION</th>
            <th>TRAINER</th>
            <th>TYPE</th>
            <th>ACTIONS</th>
          </tr>
          </thead>
          <tbody>
          <%
            FitnessClassDAO classDAO = new FitnessClassDAO();
            TrainerDAO trainerDAO = new TrainerDAO();
            List<FitnessClass> classes = classDAO.getAllClasses();
            List<Trainer> trainers = trainerDAO.getAllTrainers();

            if (classes.isEmpty()) {
          %>
          <tr>
            <td colspan="7" class="text-center py-4">No classes found</td>
          </tr>
          <%
          } else {
            for (FitnessClass fc : classes) {
              String trainerName = "";
              for (Trainer t : trainers) {
                if (t.getTrainerId().equals(fc.getTrainerId())) {
                  trainerName = t.getName();
                  break;
                }
              }
          %>
          <tr>
            <td><%= fc.getClassId() %></td>
            <td><%= fc.getClassName() %></td>
            <td><%= fc.getFormattedDateTime() %></td>
            <td><%= fc.getDuration() %> mins</td>
            <td><%= trainerName %></td>
            <td>
              <% if (fc instanceof GroupClass) { %>
              <span class="badge-group">Group</span>
              <% } else if (fc instanceof PersonalTraining) { %>
              <span class="badge-personal">Personal</span>
              <% } else { %>
              <span class="badge-general">General</span>
              <% } %>
            </td>
            <td class="action-buttons">
              <a href="editClass.jsp?classId=<%= fc.getClassId() %>" class="btn btn-outline-gray me-1">
                <i class="fas fa-edit"></i> EDIT
              </a>
              <form method="post" action="DeleteClassServlet" style="display: inline;">
                <input type="hidden" name="classId" value="<%= fc.getClassId() %>">
                <button type="submit" class="btn btn-outline-gray"
                        onclick="return confirm('Are you sure you want to delete this class?')">
                  <i class="fas fa-trash-alt"></i> DELETE
                </button>
              </form>
            </td>
          </tr>
          <%
              }
            }
          %>
          </tbody>
        </table>
      </div>
    </div>

    <div class="card-footer">
      <a href="adminDashboard.jsp" class="btn btn-outline-gray">
        <i class="fas fa-arrow-left me-1"></i> BACK TO DASHBOARD
      </a>
    </div>
  </div>
</div>

<!-- Footer -->
<footer>
  <div class="container text-center">
    <p class="mb-0">&copy; 2023 IRON FORGE FITNESS. ALL RIGHTS RESERVED.</p>
  </div>
</footer>

<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>