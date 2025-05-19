<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Verify OTP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-body">
                    <h2 class="card-title text-center mb-4">Verify OTP</h2>

                    <c:if test="${param.error != null}">
                        <div class="alert alert-danger">
                            Invalid or expired OTP!
                        </div>
                    </c:if>

                    <c:if test="${param.resent != null}">
                        <div class="alert alert-success">
                            New OTP sent successfully!
                        </div>
                    </c:if>

                    <form action="/verify-otp" method="POST">
                        <input type="hidden" name="email" value="${param.email}">
                        <div class="mb-3">
                            <label class="form-label">Enter OTP</label>
                            <input type="text" name="otp" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Verify</button>
                    </form>

                    <div class="mt-3 text-center">
                        <form action="/resend-otp" method="POST">
                            <input type="hidden" name="email" value="${param.email}">
                            <button type="submit" class="btn btn-link">Resend OTP</button>
                        </form>
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