<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.model.Trainer" %>
<%@ page import="lk.sliit.fitnesscenter.fitnesscenterproject.dao.TrainerDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iron Forge Fitness | Our Trainers</title>
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

        .trainer-card {
            background-color: var(--secondary-black);
            border-radius: 10px;
            padding: 30px;
            margin-bottom: 30px;
            transition: all 0.3s;
            border-left: 4px solid transparent;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .trainer-card:hover {
            transform: translateY(-5px);
            border-left: 4px solid var(--accent-orange);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
        }

        .trainer-img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid var(--accent-orange);
            margin-bottom: 20px;
        }

        .trainer-name {
            color: var(--white);
            font-family: 'Oswald', sans-serif;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 5px;
        }

        .trainer-type {
            color: var(--accent-orange);
            font-weight: 600;
            margin-bottom: 15px;
            display: block;
        }

        .trainer-specialty {
            color: var(--light-gray);
            margin-bottom: 15px;
        }

        .specialty-badge {
            background-color: var(--accent-orange);
            color: var(--white);
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            display: inline-block;
            margin-right: 5px;
            margin-bottom: 5px;
        }

        .trainer-contact {
            margin-top: 20px;
            padding-top: 15px;
            border-top: 1px solid var(--medium-gray);
        }

        .trainer-contact p {
            margin-bottom: 5px;
        }

        .trainer-contact i {
            color: var(--accent-orange);
            width: 20px;
            text-align: center;
            margin-right: 10px;
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
    </style>
</head>
<body>


<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: rgba(18, 18, 18, 0.95); border-bottom: 2px solid var(--accent-orange);">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            IRON<span style="color:  var(--accent-orange);">FORGE</span>
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
<section class="py-5" style="margin-top: 80px;">
    <div class="container py-5">
        <h2 class="section-title">OUR ELITE TRAINERS</h2>
        <p class="text-center mb-5" style="max-width: 700px; margin: 0 auto; color: var(--light-gray);">
            Meet our team of certified fitness professionals dedicated to helping you achieve your goals.
        </p>

        <div class="row">
            <%
                TrainerDAO trainerDAO = new TrainerDAO();
                List<Trainer> trainers = trainerDAO.getAllTrainers();

                if (trainers.isEmpty()) {
            %>
            <div class="col-12 text-center">
                <div class="alert alert-dark" role="alert">
                    No trainers found. Please check back later.
                </div>
            </div>
            <%
            } else {
                for (Trainer trainer : trainers) {
                    String specialties = trainer.getSpecialty();
                    String[] specialtyList = specialties.split(",");
            %>
            <div class="col-lg-6">
                <div class="trainer-card">
                    <div class="row">
                        <div class="col-md-4 text-center">
                            <img src="https://ui-avatars.com/api/?name=<%= trainer.getName() %>&background=ff6b35&color=fff&size=150"
                                 alt="<%= trainer.getName() %>" class="trainer-img">
                        </div>
                        <div class="col-md-8">
                            <h3 class="trainer-name"><%= trainer.getName() %></h3>
                            <span class="trainer-type">
                                    <% if (trainer instanceof lk.sliit.fitnesscenter.fitnesscenterproject.model.FullTimeTrainer) { %>
                                        <i class="fas fa-user-tie me-2"></i>Full-Time Trainer
                                    <% } else { %>
                                        <i class="fas fa-user-clock me-2"></i>Part-Time Trainer
                                    <% } %>
                                </span>

                            <div class="trainer-specialty">
                                <p class="mb-2"><strong>Specializing in:</strong></p>
                                <div class="specialties">
                                    <% for (String specialty : specialtyList) { %>
                                    <span class="specialty-badge"><%= specialty.trim() %></span>
                                    <% } %>
                                </div>
                            </div>

                            <div class="trainer-contact">
                                <p><i class="fas fa-envelope"></i> <%= trainer.getEmail() %></p>
                                <p><i class="fas fa-phone"></i> <%= trainer.getContactNumber() %></p>
                            </div>
                        </div>
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
<footer style="background: linear-gradient(to top, #0a0a0a, #121212);">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 mb-4">
                <div class="footer-logo" style="font-size: 2rem; font-weight: 700; color: var(--white); margin-bottom: 20px;">
                    IRON<span style="color: var(--accent-orange);">FORGE</span>
                </div>
                <p style="color: var(--light-gray);">Premium fitness facility dedicated to helping you achieve your health and wellness goals through expert guidance and world-class facilities.</p>
                <div class="social-icons mt-3">
                    <a href="#" style="display: inline-block; width: 40px; height: 40px; background-color: var(--dark-gray); color: var(--light-gray); border-radius: 50%; text-align: center; line-height: 40px; margin-right: 10px; transition: all 0.3s;"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" style="display: inline-block; width: 40px; height: 40px; background-color: var(--dark-gray); color: var(--light-gray); border-radius: 50%; text-align: center; line-height: 40px; margin-right: 10px; transition: all 0.3s;"><i class="fab fa-instagram"></i></a>
                    <a href="#" style="display: inline-block; width: 40px; height: 40px; background-color: var(--dark-gray); color: var(--light-gray); border-radius: 50%; text-align: center; line-height: 40px; margin-right: 10px; transition: all 0.3s;"><i class="fab fa-twitter"></i></a>
                    <a href="#" style="display: inline-block; width: 40px; height: 40px; background-color: var(--dark-gray); color: var(--light-gray); border-radius: 50%; text-align: center; line-height: 40px; margin-right: 10px; transition: all 0.3s;"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
            <div class="col-lg-2 col-md-6 mb-4">
                <div class="footer-links">
                    <h5 style="color: var(--accent-orange); margin-bottom: 20px; position: relative; padding-bottom: 10px;">Links</h5>
                    <ul style="list-style: none; padding: 0;">
                        <li style="margin-bottom: 10px;"><a href="index.jsp" style="color: var(--light-gray); text-decoration: none; transition: all 0.3s;">Home</a></li>
                        <li style="margin-bottom: 10px;"><a href="addMember.jsp" style="color: var(--light-gray); text-decoration: none; transition: all 0.3s;">Register</a></li>
                        <li style="margin-bottom: 10px;"><a href="viewPlans.jsp" style="color: var(--light-gray); text-decoration: none; transition: all 0.3s;">Plans</a></li>
                        <li style="margin-bottom: 10px;"><a href="publicTrainers.jsp" style="color: var(--light-gray); text-decoration: none; transition: all 0.3s;">Trainers</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="footer-links">
                    <h5 style="color: var(--accent-orange); margin-bottom: 20px; position: relative; padding-bottom: 10px;">Facilities</h5>
                    <ul style="list-style: none; padding: 0;">
                        <li style="margin-bottom: 10px;"><a href="#" style="color: var(--light-gray); text-decoration: none; transition: all 0.3s;">Weight Training</a></li>
                        <li style="margin-bottom: 10px;"><a href="#" style="color: var(--light-gray); text-decoration: none; transition: all 0.3s;">Cardio Zone</a></li>
                        <li style="margin-bottom: 10px;"><a href="#" style="color: var(--light-gray); text-decoration: none; transition: all 0.3s;">Functional Area</a></li>
                        <li style="margin-bottom: 10px;"><a href="#" style="color: var(--light-gray); text-decoration: none; transition: all 0.3s;">Recovery Lounge</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="footer-links">
                    <h5 style="color: var(--accent-orange); margin-bottom: 20px; position: relative; padding-bottom: 10px;">Contact</h5>
                    <ul style="list-style: none; padding: 0;">
                        <li style="margin-bottom: 10px;"><i class="fas fa-map-marker-alt me-2" style="color: var(--accent-orange);"></i> 123 Fitness St, City</li>
                        <li style="margin-bottom: 10px;"><i class="fas fa-phone me-2" style="color: var(--accent-orange);"></i> (555) 123-4567</li>
                        <li style="margin-bottom: 10px;"><i class="fas fa-envelope me-2" style="color: var(--accent-orange);"></i> info@ironforge.com</li>
                        <li style="margin-bottom: 10px;"><i class="fas fa-clock me-2" style="color: var(--accent-orange);"></i> Open 24/7</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="copyright" style="border-top: 1px solid var(--medium-gray); padding-top: 20px; margin-top: 40px; text-align: center; color: var(--light-gray);">
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