<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Verify OTP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f6f7fb;
            min-height: 100vh;
            font-family: 'Segoe UI', Arial, sans-serif;
        }
        .otp-card {
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
        .btn-link {
            color: #222 !important;
            text-decoration: none !important;
            font-weight: 500;
            padding: 0;
        }
        .btn-link:hover {
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
            <div class="otp-card shadow">
                <h2 class="card-title text-center mb-4">Verify OTP</h2>

                <c:if test="${param.error != null}">
                    <div class="alert alert-danger">
                        Invalid or expired OTP!
                    </div>
                </c:if>

                <c:if test="${param.resend != null || param.otpSent != null}">
                    <div class="alert alert-success">
                        OTP sent to your email address!
                    </div>
                </c:if>

                <form action="/verify-otp" method="POST">
                    <input type="hidden" name="email" value="${param.email}">
                    <div class="mb-3">
                        <label class="form-label">Enter OTP</label>
                        <input type="text" name="otp" class="form-control" required autocomplete="off">
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Verify</button>
                </form>

                <div class="mt-3 text-center">
                    <form action="/resend-otp" method="POST" style="display:inline;">
                        <input type="hidden" name="email" value="${param.email}">
                        <button type="submit" class="btn btn-link">Resend OTP</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>