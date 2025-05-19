<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-4">
    <!-- Header Section -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Welcome, ${firstName}!</h2>
        <form action="/logout" method="POST">
            <button type="submit" class="btn btn-danger">Logout</button>
        </form>
    </div>

    <!-- Technical Blogs Section -->
    <h3 class="mb-4">Technical Blogs</h3>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <div class="col">
            <div class="card h-100">
                <img src="/images/spring-security.jpg" class="card-img-top" alt="Spring Security">
                <div class="card-body">
                    <h5 class="card-title">Spring Security Best Practices</h5>
                    <p class="card-text text-muted">
                        <small>Published: March 15, 2024</small>
                    </p>
                    <a href="https://codesecrets.hashnode.dev/securing-spring-boot-applications-best-practices-and-techniques" class="btn btn-primary" target="_blank">Read More</a>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card h-100">
                <img src="/images/postgresql.jpg" class="card-img-top" alt="PostgreSQL">
                <div class="card-body">
                    <h5 class="card-title">PostgreSQL Performance Tuning</h5>
                    <p class="card-text text-muted">
                        <small>Published: February 28, 2024</small>
                    </p>
                    <a href="https://lsena.hashnode.dev/tuning-your-postgresql-for-high-performance" class="btn btn-primary" target="_blank">Read More</a>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card h-100">
                <img src="/images/jsp.jpg" class="card-img-top" alt="JSP">
                <div class="card-body">
                    <h5 class="card-title">Modern JSP Development</h5>
                    <p class="card-text text-muted">
                        <small>Published: April 10, 2024</small>
                    </p>
                    <a href="https://yash211.hashnode.dev/spring-web-mvc" class="btn btn-primary" target="_blank">Read More</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>