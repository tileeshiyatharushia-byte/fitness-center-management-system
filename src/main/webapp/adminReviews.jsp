<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.model.Review" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.dao.ReviewDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Review Moderation | IRON FORGE FITNESS</title>
  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700;900&family=Oswald:wght@500;700&display=swap" rel="stylesheet">
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

    footer {
      background: linear-gradient(to top, #0a0a0a, #121212);
      padding: 60px 0 20px;
      border-top: 1px solid var(--medium-gray);
    }

    .footer-logo {
      font-size: 2rem;
      font-weight: 700;
      color: var(--white);
      margin-bottom: 20px;
    }

    .footer-logo span {
      color: var(--accent-orange);
    }

    .footer-links h5 {
      color: var(--accent-orange);
      margin-bottom: 20px;
      position: relative;
      padding-bottom: 10px;
    }

    .footer-links h5:after {
      content: '';
      position: absolute;
      width: 50px;
      height: 2px;
      background: var(--accent-orange);
      bottom: 0;
      left: 0;
    }

    .footer-links ul {
      list-style: none;
      padding: 0;
    }

    .footer-links li {
      margin-bottom: 10px;
    }

    .footer-links a {
      color: var(--light-gray);
      text-decoration: none;
      transition: all 0.3s;
    }

    .footer-links a:hover {
      color: var(--accent-orange);
      padding-left: 5px;
    }

    .social-icons a {
      display: inline-block;
      width: 40px;
      height: 40px;
      background-color: var(--dark-gray);
      color: var(--light-gray);
      border-radius: 50%;
      text-align: center;
      line-height: 40px;
      margin-right: 10px;
      transition: all 0.3s;
    }

    .social-icons a:hover {
      background-color: var(--accent-orange);
      color: var(--white);
      transform: translateY(-5px);
    }

    .copyright {
      border-top: 1px solid var(--medium-gray);
      padding-top: 20px;
      margin-top: 40px;
      text-align: center;
    }

    /* Admin Review Specific Styles */
    .admin-reviews-container {
      margin: 100px auto 50px;
      padding: 30px;
      background-color: var(--secondary-black);
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }

    .admin-table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0;
      border-radius: 10px;
      overflow: hidden;
    }

    .admin-table th {
      background-color: var(--accent-orange);
      color: var(--white);
      padding: 15px;
      text-align: left;
    }

    .admin-table td {
      padding: 12px 15px;
      border-bottom: 1px solid var(--medium-gray);
      background-color: var(--dark-gray);
      color: var(--light-gray);
    }

    .admin-table tr:last-child td {
      border-bottom: none;
    }

    .flagged-row {
      background-color: rgba(255, 107, 53, 0.2) !important;
      border-left: 4px solid var(--accent-orange);
    }

    .rating-stars {
      color: var(--accent-orange);
    }

    .action-btn {
      padding: 5px 10px;
      margin: 0 3px;
      font-size: 0.9rem;
    }

    .moderation-header {
      border-bottom: 2px solid var(--accent-orange);
      padding-bottom: 10px;
      margin-bottom: 20px;
    }

    @media (max-width: 768px) {
      .admin-reviews-container {
        margin: 80px auto 30px;
        padding: 20px;
      }

      .admin-table {
        display: block;
        overflow-x: auto;
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
          <a class="nav-link active" href="adminReviews.jsp"><i class="fas fa-star me-1"></i> Review Moderation</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="LoginServlet"><i class="fas fa-sign-out-alt me-1"></i> Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Main Content -->
<div class="container">
  <div class="admin-reviews-container">
    <div class="moderation-header">
      <h2 class="mb-0"><i class="fas fa-shield-alt me-2"></i>REVIEW MODERATION PANEL</h2>
      <p class="mb-0 text-muted">Manage and moderate member reviews</p>
    </div>

    <%
      String success = request.getParameter("success");
      if (success != null && "deleted".equals(success)) {
    %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
      <i class="fas fa-check-circle me-2"></i> Review deleted successfully!
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
      }
    %>

    <div class="table-responsive">
      <table class="admin-table">
        <thead>
        <tr>
          <th>ID</th>
          <%--          <th>Member</th>--%>
          <%--          <th>Trainer</th>--%>
          <th>Class</th>
          <th>Rating</th>
          <th>Comment</th>
          <th>Date</th>
          <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
          ReviewDAO reviewDAO = new ReviewDAO();
          List<Review> reviews = reviewDAO.getAllReviews();
          if (reviews != null && !reviews.isEmpty()) {
            for (Review review : reviews) {
              boolean isFlagged = review.getComment() != null &&
                      (review.getComment().toLowerCase().contains("bad") ||
                              review.getRating() < 2);
        %>
        <tr class="<%= isFlagged ? "flagged-row" : "" %>">
          <td><%= review.getReviewId() %></td>
          <td>#<%= review.getMemberId() %></td>
          <%--          <td><%= review.getTrainerId() != null ? "#" + review.getTrainerId() : "N/A" %></td>--%>
          <%--          <td><%= review.getClassId() != null ? "#" + review.getClassId() : "N/A" %></td>--%>
          <td>
            <div class="rating-stars">
              <% for (int i = 1; i <= 5; i++) { %>
              <i class="fas fa-star<%= i > review.getRating() ? "-half-alt" : "" %>"></i>
              <% } %>
            </div>
          </td>
          <td><%= review.getComment() %></td>
          <td><%= review.getReviewDate() %></td>
          <td>
            <form action="ReviewServlet" method="post" style="display: inline;">
              <input type="hidden" name="action" value="delete">
              <input type="hidden" name="reviewId" value="<%= review.getReviewId() %>">
              <button type="submit" class="btn btn-sm btn-outline-danger action-btn" onclick="return confirm('Are you sure you want to delete this review?')">
                <i class="fas fa-trash-alt"></i> Delete
              </button>
            </form>
          </td>
        </tr>
        <%
          }
        } else {
        %>
        <tr>
          <td colspan="8" class="text-center py-4">No reviews found.</td>
        </tr>
        <%
          }
        %>
        </tbody>
      </table>
    </div>

    <div class="mt-4">
      <div class="alert alert-warning">
        <i class="fas fa-exclamation-triangle me-2"></i> Flagged reviews are highlighted in orange.
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
            <li><a href="adminDashboard.jsp">Dashboard</a></li>
            <li><a href="adminReviews.jsp">Review Moderation</a></li>
          </ul>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="footer-links">
          <h5>Contact</h5>
          <ul>
            <li><i class="fas fa-map-marker-alt me-2"></i> 123 Fitness St, City</li>
            <li><i class="fas fa-phone me-2"></i> (555) 123-4567</li>
            <li><i class="fas fa-envelope me-2"></i> admin@ironforge.com</li>
            <li><i class="fas fa-clock me-2"></i> Open 24/7</li>
          </ul>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="footer-links">
          <h5>Admin Tools</h5>
          <ul>
            <li><a href="adminDashboard.jsp">Dashboard</a></li>
            <li><a href="viewMembers.jsp">Member Management</a></li>
            <li><a href="viewPlans.jsp">Plan Management</a></li>
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
</script>
</body>
</html>
