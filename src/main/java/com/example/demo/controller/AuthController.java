package com.example.demo.controller;

import jakarta.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.UUID;

import lombok.RequiredArgsConstructor;

import com.example.demo.model.dto.*;
import com.example.demo.service.AuthService;
import com.example.demo.service.UserService;

@Controller
@RequiredArgsConstructor
public class AuthController {
    private final AuthService authService;
    private final UserService userService;

    @GetMapping("/register")
    public String showRegistrationForm() {
        return "register"; // Returns register.jsp
    }

    @PostMapping("/register")
    public String register(@Valid RegistrationRequest request) {
        userService.registerUser(request);
        return "redirect:/verify-otp?email=" + request.getEmail();
    }

    @PostMapping("/verify-otp")
    public String verifyOtp(@Valid OtpVerificationRequest request) {
        if (userService.verifyOtp(request)) {
            return "redirect:/login";
        }
        return "redirect:/verify-otp?error";
    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "login"; // Returns login.jsp
    }



    @PostMapping("/resend-otp")
    public String resendOtp(@Valid ResendOtpRequest request) {
        try {
            userService.resendOtp(request.getEmail());
            return "redirect:/verify-otp?email=" + request.getEmail() + "&resend=true";
        } catch (RuntimeException ex) {
            return "redirect:/resend-otp?error=" + ex.getMessage();
        }
    }

    @GetMapping("/forgot-password")
    public String showForgotPasswordForm() {
        return "forgot-password";
    }

    @PostMapping("/forgot-password")
    public String handleForgotPassword(@Valid ForgotPasswordRequest request) {
        try {
            userService.initiatePasswordReset(request);
            return "redirect:/login?resetInitiated=true";
        } catch (RuntimeException e) {
            return "redirect:/forgot-password?error=" + e.getMessage();
        }
    }

    @GetMapping("/reset-password")
    public String showResetForm(@RequestParam UUID tokenId, @RequestParam String token, Model model) {
        model.addAttribute("tokenId", tokenId.toString());
        model.addAttribute("token", token);
        return "reset-password";
    }

    @PostMapping("/reset-password")
    public String handlePasswordReset(@Valid ResetPasswordRequest request) {
        try {
            userService.resetPassword(request);
            return "redirect:/login?resetSuccess=true";
        } catch (RuntimeException e) {
            return "redirect:/reset-password?tokenId=" + request.getToken() +
                    "&token=" + request.getToken() + "&error=" + e.getMessage();
        }
    }
}
