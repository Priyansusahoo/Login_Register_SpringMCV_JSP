<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f6f7fb;
            min-height: 100vh;
            font-family: 'Segoe UI', Arial, sans-serif;
        }
        .login-card {
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
            <div class="login-card shadow">
                <h2 class="card-title text-center mb-4">Login</h2>

                <c:if test="${param.noAccount != null}">
                    <div class="alert alert-warning">
                        No account associated with this email. <a href="/register" class="text-link">Register here</a>.
                    </div>
                </c:if>

                <c:if test="${param.error != null && param.noAccount == null}">
                    <div class="alert alert-danger">
                        Invalid credentials or account locked!
                    </div>
                </c:if>

                <c:if test="${param.otpVerified != null}">
                    <div class="alert alert-success">
                        OTP verified successfully! You can now log in.
                    </div>
                </c:if>

                <c:if test="${param.resetSuccess != null}">
                    <div class="alert alert-success">
                        Password reset successful! You can now log in.
                    </div>
                </c:if>

                <c:if test="${param.resetInitiated != null}">
                    <div class="alert alert-success">
                        Password reset link sent to your email address!
                    </div>
                </c:if>

                <form action="/login" method="POST">
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="username" class="form-control" required autocomplete="off">
                    </div>
                    <script>
                        document.addEventListener('DOMContentLoaded', function() {
                            const emailInput = document.querySelector('input[name="username"]');
                            const form = emailInput.closest('form');
                            let error = document.createElement('div');
                            error.className = 'invalid-feedback';
                            error.style.display = 'none';
                            error.textContent = 'Please enter a valid email address.';
                            emailInput.parentNode.appendChild(error);

                            emailInput.addEventListener('input', function() {
                                const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                                if (!emailPattern.test(this.value)) {
                                    error.style.display = 'block';
                                    this.classList.add('is-invalid');
                                } else {
                                    error.style.display = 'none';
                                    this.classList.remove('is-invalid');
                                }
                            });

                            form.addEventListener('submit', function(e) {
                                if (emailInput.classList.contains('is-invalid') || !emailInput.value) {
                                    e.preventDefault();
                                    emailInput.dispatchEvent(new Event('input'));
                                }
                            });
                        });
                    </script>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" id="loginPassword" required>
                        <div class="form-check mt-2">
                            <input class="form-check-input" type="checkbox" id="showLoginPassword">
                            <label class="form-check-label" for="showLoginPassword">
                                Show Password
                            </label>
                        </div>
                    </div>
                    <script>
                        document.getElementById('showLoginPassword').addEventListener('change', function() {
                            const pwd = document.getElementById('loginPassword');
                            pwd.type = this.checked ? 'text' : 'password';
                        });
                    </script>
                    <button type="submit" class="btn btn-primary w-100 mb-2">Login</button>
                </form>

                <div class="mt-2 text-center">
                    <a href="/forgot-password" class="text-link">Forgot Password?</a>
                </div>
                <div class="mt-2 text-center">
                    Don't have an account? <a href="/register" class="text-link">Register</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>