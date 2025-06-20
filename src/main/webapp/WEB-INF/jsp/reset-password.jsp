<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f6f7fb;
            min-height: 100vh;
            font-family: 'Segoe UI', Arial, sans-serif;
        }
        .reset-card {
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
            <div class="reset-card shadow">
                <h2 class="card-title text-center mb-4">Reset Password</h2>

                <c:if test="${param.error != null}">
                    <div class="alert alert-danger">
                            ${param.error}
                    </div>
                </c:if>

                <form action="/reset-password" method="POST">
                    <input type="hidden" name="tokenId" value="${param.tokenId}">
                    <input type="hidden" name="token" value="${param.token}">

                    <div class="mb-3">
                        <label class="form-label">New Password</label>
                        <input type="password" name="newPassword" class="form-control" id="newPassword" required
                               minlength="8"
                               pattern="^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$"
                               autocomplete="off">
                        <div class="invalid-feedback" id="newPasswordError" style="display:none;">
                            Password must be at least 8 characters, include a capital letter, a number, and a special character.
                        </div>
                        <div class="form-check mt-2">
                            <input class="form-check-input" type="checkbox" id="showNewPassword">
                            <label class="form-check-label" for="showNewPassword">
                                Show Password
                            </label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Confirm Password</label>
                        <input type="password" name="confirmPassword" class="form-control" id="confirmPassword" required autocomplete="off">
                        <div class="invalid-feedback" id="confirmPasswordError" style="display:none;">
                            Passwords do not match.
                        </div>
                        <div class="form-check mt-2">
                            <input class="form-check-input" type="checkbox" id="showConfirmPassword">
                            <label class="form-check-label" for="showConfirmPassword">
                                Show Password
                            </label>
                        </div>
                    </div>
                    <script>
                        // Show/hide password
                        document.getElementById('showNewPassword').addEventListener('change', function() {
                            const pwd = document.getElementById('newPassword');
                            pwd.type = this.checked ? 'text' : 'password';
                        });
                        document.getElementById('showConfirmPassword').addEventListener('change', function() {
                            const pwd = document.getElementById('confirmPassword');
                            pwd.type = this.checked ? 'text' : 'password';
                        });

                        // Password validation
                        document.getElementById('newPassword').addEventListener('input', function() {
                            const pattern = /^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$/;
                            const error = document.getElementById('newPasswordError');
                            if (!pattern.test(this.value)) {
                                error.style.display = 'block';
                                this.classList.add('is-invalid');
                            } else {
                                error.style.display = 'none';
                                this.classList.remove('is-invalid');
                            }
                        });

                        // Confirm password validation
                        document.getElementById('confirmPassword').addEventListener('input', function() {
                            const newPassword = document.getElementById('newPassword').value;
                            const error = document.getElementById('confirmPasswordError');
                            if (this.value !== newPassword) {
                                error.style.display = 'block';
                                this.classList.add('is-invalid');
                            } else {
                                error.style.display = 'none';
                                this.classList.remove('is-invalid');
                            }
                        });

                        // Prevent form submission if invalid
                        document.querySelector('form[action="/reset-password"]').addEventListener('submit', function(e) {
                            const newPassword = document.getElementById('newPassword');
                            const confirmPassword = document.getElementById('confirmPassword');
                            if (
                                newPassword.classList.contains('is-invalid') ||
                                confirmPassword.classList.contains('is-invalid') ||
                                !newPassword.value || !confirmPassword.value
                            ) {
                                e.preventDefault();
                                newPassword.dispatchEvent(new Event('input'));
                                confirmPassword.dispatchEvent(new Event('input'));
                            }
                        });
                    </script>
                    <button type="submit" class="btn btn-primary w-100">Reset Password</button>
                </form>
                <div class="mt-3 text-center">
                    <a href="/login" class="text-link">Back to Login</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>