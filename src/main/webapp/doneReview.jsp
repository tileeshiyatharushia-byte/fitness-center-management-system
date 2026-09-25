<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Success | IRON FORGE FITNESS</title>
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
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      margin: 0;
      padding: 20px;
    }

    .success-container {
      background-color: var(--secondary-black);
      border-radius: 10px;
      padding: 40px;
      text-align: center;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
      border-left: 4px solid var(--accent-orange);
      max-width: 600px;
      width: 100%;
    }

    h1, h2, h3 {
      font-family: 'Oswald', sans-serif;
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    .success-icon {
      color: var(--accent-orange);
      font-size: 4rem;
      margin-bottom: 20px;
      animation: bounce 1s infinite alternate;
    }

    @keyframes bounce {
      from { transform: translateY(0); }
      to { transform: translateY(-15px); }
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
      margin-top: 30px;
      text-decoration: none;
      display: inline-block;
    }

    .btn-orange:hover {
      background-color: var(--accent-dark-orange);
      transform: translateY(-3px);
      box-shadow: 0 10px 20px rgba(255, 107, 53, 0.3);
      color: var(--white);
    }

    .message-box {
      background-color: var(--dark-gray);
      padding: 20px;
      border-radius: 5px;
      margin: 20px 0;
      border-left: 3px solid var(--accent-orange);
    }
  </style>
</head>
<body>
<div class="success-container">
  <div class="success-icon">
    <i class="fas fa-check-circle"></i>
  </div>
  <h2>SUCCESS!</h2>

  <div class="message-box">
    <p class="lead">Review Done!</p>
  </div>

  <a href="index.jsp" class="btn btn-orange">
    <i class="fas fa-home me-2"></i> BACK TO HOME
  </a>
</div>

<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
