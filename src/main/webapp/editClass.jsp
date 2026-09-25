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
  <title>Edit Class | IRON FORGE FITNESS</title>
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

    .form-container {
      padding: 30px;
    }

    .form-label {
      color: var(--accent-orange);
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
    }

    .btn-outline-orange:hover {
      background-color: var(--accent-orange);
      color: var(--white);
      transform: translateY(-3px);
      box-shadow: 0 10px 20px rgba(255, 107, 53, 0.3);
    }

    .form-check-input:checked {
      background-color: var(--accent-orange);
      border-color: var(--accent-orange);
    }

    .form-check-label {
      color: var(--light-gray);
    }

    .btn-group {
      display: flex;
      gap: 15px;
      margin-top: 30px;
    }

    footer {
      background: linear-gradient(to top, #0a0a0a, #121212);
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
      .btn-group {
        flex-direction: column;
      }

      .form-container {
        padding: 20px;
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
          <a class="nav-link" href="adminDashboard.jsp"><i class="fas fa-sign-out-alt me-1"></i> Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Main Content -->
<div class="container">
  <div class="card">
    <div class="card-header">
      <h3 class="mb-0"><i class="fas fa-calendar-alt me-2"></i>EDIT CLASS</h3>
    </div>

    <div class="form-container">
      <% String error = request.getParameter("error");
        if (error != null) { %>
      <div class="alert alert-danger mb-4"><%= error %></div>
      <% } %>

      <%
        String classId = request.getParameter("classId");
        FitnessClassDAO classDAO = new FitnessClassDAO();
        TrainerDAO trainerDAO = new TrainerDAO();
        FitnessClass fc = null;

        List<FitnessClass> classes = classDAO.getAllClasses();
        for (FitnessClass c : classes) {
          if (c.getClassId().equals(classId)) {
            fc = c;
            break;
          }
        }

        if (fc != null) {
          String dateTimeValue = fc.getDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm"));
      %>
      <form method="post" action="UpdateClassServlet">
        <input type="hidden" name="classId" value="<%= fc.getClassId() %>">

        <div class="row">
          <div class="col-md-6">
            <label for="classId" class="form-label">CLASS ID</label>
            <input type="text" class="form-control" id="classId"
                   name="classId" value="<%= fc.getClassId() %>" readonly>
          </div>
          <div class="col-md-6">
            <label for="className" class="form-label">CLASS NAME</label>
            <input type="text" class="form-control" id="className"
                   name="className" value="<%= fc.getClassName() %>" required>
          </div>
        </div>

        <div class="row">
          <div class="col-md-6">
            <label for="dateTime" class="form-label">DATE & TIME</label>
            <input type="datetime-local" class="form-control" id="dateTime"
                   name="dateTime" value="<%= dateTimeValue %>" required>
          </div>
          <div class="col-md-6">
            <label for="duration" class="form-label">DURATION (MINUTES)</label>
            <input type="number" class="form-control" id="duration"
                   name="duration" min="15" max="180" value="<%= fc.getDuration() %>" required>
          </div>
        </div>

        <label for="trainerId" class="form-label">TRAINER</label>
        <select class="form-select" id="trainerId" name="trainerId" required>
          <option value="">Select Trainer</option>
          <%
            List<Trainer> trainers = trainerDAO.getAllTrainers();
            for (Trainer trainer : trainers) {
              String selected = trainer.getTrainerId().equals(fc.getTrainerId()) ? "selected" : "";
          %>
          <option value="<%= trainer.getTrainerId() %>" <%= selected %>>
            <%= trainer.getName() %> (<%= trainer.getSpecialty() %>)
          </option>
          <% } %>
        </select>

        <label for="maxParticipants" class="form-label">MAX PARTICIPANTS</label>
        <input type="number" class="form-control" id="maxParticipants"
               name="maxParticipants" min="1" value="<%= fc.getMaxParticipants() %>" required>

        <label for="description" class="form-label">DESCRIPTION</label>
        <textarea class="form-control" id="description" name="description"
                  rows="3" required><%= fc.getDescription() %></textarea>

        <label class="form-label">CLASS TYPE</label>
        <div class="mb-4">
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="classType" id="generalType"
                   value="general" <%= !(fc instanceof GroupClass) && !(fc instanceof PersonalTraining) ? "checked" : "" %>>
            <label class="form-check-label" for="generalType">General Class</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="classType" id="groupType"
                   value="group" <%= fc instanceof GroupClass ? "checked" : "" %>>
            <label class="form-check-label" for="groupType">Group Class</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="classType" id="personalType"
                   value="personal" <%= fc instanceof PersonalTraining ? "checked" : "" %>>
            <label class="form-check-label" for="personalType">Personal Training</label>
          </div>
        </div>

<%--        <div id="groupTypeFields" class="mb-3" style="<%= fc instanceof GroupClass ? "display: block;" : "display: none;" %>">--%>
<%--          <label for="groupType" class="form-label">GROUP TYPE</label>--%>
<%--          <input type="text" class="form-control" id="groupType"--%>
<%--                 name="groupType" value="<%= fc instanceof GroupClass ? ((GroupClass) fc).getGroupType() : "" %>">--%>
<%--        </div>--%>

<%--        <div id="personalTypeFields" class="mb-3" style="<%= fc instanceof PersonalTraining ? "display: block;" : "display: none;" %>">--%>
<%--          <label for="focusArea" class="form-label">FOCUS AREA</label>--%>
<%--          <input type="text" class="form-control" id="focusArea"--%>
<%--                 name="focusArea" value="<%= fc instanceof PersonalTraining ? ((PersonalTraining) fc).getFocusArea() : "" %>">--%>
<%--        </div>--%>

        <div class="btn-group">
          <a href="manageClasses.jsp" class="btn btn-outline-orange">CANCEL</a>
          <button type="submit" class="btn btn-orange">UPDATE CLASS</button>
        </div>
      </form>
      <% } else { %>
      <div class="alert alert-danger">Class not found</div>
      <a href="manageClasses.jsp" class="btn btn-outline-orange">Back to Classes</a>
      <% } %>
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