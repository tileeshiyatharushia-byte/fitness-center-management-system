<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Admin Dashboard | IRON FORGE FITNESS</title>
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

    .dashboard-header {
      background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)),
      url('https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');
      background-size: cover;
      background-position: center;
      color: white;
      padding: 60px 0;
      margin-bottom: 30px;
      text-align: center;
      position: relative;
    }

    .dashboard-header:after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      width: 100%;
      height: 100px;
      background: linear-gradient(transparent, var(--primary-black));
      z-index: 1;
    }

    .dashboard-header-content {
      position: relative;
      z-index: 2;
    }

    .card {
      background-color: var(--secondary-black);
      border-radius: 10px;
      padding: 30px;
      height: 100%;
      transition: all 0.4s;
      border-left: 4px solid transparent;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }

    .card:hover {
      transform: translateY(-10px);
      border-left: 4px solid var(--accent-orange);
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
    }

    .card-icon {
      font-size: 3rem;
      color: var(--accent-orange);
      margin-bottom: 20px;
      text-shadow: var(--glow-orange);
      transition: all 0.3s;
    }

    .card:hover .card-icon {
      transform: scale(1.1);
    }

    .card-title {
      color: var(--white);
      margin-bottom: 15px;
    }

    .btn-orange {
      background-color: var(--accent-orange);
      color: var(--white);
      border: none;
      font-weight: 700;
      padding: 12px 20px;
      border-radius: 30px;
      text-transform: uppercase;
      letter-spacing: 1px;
      transition: all 0.3s;
      width: 100%;
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
      padding: 10px 20px;
      border-radius: 30px;
      text-transform: uppercase;
      letter-spacing: 1px;
      transition: all 0.3s;
      width: 100%;
    }

    .btn-outline-gray:hover {
      border-color: var(--accent-orange);
      color: var(--accent-orange);
      transform: translateY(-3px);
    }

    .admin-container {
      max-width: 1200px;
      margin: 0 auto 50px;
      padding: 0 15px;
    }

    footer {
      background-color: var(--primary-black);
      padding: 30px 0;
      border-top: 1px solid var(--medium-gray);
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
      .dashboard-header {
        padding: 40px 0;
      }

      .card {
        margin-bottom: 20px;
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
          <a class="nav-link active" href="#"><i class="fas fa-tachometer-alt me-1"></i> Dashboard</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="MemberServlet?action=sortByRenewalDate"><i class="fas fa-users me-1"></i> Members</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="MembershipPlanServlet?action=sortByRenewalDate"><i class="fas fa-list-alt me-1"></i> Plans</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="index.jsp"><i class="fas fa-sign-out-alt me-1"></i> Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<br>
<br>
<br>

<!-- Dashboard Header -->
<header class="dashboard-header">
  <div class="dashboard-header-content">
    <h1><i class="fas fa-tachometer-alt me-2"></i>ADMIN DASHBOARD</h1>
    <p class="lead mb-0">Manage your IRON FORGE FITNESS operations</p>
  </div>
</header>

<!-- Dashboard Content -->
<div class="admin-container">
  <div class="row g-4">
    <!-- Members Card -->
    <div class="col-md-4">
      <div class="card">
        <div class="card-body text-center">
          <div class="card-icon">
            <i class="fas fa-users"></i>
          </div>
          <h3 class="card-title">MEMBERS</h3>
          <p class="card-text">Manage all member accounts and view attendance records</p>
          <a href="MemberServlet?action=sortByRenewalDate" class="btn btn-orange mt-3">
            <i class="fas fa-users me-1"></i> VIEW MEMBERS
          </a>
        </div>
      </div>
    </div>

    <!-- Plans Card -->
    <div class="col-md-4">
      <div class="card">
        <div class="card-body text-center">
          <div class="card-icon">
            <i class="fas fa-list-alt"></i>
          </div>
          <h3 class="card-title">MEMBERSHIP PLANS</h3>
          <p class="card-text">Create, edit, and manage all membership plans</p>
          <div class="d-grid gap-3 mt-3">
            <a href="MembershipPlanServlet?action=sortByRenewalDate" class="btn btn-orange">
              <i class="fas fa-list me-1"></i> VIEW PLANS
            </a>
            <a href="addPlan.jsp" class="btn btn-outline-gray">
              <i class="fas fa-plus me-1"></i> ADD NEW PLAN
            </a>
          </div>
        </div>
      </div>
    </div>

    <!-- Schedule Card -->
    <div class="col-md-4">
      <div class="card">
        <div class="card-body text-center">
          <div class="card-icon">
            <i class="fas fa-chart-bar"></i>
          </div>
          <h3 class="card-title">Schedule</h3>
          <p class="card-text">Add, edit, and manage all schedule plans</p>
          <div class="d-grid gap-3 mt-3">
            <a href="manageClasses.jsp" class="btn btn-orange">
              <i class="fas fa-list me-1"></i> VIEW SCHEDULE
            </a>
            <a href="addClass.jsp" class="btn btn-outline-gray">
              <i class="fas fa-plus me-1"></i> ADD NEW SCHEDULE
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Quick Actions Row -->
  <div class="row mt-4 g-4">
    <div class="col-md-6">
      <div class="card">
        <div class="card-body">
          <h4 class="card-title"><i class="fas fa-user-edit me-2"></i>QUICK MEMBER ACTIONS</h4>
          <div class="d-grid gap-3 mt-3">
            <a href="addMember.jsp" class="btn btn-outline-gray">
              <i class="fas fa-user-plus me-1"></i> ADD NEW MEMBER
            </a>
            <a href="attendanceRecords.jsp" class="btn btn-outline-gray">
              <i class="fas fa-clipboard-check me-1"></i> VIEW ATTENDANCE
            </a>
          </div>
        </div>
      </div>
    </div>

    <div class="col-md-6">
      <div class="card">
        <div class="card-body">
          <h4 class="card-title"><i class="fas fa-cog me-2"></i>SYSTEM MANAGEMENT</h4>
          <div class="d-grid gap-3 mt-3">
            <a href="addTrainer.jsp" class="btn btn-outline-gray">
              <i class="fas fa-user-cog me-1"></i> Add Trainer
            </a>
            <a href="trainerList.jsp" class="btn btn-outline-gray">
              <i class="fas fa-sliders-h me-1"></i> Trainer List
            </a>
            <a href="adminReviews.jsp" class="btn btn-outline-gray">
              <i class="fas fa-star me-1"></i> Manage Reviews
            </a>
          </div>
        </div>
      </div>
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