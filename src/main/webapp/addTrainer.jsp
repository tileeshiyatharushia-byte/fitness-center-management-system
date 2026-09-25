<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Iron Forge Fitness | Add Trainer</title>
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

    .form-container {
      background-color: var(--secondary-black);
      border-radius: 10px;
      padding: 30px;
      margin-top: 50px;
      border-left: 4px solid var(--accent-orange);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }

    .form-title {
      color: var(--accent-orange);
      margin-bottom: 30px;
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    .form-label {
      font-weight: 600;
      margin-bottom: 5px;
    }

    .form-control {
      background-color: var(--dark-gray);
      border: 1px solid var(--medium-gray);
      color: var(--light-gray);
      padding: 10px 15px;
      margin-bottom: 20px;
    }

    .form-control:focus {
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

    .trainer-type-section {
      display: none;
      padding: 20px;
      background-color: var(--dark-gray);
      border-radius: 5px;
      margin-bottom: 20px;
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
          <a class="nav-link" href="index.jsp"><i class="fas fa-home me-1"></i> Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="addTrainer.jsp"><i class="fas fa-user-plus me-1"></i> Add Trainer</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="trainerList.jsp"><i class="fas fa-list me-1"></i> Trainer List</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminDashboard.jsp"><i class="fas fa-sign-in-alt me-1"></i> Back</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container" align="center">
  <div class="row justify-content-center">
    <div class="col-lg-8">
      <div class="form-container">
        <h2 class="form-title text-center">Add New Trainer</h2>

        <%-- Display message if any --%>
        <% if (request.getAttribute("message") != null) { %>
        <div class="message success">
          <%= request.getAttribute("message") %>
        </div>
        <% } %>

        <form action="AddTrainerServlet" method="POST">
          <div class="row">
            <div class="col-md-6">
              <div class="mb-3">
                <label for="trainerId" class="form-label">Trainer ID</label>
                <input type="text" class="form-control" id="trainerId" name="trainerId" required>
              </div>
            </div>
            <div class="col-md-6">
              <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-6">
              <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
              </div>
            </div>
            <div class="col-md-6">
              <div class="mb-3">
                <label for="contactNumber" class="form-label">Contact Number</label>
                <input type="tel" class="form-control" id="contactNumber" name="contactNumber" required>
              </div>
            </div>
          </div>

          <div class="mb-3">
            <label for="specialty" class="form-label">Specialty</label>
            <input type="text" class="form-control" id="specialty" name="specialty" required>
          </div>

          <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
          </div>

          <div class="mb-3">
            <label class="form-label">Trainer Type</label>
            <div class="d-flex gap-3">
              <div class="form-check">
                <input class="form-check-input" type="radio" name="trainerType" id="fullTime" value="FULLTIME" checked>
                <label class="form-check-label" for="fullTime">
                  Full-Time
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="trainerType" id="partTime" value="PARTTIME">
                <label class="form-check-label" for="partTime">
                  Part-Time
                </label>
              </div>
            </div>
          </div>

          <!-- Full-Time Trainer Fields -->
          <div id="fullTimeFields" class="trainer-type-section">
            <div class="row">
              <div class="col-md-6">
                <div class="mb-3">
                  <label for="salary" class="form-label">Monthly Salary ($)</label>
                  <input type="number" step="0.01" class="form-control" id="salary" name="salary" value="2000.00">
                </div>
              </div>
              <div class="col-md-6">
                <div class="mb-3">
                  <label for="workingHours" class="form-label">Working Hours/Week</label>
                  <input type="number" class="form-control" id="workingHours" name="workingHours" value="40">
                </div>
              </div>
            </div>
          </div>

          <!-- Part-Time Trainer Fields -->
          <div id="partTimeFields" class="trainer-type-section" style="display: none;">
            <div class="row">
              <div class="col-md-6">
                <div class="mb-3">
                  <label for="hourlyRate" class="form-label">Hourly Rate ($)</label>
                  <input type="number" step="0.01" class="form-control" id="hourlyRate" name="hourlyRate" value="25.00">
                </div>
              </div>
              <div class="col-md-6">
                <div class="mb-3">
                  <label for="hoursPerWeek" class="form-label">Hours/Week</label>
                  <input type="number" class="form-control" id="hoursPerWeek" name="hoursPerWeek" value="20">
                </div>
              </div>
            </div>
          </div>

          <div class="text-center mt-4">
            <button type="submit" class="btn btn-orange">Add Trainer</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function() {
    // Show/hide trainer type specific fields
    $('input[name="trainerType"]').change(function() {
      if ($(this).val() === 'FULLTIME') {
        $('#fullTimeFields').show();
        $('#partTimeFields').hide();
      } else {
        $('#fullTimeFields').hide();
        $('#partTimeFields').show();
      }
    });
  });
</script>
</body>
</html>