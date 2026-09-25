<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Iron Forge Fitness | Trainer Login</title>
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

    .login-container {
      background-color: var(--secondary-black);
      border-radius: 10px;
      padding: 40px;
      margin-top: 100px;
      border-left: 4px solid var(--accent-orange);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
      max-width: 500px;
      margin-left: auto;
      margin-right: auto;
    }

    .login-title {
      color: var(--accent-orange);
      margin-bottom: 30px;
      text-transform: uppercase;
      letter-spacing: 1px;
      text-align: center;
    }

    .form-label {
      font-weight: 600;
      margin-bottom: 5px;
    }

    .form-control {
      background-color: var(--dark-gray);
      border: 1px solid var(--medium-gray);
      color: var(--light-gray);
      padding: 12px 15px;
      margin-bottom: 20px;
    }

    .form-control:focus {
      background-color: var(--dark-gray);
      color: var(--light-gray);
      border-color: var(--accent-orange);
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
      width: 100%;
    }

    .btn-orange:hover {
      background-color: var(--accent-dark-orange);
      transform: translateY(-3px);
      box-shadow: 0 10px 20px rgba(255, 107, 53, 0.3);
      color: var(--white);
    }

    .error-message {
      color: #dc3545;
      margin-bottom: 20px;
      text-align: center;
    }

    .login-footer {
      text-align: center;
      margin-top: 20px;
    }

    .login-footer a {
      color: var(--accent-orange);
      text-decoration: none;
      transition: all 0.3s;
    }

    .login-footer a:hover {
      color: var(--accent-dark-orange);
      text-decoration: underline;
    }
  </style>
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: rgba(18, 18, 18, 0.95); border-bottom: 2px solid var(--accent-orange);">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">
      IRON<span style="color: var(--accent-orange);">FORGE</span>
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
          <a class="nav-link active" href="loginTrainer.jsp"><i class="fas fa-sign-in-alt me-1"></i> Trainer Login</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">
  <div class="row justify-content-center">
    <div class="col-lg-6">
      <div class="login-container">
        <h2 class="login-title">Trainer Login</h2>

        <%-- Display error message if any --%>
        <% if (request.getAttribute("error") != null) { %>
        <div class="error-message">
          <i class="fas fa-exclamation-circle me-2"></i>
          <%= request.getAttribute("error") %>
        </div>
        <% } %>

        <form action="TrainerLoginServlet" method="POST">
          <div class="mb-3">
            <label for="trainerId" class="form-label">Trainer ID</label>
            <input type="text" class="form-control" id="trainerId" name="trainerId" required>
          </div>

          <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
          </div>

          <button type="submit" class="btn btn-orange">Login</button>

          <div class="login-footer mt-3">
            <p>Don't have an account? <a href="addTrainer.jsp">Register as Trainer</a></p>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>