<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.dao.MemberManager" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.model.Member" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Submit Review | IRON FORGE FITNESS</title>
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

    /* Review Specific Styles */
    .review-container {
      max-width: 800px;
      margin: 100px auto 50px;
      padding: 30px;
      background-color: var(--secondary-black);
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
      border-left: 4px solid var(--accent-orange);
    }

    .form-label {
      color: var(--light-gray);
      font-weight: 500;
    }

    .form-control, .form-select {
      background-color: var(--dark-gray);
      border: 1px solid var(--medium-gray);
      color: var(--light-gray);
    }

    .form-control:focus, .form-select:focus {
      background-color: var(--dark-gray);
      border-color: var(--accent-orange);
      box-shadow: 0 0 0 0.25rem rgba(255, 107, 53, 0.25);
      color: var(--light-gray);
    }

    @media (max-width: 768px) {
      .review-container {
        margin: 80px auto 30px;
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
<%--        <li class="nav-item">--%>
<%--          <a class="nav-link" href="viewReviews.jsp"><i class="fas fa-star me-1"></i> View Reviews</a>--%>
<%--        </li>--%>
        <li class="nav-item">
          <a class="nav-link active" href="submitReview.jsp"><i class="fas fa-edit me-1"></i> Submit Review</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="loginMember.jsp"><i class="fas fa-sign-in-alt me-1"></i> Member Login</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Main Content -->
<div class="container">
  <div class="review-container">
    <h2 class="text-center mb-4"><i class="fas fa-star me-2"></i>SUBMIT YOUR REVIEW</h2>

    <form action="ReviewServlet" method="post">
      <input type="hidden" name="action" value="add">

        <%
            MemberManager memberManager = new MemberManager();
            List<Member> members = memberManager.getAllMembers();
        %>
        <div class="mb-3">
            <label for="memberId" class="form-label">Select Member</label>
            <select class="form-select" id="memberId" name="memberId" required>
                <option value="">-- Select Member --</option>
                <% for (Member m : members) { %>
                <option value="<%= m.getMemberId() %>">
                    <%= m.getMemberId() %> - <%= m.getName() %>
                </option>
                <% } %>
            </select>
        </div>

        <div class="mb-3">
        <label for="rating" class="form-label">Rating</label>
        <select class="form-select" id="rating" name="rating" required>
          <option value="1">1 - Poor</option>
          <option value="2">2 - Fair</option>
          <option value="3" selected>3 - Good</option>
          <option value="4">4 - Very Good</option>
          <option value="5">5 - Excellent</option>
        </select>
      </div>

      <div class="mb-4">
        <label for="comment" class="form-label">Comment</label>
        <textarea class="form-control" id="comment" name="comment" rows="4" required></textarea>
      </div>

      <div class="d-grid gap-2">
        <button type="submit" class="btn btn-orange">
          <i class="fas fa-paper-plane me-2"></i> SUBMIT REVIEW
        </button>

      </div>
        <div class="d-flex justify-content-between mt-5">
            <a href="memberDashboard.jsp" class="btn btn-orange btn-lg px-4">
                <i class="fas fa-times me-1"></i> Back
            </a>
        </div>
    </form>
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
<%--            <li><a href="viewReviews.jsp">Reviews</a></li>--%>
            <li><a href="publicTrainers.jsp">Trainers</a></li>
            <li><a href="publicClassSchedule.jsp">Schedule</a></li>
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
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="footer-links">
          <h5>Quick Access</h5>
          <ul>
            <li><a href="loginMember.jsp">Member Login</a></li>
            <li><a href="loginTrainer.jsp">Trainer Login</a></li>
            <li><a href="adminReviews.jsp">Admin Panel</a></li>
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
