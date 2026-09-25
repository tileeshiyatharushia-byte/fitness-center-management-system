<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iron Forge Fitness | Attendance Records</title>
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

        .card {
            background-color: var(--secondary-black);
            border-radius: 10px;
            padding: 30px;
            border-left: 4px solid var(--accent-orange);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .form-control {
            background-color: var(--dark-gray);
            border: 1px solid var(--medium-gray);
            color: var(--light-gray);
        }

        .form-control:focus {
            background-color: var(--dark-gray);
            color: var(--light-gray);
            border-color: var(--accent-orange);
            box-shadow: 0 0 0 0.25rem rgba(255, 107, 53, 0.25);
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

        .alert {
            border-radius: 8px;
        }

        .table {
            color: var(--light-gray);
            background-color: var(--secondary-black);
        }

        .table th {
            border-bottom: 2px solid var(--accent-orange);
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .table td, .table th {
            border-top: 1px solid var(--medium-gray);
            vertical-align: middle;
        }

        .table-hover tbody tr:hover {
            background-color: var(--dark-gray);
        }

        .badge.bg-orange {
            background-color: var(--accent-orange);
            color: var(--white);
        }

        .filter-card {
            background-color: var(--secondary-black);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 30px;
            border-left: 4px solid var(--accent-orange);
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
                    <a class="nav-link" href="addMember.jsp"><i class="fas fa-user-plus me-1"></i> Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="viewPlans.jsp"><i class="fas fa-list-alt me-1"></i> Plans</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="publicTrainers.jsp"><i class="fas fa-users me-1"></i> Our Trainers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="memberCheckIn.jsp"><i class="fas fa-sign-in-alt me-1"></i> Check-In</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="memberCheckOut.jsp"><i class="fas fa-sign-out-alt me-1"></i> Check-Out</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="attendanceRecords.jsp"><i class="fas fa-clipboard-list me-1"></i> Attendance</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container" style="margin-top: 100px; margin-bottom: 50px;">
    <div class="row">
        <div class="col-12">
            <h2 class="section-title">ATTENDANCE RECORDS</h2>

            <c:if test="${not empty message}">
                <div class="alert alert-${messageType} alert-dismissible fade show">
                        ${message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
                <c:remove var="message" scope="session"/>
                <c:remove var="messageType" scope="session"/>
            </c:if>

            <!-- Filter Section -->
            <div class="card mb-4">
                <div class="card-body">
                    <form action="attendanceRecords" method="get" class="row g-3">
                        <div class="col-md-4">
                            <label for="filterType" class="form-label">Filter By</label>
                            <select class="form-select" id="filterType" name="filterType">
                                <option value="">All Records</option>
                                <option value="member">Member ID</option>
                                <option value="date">Date (YYYY-MM-DD)</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="filterValue" class="form-label">Filter Value</label>
                            <input type="text" class="form-control" id="filterValue" name="filterValue"
                                   placeholder="Enter Member ID or Date">
                        </div>
                        <div class="col-md-2 d-flex align-items-end">
                            <button type="submit" class="btn btn-orange w-100">
                                <i class="fas fa-filter me-2"></i> Filter
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Attendance Records Table -->
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>Member ID</th>
                        <th>Check-In Time</th>
                        <th>Check-Out Time</th>
                        <th>Duration</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="att" items="${attendanceList}">
                        <tr>
                            <td>${att.memberId}</td>
                            <td>${att.formattedCheckInTime}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty att.checkOutTime}">
                                        ${att.formattedCheckOutTime}
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-warning">Active</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${att.duration}</td>
                            <td>
                                <form action="attendanceRecords" method="post" style="display: inline;">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="attendanceId" value="${att.attendanceId}">
                                    <button type="submit" class="btn btn-sm btn-outline-danger"
                                            onclick="return confirm('Are you sure you want to delete this record?')">
                                        <i class="fas fa-trash-alt"></i> Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty attendanceList}">
                        <tr>
                            <td colspan="5" class="text-center">No attendance records found</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="text-center py-4" style="background-color: var(--secondary-black);">
    <div class="container">
        <p>&copy; 2023 IRON FORGE FITNESS. ALL RIGHTS RESERVED.</p>
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