<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iron Forge Fitness | Premium Gym Experience</title>
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
            overflow-x: hidden;
        }

        h1, h2, h3, h4, h5, h6 {
            font-family: 'Oswald', sans-serif;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Existing CSS (unchanged) */
        .feature-icon {
            transition: transform 0.3s ease;
        }
        .feature-card:hover .feature-icon {
            transform: rotate(-15deg) scale(1.1);
        }

        footer {
            background: linear-gradient(to top, #0a0a0a, #121212);
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

        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)),
            url('https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            height: 100vh;
            min-height: 700px;
            display: flex;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        .hero-content {
            position: relative;
            z-index: 2;
        }

        .hero-title {
            font-size: 4.5rem;
            font-weight: 900;
            margin-bottom: 1.5rem;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
            line-height: 1.1;
        }

        .hero-title span {
            color: var(--accent-orange);
        }

        .hero-subtitle {
            font-size: 1.5rem;
            margin-bottom: 2.5rem;
            max-width: 700px;
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

        .section-title {
            position: relative;
            display: inline-block;
            margin-bottom: 3rem;
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

        .feature-card {
            background-color: var(--secondary-black);
            border-radius: 10px;
            padding: 30px;
            height: 100%;
            transition: all 0.4s;
            border-left: 4px solid transparent;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .feature-card:hover {
            transform: translateY(-10px);
            border-left: 4px solid var(--accent-orange);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
        }

        .feature-icon {
            font-size: 3rem;
            color: var(--accent-orange);
            margin-bottom: 20px;
        }

        .feature-title {
            color: var(--white);
            margin-bottom: 15px;
        }

        .stats-section {
            background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)),
            url('https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?ixlib=rb-4.0.3&auto=format&fit=crop&w=1470&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            padding: 100px 0;
            position: relative;
        }

        .stat-item {
            text-align: center;
            padding: 30px;
        }

        .stat-number {
            font-size: 3.5rem;
            font-weight: 700;
            color: var(--accent-orange);
            margin-bottom: 10px;
        }

        .stat-label {
            font-size: 1.2rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .testimonials-section {
            background-color: var(--secondary-black);
            padding: 100px 0;
        }

        .testimonial-card {
            background-color: var(--dark-gray);
            border-radius: 10px;
            padding: 30px;
            margin: 15px;
            position: relative;
            border-left: 4px solid var(--accent-orange);
        }

        .testimonial-text {
            font-style: italic;
            margin-bottom: 20px;
        }

        .testimonial-author {
            font-weight: 700;
            color: var(--accent-orange);
        }

        .testimonial-rating {
            color: var(--accent-orange);
            margin-bottom: 10px;
        }

        .cta-section {
            background: linear-gradient(135deg, var(--primary-black) 0%, var(--dark-gray) 100%);
            padding: 80px 0;
            border-top: 2px solid var(--accent-orange);
            border-bottom: 2px solid var(--accent-orange);
        }

        .cta-title {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        .cta-subtitle {
            font-size: 1.2rem;
            margin-bottom: 30px;
            opacity: 0.9;
        }

        footer {
            background-color: var(--primary-black);
            padding: 60px 0 20px;
            position: relative;
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

        /* Animation */
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .pulse-animation {
            animation: pulse 2s infinite;
        }

        /* Responsive adjustments */
        @media (max-width: 992px) {
            .hero-title {
                font-size: 3.5rem;
            }
        }

        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.8rem;
            }
            .hero-subtitle {
                font-size: 1.2rem;
            }
        }

        /* Add to existing :root or CSS */
        .badge.bg-orange {
            background-color: var(--accent-orange);
            color: var(--white);
            margin-right: 5px;
            font-weight: 500;
        }

        .trainer-card {
            background-color: var(--secondary-black);
            border-radius: 10px;
            padding: 25px;
            transition: all 0.3s;
            height: 100%;
            border-left: 4px solid transparent;
        }

        .trainer-card:hover {
            transform: translateY(-5px);
            border-left: 4px solid var(--accent-orange);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .trainer-img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid var(--accent-orange);
            margin: 0 auto 20px;
            display: block;
        }

        /* Chatbot CSS */
        .chatbot-container {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 1000;
        }

        .chatbot-button {
            background-color: var(--accent-orange);
            color: var(--white);
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            cursor: pointer;
            transition: all 0.3s;
        }

        .chatbot-button:hover {
            background-color: var(--accent-dark-orange);
            transform: scale(1.1);
        }

        .chatbot-window {
            display: none;
            background-color: var(--secondary-black);
            border: 2px solid var(--accent-orange);
            border-radius: 10px;
            width: 350px;
            height: 500px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5);
            overflow: hidden;
        }

        .chatbot-header {
            background-color: var(--accent-orange);
            color: var(--white);
            padding: 10px;
            font-weight: 700;
            text-transform: uppercase;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .chatbot-close {
            cursor: pointer;
            font-size: 1.2rem;
        }

        .chatbot-body {
            height: 400px;
            overflow-y: auto;
            padding: 15px;
            background-color: var(--dark-gray);
        }

        .chatbot-message {
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 8px;
            max-width: 80%;
            word-wrap: break-word;
        }

        .user-message {
            background-color: var(--accent-orange);
            color: var(--white);
            margin-left: auto;
        }

        .bot-message {
            background-color: var(--medium-gray);
            color: var(--white);
        }

        .chatbot-input-container {
            display: flex;
            border-top: 1px solid var(--medium-gray);
            padding: 10px;
            background-color: var(--secondary-black);
        }

        .chatbot-input {
            flex: 1;
            background-color: var(--dark-gray);
            border: 1px solid var(--medium-gray);
            border-radius: 20px;
            padding: 8px 15px;
            color: var(--white);
            outline: none;
        }

        .chatbot-input:focus {
            border-color: var(--accent-orange);
        }

        .chatbot-send {
            background-color: var(--accent-orange);
            color: var(--white);
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-left: 10px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .chatbot-send:hover {
            background-color: var(--accent-dark-orange);
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

<!-- Hero Section -->
<section class="hero-section">
    <div class="container">
        <div class="hero-content">
            <h1 class="hero-title">FORGE YOUR <span>BEST SELF</span></h1>
            <p class="hero-subtitle">Join the most elite fitness community in the city with state-of-the-art facilities, expert trainers, and a results-driven approach to health and wellness.</p>
            <div class="d-flex flex-wrap gap-3">
                <a href="addMember.jsp" class="btn btn-orange pulse-animation"><i class="fas fa-user-plus me-2"></i> JOIN NOW</a>
                <a href="MembershipPlanServletPublic?action=sortByRenewalDate" class="btn btn-outline-orange"><i class="fas fa-info-circle me-2"></i> OUR PLANS</a>
                <a href="publicClassSchedule.jsp" class="btn btn-outline-orange"><i class="fas fa-calendar-alt me-2"></i> CLASS SCHEDULE</a>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="py-5" style="background-color: var(--dark-gray);">
    <div class="container py-5">
        <h2 class="section-title text-white">WHY CHOOSE IRON FORGE</h2>
        <div class="row g-4">
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-dumbbell"></i>
                    </div>
                    <h3 class="feature-title">PREMIUM EQUIPMENT</h3>
                    <p>Cutting-edge fitness equipment from top brands like TechnoGym, Life Fitness, and Hammer Strength for unparalleled training experience.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-user-tie"></i>
                    </div>
                    <h3 class="feature-title">ELITE TRAINERS</h3>
                    <p>Our certified trainers have trained athletes and celebrities, bringing you world-class expertise to achieve your fitness goals.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-calendar-alt"></i>
                    </div>
                    <h3 class="feature-title">FLEXIBLE MEMBERSHIP</h3>
                    <p>Customizable plans with 24/7 access, no long-term contracts, and premium amenities to fit your lifestyle.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-heartbeat"></i>
                    </div>
                    <h3 class="feature-title">RECOVERY ZONE</h3>
                    <p>Specialized recovery area with cryotherapy, massage chairs, and hydrotherapy to enhance your performance.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3 class="feature-title">COMMUNITY</h3>
                    <p>Join a supportive network of like-minded individuals who motivate and inspire each other to reach new heights.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-trophy"></i>
                    </div>
                    <h3 class="feature-title">RESULTS</h3>
                    <p>Proven training methodologies that deliver visible results in strength, endurance, and physique transformation.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Trainers Section -->
<section class="py-5" style="background-color: var(--secondary-black);">
    <div class="container py-5">
        <h2 class="section-title text-white">MEET OUR ELITE TRAINERS</h2>
        <div class="row g-4">
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-dumbbell"></i>
                    </div>
                    <h3 class="feature-title">JASON STONE</h3>
                    <p>Strength & Conditioning Specialist with 10+ years experience training professional athletes.</p>
                    <div class="mt-3">
                        <span class="badge bg-orange">Weightlifting</span>
                        <span class="badge bg-orange">Powerlifting</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-running"></i>
                    </div>
                    <h3 class="feature-title">SARAH FITZ</h3>
                    <p>HIIT and Functional Training expert, helping clients achieve peak cardiovascular performance.</p>
                    <div class="mt-3">
                        <span class="badge bg-orange">HIIT</span>
                        <span class="badge bg-orange">Cardio</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-spa"></i>
                    </div>
                    <h3 class="feature-title">MIA CHEN</h3>
                    <p>Yoga and Mobility coach focused on improving flexibility and injury prevention.</p>
                    <div class="mt-3">
                        <span class="badge bg-orange">Yoga</span>
                        <span class="badge bg-orange">Mobility</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center mt-4">
            <a href="publicTrainers.jsp" class="btn btn-outline-orange">View All Trainers</a>
        </div>
    </div>
</section>

<!-- Stats Section -->
<section class="stats-section">
    <div class="container">
        <div class="row text-center">
            <div class="col-md-3 col-6">
                <div class="stat-item">
                    <div class="stat-number">15+</div>
                    <div class="stat-label">Certified Trainers</div>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stat-item">
                    <div class="stat-number">10K+</div>
                    <div class="stat-label">Sq Ft Space</div>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stat-item">
                    <div class="stat-number">5K+</div>
                    <div class="stat-label">Members</div>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stat-item">
                    <div class="stat-number">24/7</div>
                    <div class="stat-label">Access</div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Testimonials Section -->
<section class="testimonials-section">
    <div class="container">
        <h2 class="section-title text-white">WHAT OUR MEMBERS SAY</h2>
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="testimonial-card">
                    <div class="testimonial-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <p class="testimonial-text">"Iron Forge transformed my life. The trainers are incredibly knowledgeable and the community keeps me motivated. Best decision I ever made!"</p>
                    <div class="testimonial-author">- Michael R.</div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="testimonial-card">
                    <div class="testimonial-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <p class="testimonial-text">"The facilities are top-notch and always clean. I love the variety of classes and the 24/7 access fits perfectly with my schedule."</p>
                    <div class="testimonial-author">- Sarah L.</div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="testimonial-card">
                    <div class="testimonial-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <p class="testimonial-text">"After trying several gyms, Iron Forge stands out for its professional staff and results-driven approach. I've never been in better shape!"</p>
                    <div class="testimonial-author">- David K.</div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Call to Action Section -->
<section class="cta-section">
    <div class="container text-center">
        <h2 class="cta-title">READY TO TRANSFORM YOUR BODY AND MIND?</h2>
        <p class="cta-subtitle">Take the first step towards a stronger, healthier you. Our team is ready to guide you on your fitness journey.</p>
        <div class="d-flex justify-content-center flex-wrap gap-3">
            <a href="addMember.jsp" class="btn btn-orange btn-lg"><i class="fas fa-user-plus me-2"></i> JOIN NOW</a>
            <a href="MembershipPlanServletPublic?action=sortByRenewalDate" class="btn btn-outline-orange btn-lg"><i class="fas fa-list-alt me-2"></i> VIEW PLANS</a>
            <a href="publicTrainers.jsp" class="btn btn-outline-orange btn-lg"><i class="fas fa-user-tie me-2"></i> MEET TRAINERS</a>
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
                        <li><a href="MembershipPlanServletPublic?action=sortByRenewalDate">Plans</a></li>
                        <li><a href="publicTrainers.jsp">Trainers</a></li>
                        <li><a href="login.jsp">Admin</a></li>
                        <li><a href="loginTrainer.jsp">Trainer Login</a></li>
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
            <p>© 2023 IRON FORGE FITNESS. ALL RIGHTS RESERVED.</p>
        </div>
    </div>
</footer>

<!-- Chatbot Container -->
<div class="chatbot-container">
    <div class="chatbot-button" onclick="toggleChatbot()">
        <i class="fas fa-comment-dots fa-2x"></i>
    </div>
    <div class="chatbot-window" id="chatbotWindow">
        <div class="chatbot-header">
            Iron Forge Chatbot
            <span class="chatbot-close" onclick="toggleChatbot()">&times;</span>
        </div>
        <div class="chatbot-body" id="chatbotBody">
            <div class="chatbot-message bot-message">
                Welcome to Iron Forge Fitness! Ask me about trainers, class schedules, membership plans, gym elements, or branches.
            </div>
        </div>
        <div class="chatbot-input-container">
            <input type="text" class="chatbot-input" id="chatbotInput" placeholder="Type your question..." onkeypress="if(event.key === 'Enter') sendMessage()">
            <button class="chatbot-send" onclick="sendMessage()">
                <i class="fas fa-paper-plane"></i>
            </button>
        </div>
    </div>
</div>

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

    // Chatbot functions
    function toggleChatbot() {
        const chatbotWindow = document.getElementById('chatbotWindow');
        chatbotWindow.style.display = chatbotWindow.style.display === 'block' ? 'none' : 'block';
    }

    function sendMessage() {
        const input = document.getElementById('chatbotInput');
        const chatbotBody = document.getElementById('chatbotBody');
        const query = input.value.trim();

        if (query === '') return;

        // Add user message
        const userMessage = document.createElement('div');
        userMessage.className = 'chatbot-message user-message';
        userMessage.textContent = query;
        chatbotBody.appendChild(userMessage);

        // Clear input
        input.value = '';

        // Send query to servlet
        fetch('ChatBotServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'query=' + encodeURIComponent(query)
        })
            .then(response => response.text())
            .then(data => {
                // Add bot response
                const botMessage = document.createElement('div');
                botMessage.className = 'chatbot-message bot-message';
                botMessage.innerHTML = data.replace(/\n/g, '<br>');
                chatbotBody.appendChild(botMessage);

                // Scroll to bottom
                chatbotBody.scrollTop = chatbotBody.scrollHeight;
            })
            .catch(error => {
                console.error('Error:', error);
                const botMessage = document.createElement('div');
                botMessage.className = 'chatbot-message bot-message';
                botMessage.textContent = 'Sorry, something went wrong. Please try again.';
                chatbotBody.appendChild(botMessage);
                chatbotBody.scrollTop = chatbotBody.scrollHeight;
            });
    }
</script>
</body>
</html>