package com.example.demo.service;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmailService {

    private final JavaMailSender mailSender;

    /**
     * Sends an OTP email to the specified email address.
     *
     * @param email the recipient's email address
     * @param otp   the OTP to be sent
     */
    public void sendOtpEmail(String email, String otp) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject("Your Verification OTP");
        message.setText("OTP: " + otp + "\nValid for 5 minutes");
        mailSender.send(message);
    }

    /**
     * Sends a password reset email to the specified email address.
     *
     * @param email      the recipient's email address
     * @param resetLink  the link to reset the password
     */
    public void sendPasswordResetEmail(String email, String resetLink) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject("Password Reset Request");
        message.setText("Click here to reset your password: " + resetLink + "\nLink valid for 24 hours.");
        mailSender.send(message);
    }
}
