<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f6f7fb;
            min-height: 100vh;
            font-family: 'Segoe UI', Arial, sans-serif;
        }
        .register-card {
            background: #fff;
            border-radius: 14px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.07);
            padding: 2.5rem 2rem;
            margin-top: 4rem;
        }
        .card-title {
            font-weight: 600;
            color: #222;
            letter-spacing: 0.5px;
        }
        .form-control:focus {
            border-color: #bbb;
            box-shadow: 0 0 0 0.1rem rgba(0,0,0,.04);
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
        .form-check-label {
            font-size: 0.97rem;
        }
        .text-link, .text-decoration-none {
            color: #222 !important;
            text-decoration: none !important;
            transition: color 0.2s;
        }
        .text-link:hover, .text-decoration-none:hover {
            color: #555 !important;
            text-decoration: underline !important;
        }
        .alert {
            font-size: 0.97rem;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center align-items-center" style="min-height: 100vh;">
        <div class="col-md-6 col-lg-5">
            <div class="register-card shadow">
                <h2 class="card-title text-center mb-4">Register</h2>

                <c:if test="${param.error != null}">
                    <div class="alert alert-danger">
                        Registration failed! Email may already exist.
                    </div>
                </c:if>

                <form action="/register" method="POST" id="registerForm" novalidate>
                    <div class="mb-3">
                        <label class="form-label">First Name</label>
                        <input type="text" name="firstName" class="form-control" id="firstName" required pattern="[A-Za-z]+" autocomplete="off">
                        <div class="invalid-feedback" id="nameError" style="display:none;">Only letters allowed. No special characters or numbers.</div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" id="email" required autocomplete="off">
                        <div class="invalid-feedback" id="emailError" style="display:none;">Please enter a valid email address.</div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" id="password" required minlength="8"
                               pattern="^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$" autocomplete="off">
                        <div class="invalid-feedback" id="passwordError" style="display:none;">
                            Password must be at least 8 characters, include a capital letter, a number, and a special character.
                        </div>
                        <div class="form-check mt-2">
                            <input class="form-check-input" type="checkbox" id="showPassword">
                            <label class="form-check-label" for="showPassword">
                                Show Password
                            </label>
                        </div>
                    </div>
                    <script>
                        document.getElementById('showPassword').addEventListener('change', function() {
                            const pwd = document.getElementById('password');
                            pwd.type = this.checked ? 'text' : 'password';
                        });
                    </script>
                    <button type="submit" class="btn btn-primary w-100">Register</button>
                </form>
                <script>
                    document.getElementById('firstName').addEventListener('input', function() {
                        const namePattern = /^[A-Za-z]+$/;
                        const nameError = document.getElementById('nameError');
                        if (!namePattern.test(this.value)) {
                            nameError.style.display = 'block';
                            this.classList.add('is-invalid');
                        } else {
                            nameError.style.display = 'none';
                            this.classList.remove('is-invalid');
                        }
                    });

                    document.getElementById('email').addEventListener('input', function() {
                        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                        const emailError = document.getElementById('emailError');
                        if (!emailPattern.test(this.value)) {
                            emailError.style.display = 'block';
                            this.classList.add('is-invalid');
                        } else {
                            emailError.style.display = 'none';
                            this.classList.remove('is-invalid');
                        }
                    });

                    document.getElementById('password').addEventListener('input', function() {
                        const passwordPattern = /^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$/;
                        const passwordError = document.getElementById('passwordError');
                        if (!passwordPattern.test(this.value)) {
                            passwordError.style.display = 'block';
                            this.classList.add('is-invalid');
                        } else {
                            passwordError.style.display = 'none';
                            this.classList.remove('is-invalid');
                        }
                    });

                    document.getElementById('registerForm').addEventListener('submit', function(e) {
                        const name = document.getElementById('firstName');
                        const email = document.getElementById('email');
                        const password = document.getElementById('password');
                        if (
                            name.classList.contains('is-invalid') ||
                            email.classList.contains('is-invalid') ||
                            password.classList.contains('is-invalid') ||
                            !name.value || !email.value || !password.value
                        ) {
                            e.preventDefault();
                            name.dispatchEvent(new Event('input'));
                            email.dispatchEvent(new Event('input'));
                            password.dispatchEvent(new Event('input'));
                        }
                    });
                </script>
                <div class="mt-3 text-center">
                    Already have an account? <a href="/login" class="text-link">Login</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>