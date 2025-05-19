<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-body">
                    <h2 class="card-title text-center mb-4">Login</h2>

                    <c:if test="${param.error != null}">
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
                            <input type="email" name="username" class="form-control" required>
                        </div>
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
                        <button type="submit" class="btn btn-primary w-100">Login</button>
                    </form>

                    <div class="mt-3 text-center">
                        <a href="/forgot-password" class="text-decoration-none">Forgot Password?</a>
                    </div>
                    <div class="mt-2 text-center">
                        Don't have an account? <a href="/register" class="text-decoration-none">Register</a>
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