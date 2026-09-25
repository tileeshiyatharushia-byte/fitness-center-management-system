<%--
  Created by IntelliJ IDEA.
  User: ashen
  Date: 4/5/25
  Time: 9:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Iron Forge Fitness | Member Login</title>
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
      height: 100vh;
      display: flex;
      align-items: center;
    }

    .login-container {
      background-color: var(--secondary-black);
      border-radius: 10px;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
      padding: 40px;
      width: 100%;
      max-width: 500px;
      margin: auto;
      border-top: 4px solid var(--accent-orange);
    }

    .login-title {
      color: var(--white);
      text-align: center;
      margin-bottom: 30px;
      font-weight: 700;
    }

    .login-title span {
      color: var(--accent-orange);
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

    .btn-login {
      background-color: var(--accent-orange);
      color: var(--white);
      border: none;
      font-weight: 700;
      padding: 12px;
      border-radius: 5px;
      width: 100%;
      transition: all 0.3s;
    }

    .btn-login:hover {
      background-color: var(--accent-dark-orange);
      transform: translateY(-3px);
      box-shadow: 0 10px 20px rgba(255, 107, 53, 0.3);
    }

    .login-links {
      text-align: center;
      margin-top: 20px;
    }

    .login-links a {
      color: var(--accent-orange);
      text-decoration: none;
      transition: all 0.3s;
    }

    .login-links a:hover {
      color: var(--light-gray);
      text-decoration: underline;
    }

    .alert {
      border-radius: 5px;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="login-container">
    <h2 class="login-title">IRON<span>FORGE</span> MEMBER LOGIN</h2>

    <%-- Display error message if login failed --%>
    <% if (request.getParameter("error") != null) { %>
    <div class="alert alert-danger" role="alert">
      Invalid email or password. Please try again.
    </div>
    <% } %>

    <form action="MemberLoginServlet" method="POST">
      <div class="mb-3">
        <label for="email" class="form-label">Email Address</label>
        <input type="email" class="form-control" id="email" name="email" required>
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" id="password" name="password" required>
      </div>
      <button type="submit" class="btn btn-login">LOGIN</button>
    </form>

    <div class="login-links mt-3">
      <a href="addMember.jsp">Register as New Member</a>
    </div>
    <div class="login-links mt-3">
      <a href="index.jsp">Home</a>
    </div>
  </div>
</div>

<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>