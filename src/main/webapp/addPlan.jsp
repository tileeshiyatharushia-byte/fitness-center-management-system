<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Add Plan | IRON FORGE FITNESS</title>
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

    .form-container {
      max-width: 700px;
      margin: 50px auto;
      padding: 40px;
      background-color: var(--secondary-black);
      border-radius: 10px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
      border-left: 4px solid var(--accent-orange);
    }

    .form-title {
      color: var(--white);
      margin-bottom: 30px;
      position: relative;
      padding-bottom: 15px;
      text-align: center;
    }

    .form-title:after {
      content: '';
      position: absolute;
      width: 100px;
      height: 4px;
      background: var(--accent-orange);
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
    }

    .form-label {
      color: var(--light-gray);
      font-weight: 500;
      margin-bottom: 8px;
    }

    .form-control, .form-select {
      background-color: var(--dark-gray);
      border: 1px solid var(--medium-gray);
      color: var(--light-gray);
      padding: 12px;
      transition: all 0.3s;
      height: 45px;
    }

    .form-control:focus, .form-select:focus {
      background-color: var(--dark-gray);
      color: var(--white);
      border-color: var(--accent-orange);
      box-shadow: 0 0 0 0.25rem rgba(255, 107, 53, 0.25);
    }

    .input-group-text {
      background-color: var(--dark-gray);
      border: 1px solid var(--medium-gray);
      color: var(--accent-orange);
      min-width: 45px;
      justify-content: center;
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

    .btn-outline-gray {
      border: 2px solid var(--medium-gray);
      color: var(--light-gray);
      background-color: transparent;
      font-weight: 700;
      padding: 10px 28px;
      border-radius: 30px;
      text-transform: uppercase;
      letter-spacing: 1px;
      transition: all 0.3s;
    }

    .btn-outline-gray:hover {
      border-color: var(--accent-orange);
      color: var(--accent-orange);
      transform: translateY(-3px);
    }

    footer {
      background-color: var(--primary-black);
      padding: 30px 0;
      border-top: 1px solid var(--medium-gray);
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
      .form-container {
        padding: 30px 20px;
        margin: 30px auto;
      }

      .form-title:after {
        width: 60px;
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
          <a class="nav-link active" href="viewPlans.jsp"><i class="fas fa-list-alt me-1"></i> Plans</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="login.jsp"><i class="fas fa-sign-out-alt me-1"></i> Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Main Form Container -->
<div class="container my-5" style="padding-top: 80px;">
  <div class="form-container">
    <h1 class="form-title">
      <i class="fas fa-plus-circle me-2"></i>ADD NEW PLAN
    </h1>

    <form action="MembershipPlanServlet" method="POST">
      <input type="hidden" name="action" value="add">

      <div class="mb-4">
        <label for="planId" class="form-label">PLAN ID</label>
        <div class="input-group">
          <span class="input-group-text"><i class="fas fa-id-card"></i></span>
          <input type="text" class="form-control" id="planId" name="planId" required>
        </div>
      </div>

      <div class="mb-4">
        <label for="planName" class="form-label">PLAN NAME</label>
        <div class="input-group">
          <span class="input-group-text"><i class="fas fa-tag"></i></span>
          <input type="text" class="form-control" id="planName" name="planName" required>
        </div>
      </div>

      <div class="mb-4">
        <label for="duration" class="form-label">DURATION (MONTHS)</label>
        <div class="input-group">
          <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
          <input type="number" class="form-control" id="duration" name="duration" min="1" required>
        </div>
      </div>

      <div class="mb-4">
        <label for="price" class="form-label">PRICE (LKR)</label>
        <div class="input-group">
          <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
          <input type="number" class="form-control" id="price" name="price" min="0" step="0.01" required>
        </div>
      </div>

      <div class="d-flex justify-content-between mt-5">
        <a href="adminDashboard.jsp" class="btn btn-outline-gray px-4">
          <i class="fas fa-times me-1"></i> CANCEL
        </a>
        <button type="submit" class="btn btn-orange px-4">
          <i class="fas fa-save me-1"></i> SAVE PLAN
        </button>
      </div>
    </form>
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