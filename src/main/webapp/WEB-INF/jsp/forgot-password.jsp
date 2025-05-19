<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-body">
                    <h2 class="card-title text-center mb-4">Forgot Password</h2>

                    <c:if test="${param.error != null}">
                        <div class="alert alert-danger">
                                ${param.error}
                        </div>
                    </c:if>

                    <form action="/forgot-password" method="POST">
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" id="forgotEmail" required autocomplete="off">
                            <div class="invalid-feedback" id="forgotEmailError" style="display:none;">
                                Please enter a valid email address.
                            </div>
                        </div>
                        <script>
                            document.getElementById('forgotEmail').addEventListener('input', function() {
                                const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                                const error = document.getElementById('forgotEmailError');
                                if (!emailPattern.test(this.value)) {
                                    error.style.display = 'block';
                                    this.classList.add('is-invalid');
                                } else {
                                    error.style.display = 'none';
                                    this.classList.remove('is-invalid');
                                }
                            });

                            document.querySelector('form[action="/forgot-password"]').addEventListener('submit', function(e) {
                                const email = document.getElementById('forgotEmail');
                                if (email.classList.contains('is-invalid') || !email.value) {
                                    e.preventDefault();
                                    email.dispatchEvent(new Event('input'));
                                }
                            });
                        </script>
                        <button type="submit" class="btn btn-primary w-100">Send Reset Link</button>
                    </form>

                    <div class="mt-3 text-center">
                        <a href="/login" class="text-decoration-none">Back to Login</a>
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