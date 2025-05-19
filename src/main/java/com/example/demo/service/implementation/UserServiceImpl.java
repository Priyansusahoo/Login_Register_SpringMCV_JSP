package com.example.demo.service.implementation;

import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.util.Base64;
import java.util.UUID;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

import com.example.demo.model.dto.ForgotPasswordRequest;
import com.example.demo.model.dto.OtpVerificationRequest;
import com.example.demo.model.dto.RegistrationRequest;
import com.example.demo.model.dto.ResetPasswordRequest;
import com.example.demo.model.entity.User;
import com.example.demo.repository.UserRepository;
import com.example.demo.service.EmailService;
import com.example.demo.service.UserService;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;
    private final EmailService emailService;

    /**
     * Registers a new user and sends an OTP to their email for verification.
     *
     * @param request the registration request containing user details
     */
    @Override
    public void registerUser(RegistrationRequest request) {
        User user = new User();
        user.setEmail(request.getEmail());
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setFirstName(request.getFirstName());
        user.setEmailVerified(false);

        String otp = generateOTP();
        user.setHashedVerificationOtp(passwordEncoder.encode(otp));
        user.setOtpExpiryTime(LocalDateTime.now().plusMinutes(5));

        userRepository.save(user);
        emailService.sendOtpEmail(user.getEmail(), otp);
    }

    /**
     * Verifies the OTP provided by the user.
     *
     * @param request the OTP verification request containing email and OTP
     * @return true if the OTP is valid, false otherwise
     */
    @Override
    public boolean verifyOtp(OtpVerificationRequest request) {
        User user = userRepository.findByEmail(request.getEmail())
                .orElseThrow(() -> new RuntimeException("User not found"));

        if (LocalDateTime.now().isAfter(user.getOtpExpiryTime())) {
            throw new RuntimeException("OTP expired");
        }

        return passwordEncoder.matches(request.getOtp(), user.getHashedVerificationOtp());
    }

    /**
     * Generates a random 6-digit OTP.
     *
     * @return a 6-digit OTP as a string
     */
    public String generateOTP() {
        SecureRandom random = new SecureRandom();
        int num = random.nextInt(999999);
        return String.format("%06d", num); // 6-digit format (e.g., 042779)
    }

    /**
     * Resets the user's "FailedAttempts" to zero after successful login, user identified by the provided email.
     *
     * @param email    the user's email address
     */
    @Override
    public void resetFailedAttempts(String email) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found"));
        user.setFailedAttempts(0);
        user.setAccountNonLocked(true);
        user.setLockTime(null);
        userRepository.save(user);
    }

    /**
     * Increments the user's "FailedAttempts" by 1 after a failed login attempt.
     * If the number of attempts reaches 5, the account is locked.
     *
     * @param email    the user's email address
     */
    @Override
    public void incrementFailedAttempts(String email) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found"));

        int attempts = user.getFailedAttempts() + 1;
        user.setFailedAttempts(attempts);

        if (attempts >= 5) {
            user.setAccountNonLocked(false);
            user.setLockTime(LocalDateTime.now());
        }

        userRepository.save(user);
    }

    /**
     * Resends the OTP to the user's email if the email is not already verified.
     *
     * @param email    the user's email address
     */
    @Override
    public void resendOtp(String email) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found"));

        if (user.getEmailVerified()) {
            throw new IllegalStateException("Email already verified");
        }

        String newOtp = generateOTP();
        user.setHashedVerificationOtp(passwordEncoder.encode(newOtp));
        user.setOtpExpiryTime(LocalDateTime.now().plusMinutes(5));

        userRepository.save(user);

        emailService.sendOtpEmail(user.getEmail(), newOtp);
    }

    /**
     * Initiates the password reset process by generating a secure token and sending a reset link to the user's email.
     *
     * @param request the password reset request containing the user's email
     */
    @Override
    public void initiatePasswordReset(ForgotPasswordRequest request) {
        User user = userRepository.findByEmail(request.getEmail())
                .orElseThrow(() -> new RuntimeException("User not found"));

        String rawToken = generateSecureToken();
        UUID tokenId = UUID.randomUUID();

        user.setResetTokenId(tokenId);
        user.setHashedResetToken(passwordEncoder.encode(rawToken));
        user.setResetTokenExpiry(LocalDateTime.now().plusHours(24));

        userRepository.save(user);

        String resetLink = "http://localhost:8080/reset-password?tokenId=" + tokenId
                + "&token=" + rawToken;

        emailService.sendPasswordResetEmail(user.getEmail(), resetLink);
    }

    /**
     * Generates a secure random token for password reset.
     *
     * @return a secure random token as a string
     */
    private String generateSecureToken() {
        SecureRandom secureRandom = new SecureRandom();
        byte[] randomBytes = new byte[32]; // 256-bit token
        secureRandom.nextBytes(randomBytes);

        return Base64.getUrlEncoder().withoutPadding().encodeToString(randomBytes);
    }

    /**
     * Resets the user's password using the provided token and new password.
     *
     * @param request the reset password request containing the token and new password
     */
    @Override
    public void resetPassword(ResetPasswordRequest request) {
        if (!request.getNewPassword().equals(request.getConfirmPassword())) {
            throw new IllegalArgumentException("Passwords do not match");
        }

        User user = userRepository.findByResetTokenId(UUID.fromString(request.getToken()))
                .orElseThrow(() -> new RuntimeException("Invalid reset token"));

        if (LocalDateTime.now().isAfter(user.getResetTokenExpiry())) {
            throw new RuntimeException("Reset token has expired");
        }

        if (!passwordEncoder.matches(request.getToken(), user.getHashedResetToken())) {
            throw new RuntimeException("Invalid reset token");
        }

        user.setPassword(passwordEncoder.encode(request.getNewPassword()));
        user.setResetTokenId(null);
        user.setHashedResetToken(null);
        user.setResetTokenExpiry(null);

        userRepository.save(user);
    }
}
