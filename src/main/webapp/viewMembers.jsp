<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Member Management | IRON FORGE FITNESS</title>
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

    .badge-premium {
      background-color: var(--accent-orange);
      color: var(--white);
      font-weight: 700;
      padding: 6px 12px;
      border-radius: 20px;
      text-transform: uppercase;
      font-size: 0.7rem;
    }

    .badge-regular {
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
          <a class="nav-link active" href="viewMembers.jsp"><i class="fas fa-users me-1"></i> Members</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="viewPlans.jsp"><i class="fas fa-list-alt me-1"></i> Plans</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminDashboard.jsp"><i class="fas fa-sign-out-alt me-1"></i> Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Main Content -->
<div class="container my-5" style="padding-top: 80px;">
  <div class="card">
    <div class="card-header">
      <div class="d-flex justify-content-between align-items-center">
        <h3 class="mb-0"><i class="fas fa-users me-2"></i>MEMBER MANAGEMENT</h3>
        <div>
          <a href="MemberServlet?action=sortByRenewalDate" class="btn btn-outline-gray me-2">
            <i class="fas fa-sort me-1"></i> SORT BY RENEWAL
          </a>
          <a href="addMember.jsp" class="btn btn-orange">
            <i class="fas fa-user-plus me-1"></i> ADD MEMBER
          </a>
        </div>
      </div>
    </div>

    <div class="table-container">
      <div class="table-responsive">
        <table class="table table-hover mb-0">
          <thead>
          <tr>
            <th>MEMBER ID</th>
            <th>NAME</th>
            <th>EMAIL</th>
            <th>MEMBERSHIP</th>
            <th>CONTACT</th>
            <th>RENEWAL DATE</th>
            <th>ACTIONS</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="member" items="${members}">
            <tr>
              <td>${member.memberId}</td>
              <td>${member.name}</td>
              <td>${member.email}</td>
              <td>
                                <span class="${member.membershipType eq 'Premium' ? 'badge-premium' : 'badge-regular'}">
                                    ${member.membershipType}
                                </span>
              </td>
              <td>${member.contactNumber}</td>
              <td>${member.lastRenewalDate}</td>
              <td class="action-buttons">
                  <%--                                <a href="editMember.jsp?memberID=${member.memberId}" class="btn btn-outline-gray me-1">--%>
                  <%--                                    <i class="fas fa-edit"></i> EDIT--%>
                  <%--                                </a>--%>
                <a href="MemberServlet?action=delete&memberID=${member.memberId}"
                   class="btn btn-outline-gray"
                   onclick="return confirm('Are you sure you want to delete this member?')">
                  <i class="fas fa-trash-alt"></i> DELETE
                </a>
              </td>
            </tr>
          </c:forEach>
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