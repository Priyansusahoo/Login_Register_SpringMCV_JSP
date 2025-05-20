<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f6f7fb;
            min-height: 100vh;
            font-family: 'Segoe UI', Arial, sans-serif;
        }
        .home-card {
            background: #fff;
            border-radius: 14px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.07);
            padding: 2.5rem 2rem;
            margin-top: 3rem;
        }
        .card-title, .section-title {
            font-weight: 600;
            color: #222;
            letter-spacing: 0.5px;
        }
        .btn-primary {
            background: #222;
            border: none;
            font-weight: 500;
            transition: background 0.2s;
        }
        .btn-primary:hover {
            background: #444;
        }
        .btn-danger {
            font-weight: 500;
        }
        .card-img-top {
            border-radius: 10px 10px 0 0;
            object-fit: cover;
            height: 160px;
        }
        .blog-card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.05);
            transition: box-shadow 0.2s;
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        .blog-card:hover {
            box-shadow: 0 6px 24px rgba(0,0,0,0.10);
        }
        .card-body {
            display: flex;
            flex-direction: column;
            flex: 1 1 auto;
        }
        .card-title {
            min-height: 3.5rem;
        }
        .text-muted {
            font-size: 0.97rem;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-11">
            <div class="home-card shadow">
                <!-- Header Section -->
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="card-title mb-0">Welcome, ${firstName}!</h2>
                    <form action="/logout" method="POST" class="mb-0">
                        <button type="submit" class="btn btn-danger">Logout</button>
                    </form>
                </div>

                <!-- Technical Blogs Section -->
                <h3 class="section-title mb-4">Technical Blogs</h3>
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <div class="col">
                        <div class="card blog-card h-100">
                            <img src="/images/dockerinternal.jpg" class="card-img-top" alt="Docker Internals">
                            <div class="card-body">
                                <h5 class="card-title">Docker Internals: Isolation, Resource Control, and Kernel Mechanics</h5>
                                <p class="card-text text-muted">
                                    <small>Published: January 28, 2025</small>
                                </p>
                                <a href="https://priyansu1.hashnode.dev/docker-internals-isolation-resource-control-and-kernel-mechanics" class="btn btn-primary w-100 mt-auto" target="_blank">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card blog-card h-100">
                            <img src="/images/fedoralinuxsetup.jpg" class="card-img-top" alt="Fedora Linux Setup">
                            <div class="card-body">
                                <h5 class="card-title">Fedora Linux SetUp</h5>
                                <p class="card-text text-muted">
                                    <small>Published: March 16, 2023</small>
                                </p>
                                <a href="https://priyansu1.hashnode.dev/fedora-linux-setup" class="btn btn-primary w-100 mt-auto" target="_blank">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card blog-card h-100">
                            <img src="/images/ollamawebui.jpg" class="card-img-top" alt="Streamlined Ollama WebUI Setup">
                            <div class="card-body">
                                <h5 class="card-title">Streamlined Ollama WebUI Setup: Automated Scripts, LLM Integration, and Desktop Shortcut Creation</h5>
                                <p class="card-text text-muted">
                                    <small>Published: January 26, 2025</small>
                                </p>
                                <a href="https://priyansu1.hashnode.dev/streamlined-ollama-webui-setup-automated-scripts-llm-integration-and-desktop-shortcut-creation" class="btn btn-primary w-100 mt-auto" target="_blank">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card blog-card h-100">
                            <img src="/images/javareflection.jpg" class="card-img-top" alt="Java Reflection">
                            <div class="card-body">
                                <h5 class="card-title">Discovering Java Reflection: A Practical Guide</h5>
                                <p class="card-text text-muted">
                                    <small>Published: January 24, 2025</small>
                                </p>
                                <a href="https://priyansu1.hashnode.dev/discovering-java-reflection-a-practical-guide" class="btn btn-primary w-100 mt-auto" target="_blank">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card blog-card h-100">
                            <img src="/images/awslambda.jpg" class="card-img-top" alt="AWS Lambda">
                            <div class="card-body">
                                <h5 class="card-title">AWS Lambda: Getting started with Serverless Computing</h5>
                                <p class="card-text text-muted">
                                    <small>Published: March 29, 2023</small>
                                </p>
                                <a href="https://priyansu1.hashnode.dev/aws-lambda-getting-started-with-serverless-computing" class="btn btn-primary w-100 mt-auto" target="_blank">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card blog-card h-100">
                            <img src="/images/spring-security.jpg" class="card-img-top" alt="Spring Security">
                            <div class="card-body">
                                <h5 class="card-title">Spring Security Best Practices</h5>
                                <p class="card-text text-muted">
                                    <small>Published: March 15, 2024</small>
                                </p>
                                <a href="https://codesecrets.hashnode.dev/securing-spring-boot-applications-best-practices-and-techniques" class="btn btn-primary w-100 mt-auto" target="_blank">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card blog-card h-100">
                            <img src="/images/postgresql.jpg" class="card-img-top" alt="PostgreSQL">
                            <div class="card-body">
                                <h5 class="card-title">PostgreSQL Performance Tuning</h5>
                                <p class="card-text text-muted">
                                    <small>Published: February 28, 2024</small>
                                </p>
                                <a href="https://lsena.hashnode.dev/tuning-your-postgresql-for-high-performance" class="btn btn-primary w-100 mt-auto" target="_blank">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card blog-card h-100">
                            <img src="/images/jsp.jpg" class="card-img-top" alt="JSP">
                            <div class="card-body">
                                <h5 class="card-title">Modern JSP Development</h5>
                                <p class="card-text text-muted">
                                    <small>Published: April 10, 2024</small>
                                </p>
                                <a href="https://yash211.hashnode.dev/spring-web-mvc" class="btn btn-primary w-100 mt-auto" target="_blank">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>