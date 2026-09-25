<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Membership Plans | Iron Forge Fitness</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

    h1, h2, h3, h4, h5, h6 {
      font-family: 'Oswald', sans-serif;
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    .navbar {
      background-color: rgba(18, 18, 18, 0.95) !important;
      border-bottom: 2px solid var(--accent-orange);
      padding: 15px 0;
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

    .section-title {
      position: relative;
      display: inline-block;
      margin-bottom: 3rem;
      color: var(--white);
    }

    .section-title:after {
      content: '';
      position: absolute;
      width: 50%;
      height: 4px;
      background: var(--accent-orange);
      bottom: -10px;
      left: 0;
    }

    .card {
      background-color: var(--secondary-black);
      border: none;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }

    .card-header {
      background-color: var(--dark-gray);
      color: var(--white);
      border-bottom: 2px solid var(--accent-orange);
      padding: 1.5rem;
    }

    .table {
      color: var(--light-gray);
      margin-bottom: 0;
    }

    .table thead {
      background-color: var(--dark-gray);
      color: var(--white);
    }

    .table tbody tr {
      background-color: var(--secondary-black);
      transition: all 0.3s;
    }

    .table tbody tr:hover {
      background-color: var(--medium-gray);
    }

    .table th, .table td {
      padding: 1.25rem;
      vertical-align: middle;
      border-color: var(--medium-gray);
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

    .badge {
      padding: 0.5em 0.8em;
      font-weight: 700;
      letter-spacing: 1px;
    }

    .badge-premium {
      background-color: #f39c12;
    }

    .badge-regular {
      background-color: #2ecc71;
    }

    footer {
      background: linear-gradient(to top, #0a0a0a, #121212);
      padding: 60px 0 20px;
      margin-top: 60px;
    }

    .copyright {
      border-top: 1px solid var(--medium-gray);
      padding-top: 20px;
      margin-top: 40px;
      text-align: center;
    }
  </style>
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
  <div class="container">
    <a class="navbar-brand" href="#">
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
          <a class="nav-link active" href="viewPlans.jsp"><i class="fas fa-list-alt me-1"></i> Plans</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="attendanceRecords.jsp"><i class="fas fa-list-alt me-1"></i> View Attendance Records</a>
        </li>
<%--        <li class="nav-item dropdown">--%>
<%--          <a class="nav-link dropdown-toggle" href="#" id="attendanceDropdown" role="button" data-bs-toggle="dropdown">--%>
<%--            <i class="fas fa-clipboard-check me-1"></i> Attendance--%>
<%--          </a>--%>
<%--          <ul class="dropdown-menu dropdown-menu-dark">--%>
<%--            <li><a class="dropdown-item" href="memberCheckIn.jsp">Check-In</a></li>--%>
<%--            <li><a class="dropdown-item" href="memberCheckOut.jsp">Check-Out</a></li>--%>
<%--            <li><a class="dropdown-item" href="attendanceRecords.jsp">View Attendance Records</a></li>--%>
<%--          </ul>--%>
<%--        </li>--%>
        <li class="nav-item">
          <a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt me-1"></i> Admin</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Main Content -->
<div class="container my-5" style="padding-top: 80px;">
  <div class="card">
    <div class="card-header">
      <!-- Add this button in the card-header div, next to the sort button -->
      <div class="d-flex justify-content-between align-items-center">
        <h3 class="mb-0"><i class="fas fa-list-alt me-2"></i>MEMBERSHIP PLANS</h3>
        <div>
          <a href="MembershipPlanServlet?action=sortByRenewalDate" class="btn btn-sm btn-outline-orange me-2">
            <i class="fas fa-sort me-1"></i> SORT BY RENEWAL DATE
          </a>
          <form action="MembershipPlanServlet" method="post" style="display: inline;">
            <input type="hidden" name="action" value="dequeue">
            <button type="submit" class="btn btn-sm btn-outline-danger">
              <i class="fas fa-sign-out-alt me-1"></i> Delete Plan
            </button>
          </form>
        </div>
      </div>

      <!-- Add this alert section at the top of the main content to show dequeued plan -->
      <c:if test="${not empty dequeuedPlan}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
          Dequeued plan: <strong>${dequeuedPlan.planName}</strong> (ID: ${dequeuedPlan.planId})
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
      </c:if>
    </div>

    <div class="table-responsive">
      <table class="table table-hover mb-0">
        <thead>
        <tr>
          <th>PLAN ID</th>
          <th>PLAN NAME</th>
          <th>DURATION</th>
          <th>PRICE</th>
          <th>ACTIONS</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="plan" items="${plans}">
          <tr>
            <td>${plan.planId}</td>
            <td>
                            <span class="badge ${plan.planName eq 'Premium' ? 'badge-premium' : 'badge-regular'} rounded-pill me-2">
                                ${plan.planName}
                            </span>
            </td>
            <td>${plan.duration} MONTHS</td>
            <td>LKR${plan.price}</td>
            <td>
              <div class="d-flex gap-2">
                <a href="editPlan.jsp?planId=${plan.planId}" class="btn btn-sm btn-orange">
                  <i class="fas fa-edit me-1"></i> EDIT
                </a>

              </div>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>

    <div class="card-footer">
      <div class="d-flex justify-content-between">
        <a href="adminDashboard.jsp" class="btn btn-outline-orange">
          <i class="fas fa-arrow-left me-1"></i> BACK TO DASHBOARD
        </a>
        <a href="addPlan.jsp" class="btn btn-orange">
          <i class="fas fa-plus me-1"></i> ADD NEW PLAN
        </a>
      </div>
    </div>
  </div>
</div>

<!-- Footer -->
<footer>
  <div class="container">
    <div class="row">
      <div class="col-lg-4 mb-4">
        <div class="footer-logo">IRON<span>FORGE</span></div>
        <p>Premium fitness facility dedicated to helping you achieve your health and wellness goals through expert guidance and world-class facilities.</p>
        <div class="social-icons mt-3">
          <a href="#"><i class="fab fa-facebook-f"></i></a>
          <a href="#"><i class="fab fa-instagram"></i></a>
          <a href="#"><i class="fab fa-twitter"></i></a>
          <a href="#"><i class="fab fa-youtube"></i></a>
        </div>
      </div>
      <div class="col-lg-2 col-md-6 mb-4">
        <div class="footer-links">
          <h5>Links</h5>
          <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="addMember.jsp">Register</a></li>
            <li><a href="viewPlans.jsp">Plans</a></li>
            <li><a href="login.jsp">Admin</a></li>
          </ul>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="footer-links">
          <h5>Facilities</h5>
          <ul>
            <li><a href="#">Weight Training</a></li>
            <li><a href="#">Cardio Zone</a></li>
            <li><a href="#">Functional Area</a></li>
            <li><a href="#">Recovery Lounge</a></li>
          </ul>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="footer-links">
          <h5>Contact</h5>
          <ul>
            <li><i class="fas fa-map-marker-alt me-2"></i> 123 Fitness St, City</li>
            <li><i class="fas fa-phone me-2"></i> (555) 123-4567</li>
            <li><i class="fas fa-envelope me-2"></i> info@ironforge.com</li>
            <li><i class="fas fa-clock me-2"></i> Open 24/7</li>
          </ul>
        </div>
      </div>
    </div>
    <div class="copyright">
      <p>&copy; 2023 IRON FORGE FITNESS. ALL RIGHTS RESERVED.</p>
    </div>
  </div>
</footer>

<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Custom JS -->
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

  // Smooth scrolling for anchor links
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      e.preventDefault();
      document.querySelector(this.getAttribute('href')).scrollIntoView({
        behavior: 'smooth'
      });
    });
  });
</script>
</body>
</html>