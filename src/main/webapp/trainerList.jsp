<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.model.Trainer" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.dao.TrainerDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Iron Forge Fitness | Trainer List</title>
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

    .table-container {
      background-color: var(--secondary-black);
      border-radius: 10px;
      padding: 30px;
      margin-top: 50px;
      border-left: 4px solid var(--accent-orange);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }

    .table-title {
      color: var(--accent-orange);
      margin-bottom: 30px;
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    .table {
      color: var(--light-gray);
      margin-bottom: 0;
    }

    .table th {
      border-bottom: 2px solid var(--accent-orange);
      text-transform: uppercase;
      letter-spacing: 1px;
      font-weight: 700;
    }

    .table td {
      border-bottom: 1px solid var(--medium-gray);
      vertical-align: middle;
    }

    .badge-fulltime {
      background-color: #28a745;
    }

    .badge-parttime {
      background-color: #17a2b8;
    }

    .search-box {
      background-color: var(--dark-gray);
      border: 1px solid var(--medium-gray);
      color: var(--light-gray);
      padding: 10px 15px;
      border-radius: 30px;
      margin-bottom: 20px;
    }

    .search-box:focus {
      background-color: var(--dark-gray);
      color: var(--light-gray);
      border-color: var(--accent-orange);
      box-shadow: 0 0 0 0.25rem rgba(255, 107, 53, 0.25);
    }

    .btn-orange {
      background-color: var(--accent-orange);
      color: var(--white);
      border: none;
      font-weight: 700;
      padding: 8px 20px;
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
      padding: 6px 18px;
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

    .message {
      padding: 10px;
      margin-bottom: 20px;
      border-radius: 5px;
    }

    .success {
      background-color: rgba(40, 167, 69, 0.2);
      color: #28a745;
      border: 1px solid #28a745;
    }

    .error {
      background-color: rgba(220, 53, 69, 0.2);
      color: #dc3545;
      border: 1px solid #dc3545;
    }
  </style>
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: rgba(18, 18, 18, 0.95); border-bottom: 2px solid var(--accent-orange);">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">
      IRON<span style="color: var(--accent-orange);">FORGE</span>
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="addTrainer.jsp"><i class="fas fa-user-plus me-1"></i> Add Trainer</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="trainerList.jsp"><i class="fas fa-list me-1"></i> Trainer List</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminDashboard.jsp"><i class="fas fa-sign-in-alt me-1"></i> Back</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">
  <div class="row justify-content-center">
    <div class="col-lg-10">
      <div class="table-container">
        <h2 class="table-title text-center">Trainer Management</h2>

        <%-- Display message if any --%>
        <% if (request.getAttribute("message") != null) { %>
        <div class="message success">
          <%= request.getAttribute("message") %>
        </div>
        <% } %>


        <div class="table-responsive">
          <table class="table">
            <thead>
            <tr>
              <th>ID</th>
              <th>Name</th>
              <th>Email</th>
              <th>Contact</th>
              <th>Specialty</th>
              <th>Type</th>
              <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
              TrainerDAO trainerDAO = new TrainerDAO();
              List<Trainer> trainers = trainerDAO.getAllTrainers();

              if (trainers.isEmpty()) {
            %>
            <tr>
              <td colspan="7" class="text-center">No trainers found</td>
            </tr>
            <%
            } else {
              for (Trainer trainer : trainers) {
            %>
            <tr>
              <td><%= trainer.getTrainerId() %></td>
              <td><%= trainer.getName() %></td>
              <td><%= trainer.getEmail() %></td>
              <td><%= trainer.getContactNumber() %></td>
              <td><%= trainer.getSpecialty() %></td>
              <td>
                <% if (trainer instanceof lk.sliit.fitnesscenter.fitnesscenterproject.model.FullTimeTrainer) { %>
                <span class="badge badge-fulltime">Full-Time</span>
                <% } else { %>
                <span class="badge badge-parttime">Part-Time</span>
                <% } %>
              </td>
              <td>
                <div class="d-flex gap-2">
                  <a href="editTrainer.jsp?trainerId=<%= trainer.getTrainerId() %>" class="btn btn-sm btn-outline-orange">
                    <i class="fas fa-edit"></i> Edit
                  </a>
                  <form action="DeleteTrainerServlet" method="POST" style="display: inline;">
                    <input type="hidden" name="trainerId" value="<%= trainer.getTrainerId() %>">
                    <button type="submit" class="btn btn-sm btn-outline-danger" onclick="return confirm('Are you sure you want to delete this trainer?');">
                      <i class="fas fa-trash"></i> Delete
                    </button>
                  </form>
                </div>
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
    </div>
  </div>
</div>

<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>