<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.*, java.util.List, java.time.format.DateTimeFormatter" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.dao.FitnessClassDAO" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.dao.TrainerDAO" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.model.FitnessClass" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.model.Trainer" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.model.GroupClass" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.model.PersonalTraining" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Class Schedule | Iron Forge Fitness</title>
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

    .schedule-section {
      padding: 80px 0;
      background-color: var(--dark-gray);
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

    .section-subtitle {
      max-width: 700px;
      margin: 0 auto 50px;
      text-align: center;
      color: var(--light-gray);
    }

    .search-box {
      background-color: var(--secondary-black);
      padding: 20px;
      border-radius: 10px;
      margin-bottom: 30px;
    }

    .form-control {
      background-color: var(--primary-black);
      border: 1px solid var(--medium-gray);
      color: var(--light-gray);
      padding: 12px 15px;
    }

    .form-control:focus {
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

    .schedule-card {
      background-color: var(--secondary-black);
      border-radius: 10px;
      padding: 25px;
      margin-bottom: 30px;
      transition: all 0.3s;
      border-left: 4px solid var(--accent-orange);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }

    .schedule-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
    }

    .class-name {
      color: var(--accent-orange);
      font-family: 'Oswald', sans-serif;
      margin-bottom: 15px;
    }

    .class-time {
      color: var(--light-gray);
      margin-bottom: 10px;
    }

    .class-time i {
      color: var(--accent-orange);
      width: 20px;
      text-align: center;
      margin-right: 10px;
    }

    .class-details {
      margin-bottom: 15px;
    }

    .class-details i {
      color: var(--accent-orange);
      width: 20px;
      text-align: center;
      margin-right: 10px;
    }

    .badge-orange {
      background-color: var(--accent-orange);
      color: var(--white);
      padding: 5px 10px;
      border-radius: 20px;
      font-size: 0.8rem;
      display: inline-block;
      margin-right: 5px;
      margin-bottom: 5px;
    }

    .badge-secondary {
      background-color: var(--medium-gray);
      color: var(--light-gray);
      padding: 5px 10px;
      border-radius: 20px;
      font-size: 0.8rem;
      display: inline-block;
      margin-right: 5px;
      margin-bottom: 5px;
    }

    footer {
      background: linear-gradient(to top, #0a0a0a, #121212);
      padding: 60px 0 20px;
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

    /* Responsive adjustments */
    @media (max-width: 768px) {
      .section-title {
        font-size: 1.8rem;
      }

      .schedule-card {
        padding: 20px;
      }
    }
  </style>
</head>
<body><!-- Navigation Bar -->
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
          <a class="nav-link active" href="index.jsp"><i class="fas fa-home me-1"></i> Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="addMember.jsp"><i class="fas fa-user-plus me-1"></i> Register</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="MembershipPlanServletPublic?action=sortByRenewalDate"><i class="fas fa-list-alt me-1"></i> Plans</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="publicTrainers.jsp"><i class="fas fa-users me-1"></i> Our Trainers</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="publicClassSchedule.jsp"><i class="fas fa-user-tie me-1"></i> Class Schedule</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="loginMember.jsp"><i class="fas fa-list-alt me-1"></i> Login Member</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Main Content -->
<section class="schedule-section">
  <div class="container">
    <br>
    <h2 class="section-title text-center">CLASS SCHEDULE</h2>
    <p class="section-subtitle text-center">
      Browse our fitness classes and find the perfect session for your training needs.
    </p>


    <div class="row">
      <%
        FitnessClassDAO classDAO = new FitnessClassDAO();
        TrainerDAO trainerDAO = new TrainerDAO();
        List<FitnessClass> classes;

        String searchQuery = request.getParameter("search");
        if (searchQuery != null && !searchQuery.isEmpty()) {
          classes = classDAO.searchClasses(searchQuery);
        } else {
          classes = classDAO.getAllClasses();
        }

        if (classes.isEmpty()) {
      %>
      <div class="col-12 text-center py-5">
        <h4 class="text-muted">No classes found</h4>
      </div>
      <%
      } else {
        for (FitnessClass fc : classes) {
          Trainer trainer = null;
          List<Trainer> trainers = trainerDAO.getAllTrainers();
          for (Trainer t : trainers) {
            if (t.getTrainerId().equals(fc.getTrainerId())) {
              trainer = t;
              break;
            }
          }
      %>
      <div class="col-lg-6">
        <div class="schedule-card">
          <h4 class="class-name"><%= fc.getClassName() %></h4>

          <p class="class-time">
            <i class="far fa-calendar-alt"></i>
            <%= fc.getFormattedDateTime() %> - <%= fc.getEndTime() %>
            (<%= fc.getDuration() %> mins)
          </p>

          <% if (trainer != null) { %>
          <p class="class-details">
            <i class="fas fa-user-tie"></i>
            Trainer: <%= trainer.getName() %>
          </p>
          <% } %>

          <p class="class-details">
            <i class="fas fa-info-circle"></i>
            <%= fc.getDescription() %>
          </p>

          <div class="class-tags">
            <% if (fc instanceof GroupClass) { %>
            <span class="badge-orange">Group Class</span>
<%--            <span class="badge-secondary"><%= ((GroupClass) fc).getGroupType() %></span>--%>
            <% } else if (fc instanceof PersonalTraining) { %>
            <span class="badge-orange">Personal Training</span>
<%--            <span class="badge-secondary"><%= ((PersonalTraining) fc).getFocusArea() %></span>--%>
            <% } %>
          </div>
        </div>
      </div>
      <%
          }
        }
      %>
    </div>
  </div>
</section>

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
            <li><a href="publicTrainers.jsp">Trainers</a></li>
            <li><a href="publicClassSchedule.jsp">Classes</a></li>
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
</script>
</body>
</html>