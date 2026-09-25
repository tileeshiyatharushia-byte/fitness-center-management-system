<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.*, java.util.List" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.dao.TrainerDAO" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.model.Trainer" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Class | Iron Forge Fitness</title>
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

    .navbar.scrolled {
      padding: 10px 0;
      background-color: var(--primary-black) !important;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
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

    .form-section {
      background-color: var(--dark-gray);
      padding: 80px 0;
      min-height: calc(100vh - 120px);
    }

    .form-container {
      background-color: var(--secondary-black);
      border-radius: 10px;
      padding: 40px;
      max-width: 800px;
      margin: 0 auto;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
    }

    .form-title {
      color: var(--accent-orange);
      margin-bottom: 30px;
      text-align: center;
      position: relative;
      padding-bottom: 15px;
    }

    .form-title:after {
      content: '';
      position: absolute;
      width: 80px;
      height: 3px;
      background: var(--accent-orange);
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
    }

    .form-label {
      color: var(--light-gray);
      font-weight: 600;
      margin-bottom: 8px;
    }

    .form-control, .form-select {
      background-color: var(--primary-black);
      border: 1px solid var(--medium-gray);
      color: var(--light-gray);
      padding: 12px 15px;
      margin-bottom: 20px;
    }

    .form-control:focus, .form-select:focus {
      background-color: var(--primary-black);
      border-color: var(--accent-orange);
      color: var(--light-gray);
      box-shadow: 0 0 0 0.25rem rgba(255, 107, 53, 0.25);
    }

    .btn-orange {
      background-color: var(--accent-orange);
      color: var(--white);
      border: none;
      font-weight: 700;
      padding: 12px 30px;
      border-radius: 30px;
      text-transform: uppercase;
      letter-spacing: 1px;
      transition: all 0.3s;
      width: 100%;
      margin-top: 10px;
    }

    .btn-orange:hover {
      background-color: var(--accent-dark-orange);
      transform: translateY(-3px);
      box-shadow: 0 10px 20px rgba(255, 107, 53, 0.3);
      color: var(--white);
    }

    .btn-outline-orange {
      border: 2px solid var(--accent-orange);
      color: var(--accent-orange);
      background-color: transparent;
      font-weight: 700;
      padding: 10px 28px;
      border-radius: 30px;
      text-transform: uppercase;
      letter-spacing: 1px;
      transition: all 0.3s;
      width: 100%;
      margin-top: 10px;
    }

    .btn-outline-orange:hover {
      background-color: var(--accent-orange);
      color: var(--white);
      transform: translateY(-3px);
      box-shadow: 0 10px 20px rgba(255, 107, 53, 0.3);
    }

    .btn-group {
      display: flex;
      gap: 15px;
      margin-top: 30px;
    }

    footer {
      background-color: var(--primary-black);
      padding: 30px 0 20px;
      border-top: 1px solid var(--medium-gray);
    }

    .copyright {
      text-align: center;
      padding-top: 20px;
      margin-top: 20px;
      border-top: 1px solid var(--medium-gray);
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
      .form-container {
        padding: 30px 20px;
      }

      .btn-group {
        flex-direction: column;
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
          <a class="nav-link" href="addMember.jsp"><i class="fas fa-user-plus me-1"></i> Register</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="viewPlans.jsp"><i class="fas fa-list-alt me-1"></i> Plans</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="publicTrainers.jsp"><i class="fas fa-users me-1"></i> Our Trainers</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="publicClassSchedule.jsp"><i class="fas fa-calendar-alt me-1"></i> Class Schedule</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="adminDashboard.jsp"><i class="fas fa-cog me-1"></i> Admin</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Form Section -->
<section class="form-section">
  <div class="container">
    <div class="form-container">
      <h2 class="form-title">ADD NEW CLASS</h2>

      <% String error = request.getParameter("error");
        if (error != null) { %>
      <div class="alert alert-danger"><%= error %></div>
      <% } %>

      <form method="post" action="AddClassServlet">
        <div class="row">
          <div class="col-md-6">
            <label for="classId" class="form-label">CLASS ID</label>
            <input type="text" class="form-control" id="classId" name="classId" required>
          </div>
          <div class="col-md-6">
            <label for="className" class="form-label">CLASS NAME</label>
            <input type="text" class="form-control" id="className" name="className" required>
          </div>
        </div>

        <div class="row">
          <div class="col-md-6">
            <label for="dateTime" class="form-label">DATE & TIME</label>
            <input type="datetime-local" class="form-control" id="dateTime" name="dateTime" required>
          </div>
          <div class="col-md-6">
            <label for="duration" class="form-label">DURATION (MINUTES)</label>
            <input type="number" class="form-control" id="duration" name="duration" min="15" max="180" required>
          </div>
        </div>

        <label for="trainerId" class="form-label">TRAINER</label>
        <select class="form-select" id="trainerId" name="trainerId" required>
          <option value="">Select Trainer</option>
          <%
            TrainerDAO trainerDAO = new TrainerDAO();
            List<Trainer> trainers = trainerDAO.getAllTrainers();
            for (Trainer trainer : trainers) {
          %>
          <option value="<%= trainer.getTrainerId() %>">
            <%= trainer.getName() %> (<%= trainer.getSpecialty() %>)
          </option>
          <% } %>
        </select>

        <label for="maxParticipants" class="form-label">MAX PARTICIPANTS</label>
        <input type="number" class="form-control" id="maxParticipants" name="maxParticipants" min="1" required>

        <label for="description" class="form-label">DESCRIPTION</label>
        <textarea class="form-control" id="description" name="description" rows="3" required></textarea>

        <label class="form-label">CLASS TYPE</label>
        <div class="mb-3">
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="classType" id="generalType" value="general" checked>
            <label class="form-check-label" for="generalType">General Class</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="classType" id="groupType" value="group">
            <label class="form-check-label" for="groupType">Group Class</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="classType" id="personalType" value="personal">
            <label class="form-check-label" for="personalType">Personal Training</label>
          </div>
        </div>

<%--        <div id="groupTypeFields" class="mb-3" style="display: none;">--%>
<%--          <label for="groupType" class="form-label">GROUP TYPE</label>--%>
<%--          <input type="text" class="form-control" id="groupType" name="groupType">--%>
<%--        </div>--%>

<%--        <div id="personalTypeFields" class="mb-3" style="display: none;">--%>
<%--          <label for="focusArea" class="form-label">FOCUS AREA</label>--%>
<%--          <input type="text" class="form-control" id="focusArea" name="focusArea">--%>
<%--        </div>--%>

        <div class="btn-group">
          <a href="manageClasses.jsp" class="btn btn-outline-orange">CANCEL</a>
          <button type="submit" class="btn btn-orange">ADD CLASS</button>
        </div>
      </form>
    </div>
  </div>
</section>

<!-- Footer -->
<footer>
  <div class="container text-center">
    <p class="mb-0">&copy; 2023 IRON FORGE FITNESS. ALL RIGHTS RESERVED.</p>
  </div>
</footer>


<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // Navbar scroll effect
  window.addEventListener('scroll', function() {
    const navbar = document.querySelector('.navbar');
    if (window.scrollY > 50) {
      navbar.classList.add('scrolled');
    } else {
      navbar.classList.remove('scrolled');
    }
  });

  // Show/hide class type specific fields
  document.addEventListener('DOMContentLoaded', function() {
    const generalType = document.getElementById('generalType');
    const groupType = document.getElementById('groupType');
    const personalType = document.getElementById('personalType');
    const groupTypeFields = document.getElementById('groupTypeFields');
    const personalTypeFields = document.getElementById('personalTypeFields');

    generalType.addEventListener('change', function() {
      groupTypeFields.style.display = 'none';
      personalTypeFields.style.display = 'none';
    });

    groupType.addEventListener('change', function() {
      groupTypeFields.style.display = 'block';
      personalTypeFields.style.display = 'none';
    });

    personalType.addEventListener('change', function() {
      groupTypeFields.style.display = 'none';
      personalTypeFields.style.display = 'block';
    });
  });
</script>
</body>
</html>