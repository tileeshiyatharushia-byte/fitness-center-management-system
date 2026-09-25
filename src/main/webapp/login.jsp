<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Login | IRON FORGE FITNESS</title>
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
            background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)),
            url('https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');
            background-size: cover;
            background-position: center;
            color: var(--light-gray);
            min-height: 100vh;
            display: flex;
            align-items: center;
        }

        h1, h2, h3, h4, h5, h6 {
            font-family: 'Oswald', sans-serif;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .login-container {
            max-width: 500px;
            width: 100%;
            margin: 0 auto;
            padding: 40px;
            background-color: var(--secondary-black);
            border-radius: 10px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.5);
            border-left: 4px solid var(--accent-orange);
            transform-style: preserve-3d;
            transition: all 0.5s ease;
        }

        .login-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.6);
        }

        .login-header {
            text-align: center;
            margin-bottom: 30px;
            color: var(--white);
            position: relative;
            padding-bottom: 15px;
        }

        .login-header:after {
            content: '';
            position: absolute;
            width: 80px;
            height: 4px;
            background: var(--accent-orange);
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
        }

        .form-control {
            background-color: var(--dark-gray);
            border: 1px solid var(--medium-gray);
            color: var(--light-gray);
            padding: 12px 15px;
            height: 45px;
            margin-bottom: 20px;
            transition: all 0.3s;
        }

        .form-control:focus {
            background-color: var(--dark-gray);
            color: var(--white);
            border-color: var(--accent-orange);
            box-shadow: 0 0 0 0.25rem rgba(255, 107, 53, 0.25);
        }

        .input-group-text {
            background-color: var(--dark-gray);
            border: 1px solid var(--medium-gray);
            color: var(--accent-orange);
            min-width: 45px;
        }

        .btn-orange {
            background-color: var(--accent-orange);
            color: var(--white);
            border: none;
            font-weight: 700;
            padding: 12px;
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
        }

        .error-message {
            color: var(--accent-orange);
            background-color: rgba(255, 107, 53, 0.1);
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 25px;
            text-align: center;
            border-left: 4px solid var(--accent-orange);
        }

        .password-toggle {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: var(--light-gray);
            z-index: 5;
            background: var(--dark-gray);
            padding: 10px;
            border-radius: 0 5px 5px 0;
            transition: all 0.3s;
        }

        .password-toggle:hover {
            color: var(--accent-orange);
        }

        .password-container {
            position: relative;
        }

        .back-link {
            color: var(--light-gray);
            text-decoration: none;
            transition: all 0.3s;
            display: inline-block;
            margin-top: 20px;
        }

        .back-link:hover {
            color: var(--accent-orange);
            transform: translateX(-5px);
        }

        /* Responsive adjustments */
        @media (max-width: 576px) {
            .login-container {
                padding: 30px 20px;
                margin: 20px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="login-container">
        <div class="login-header">
            <h2><i class="fas fa-lock me-2"></i>ADMIN LOGIN</h2>
            <p class="mb-0">Access your IRON FORGE dashboard</p>
        </div>

        <% if (request.getAttribute("error") != null) { %>
        <div class="error-message">
            <i class="fas fa-exclamation-circle me-2"></i><%= request.getAttribute("error") %>
        </div>
        <% } %>

        <form action="LoginServlet" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">EMAIL ADDRESS</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                    <input type="email" class="form-control" id="email" name="email"
                           placeholder="Enter your email" required>
                </div>
            </div>

            <div class="mb-4">
                <label for="password" class="form-label">PASSWORD</label>
                <div class="password-container">
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                        <input type="password" class="form-control" id="password" name="password"
                               placeholder="Enter your password" required>
                    </div>
                    <span class="password-toggle" id="togglePassword">
                        <i class="fas fa-eye"></i>
                    </span>
                </div>
            </div>

            <button type="submit" class="btn btn-orange">
                <i class="fas fa-sign-in-alt me-2"></i>LOGIN
            </button>

            <div class="text-center mt-4">
                <a href="index.jsp" class="back-link">
                    <i class="fas fa-arrow-left me-1"></i>BACK TO HOME
                </a>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Password Toggle Script -->
<script>
    document.getElementById('togglePassword').addEventListener('click', function() {
        const passwordInput = document.getElementById('password');
        const icon = this.querySelector('i');

        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            icon.classList.replace('fa-eye', 'fa-eye-slash');
            this.style.color = 'var(--accent-orange)';
        } else {
            passwordInput.type = 'password';
            icon.classList.replace('fa-eye-slash', 'fa-eye');
            this.style.color = 'var(--light-gray)';
        }
    });
</script>
</body>
</html>