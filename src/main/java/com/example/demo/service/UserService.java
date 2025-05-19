package com.example.demo.service;

import com.example.demo.model.dto.ForgotPasswordRequest;
import com.example.demo.model.dto.OtpVerificationRequest;
import com.example.demo.model.dto.RegistrationRequest;
import com.example.demo.model.dto.ResetPasswordRequest;

public interface UserService {
    void registerUser(RegistrationRequest request);

    boolean verifyOtp(OtpVerificationRequest request);

    void resetFailedAttempts(String email);

    void incrementFailedAttempts(String email);

    void resendOtp(String email);

    void initiatePasswordReset(ForgotPasswordRequest request);

    void resetPassword(ResetPasswordRequest request);
}
