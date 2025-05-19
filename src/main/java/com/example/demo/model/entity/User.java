package com.example.demo.model.entity;

import java.time.LocalDateTime;
import java.util.UUID;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.Data;

@Data
@Entity
@Table(name = "users",
       indexes = {
              @Index(name = "idx_email", columnList = "email"),
              @Index(name = "idx_reset_token", columnList = "reset_token_id")
       })
public class User {
    @Id
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(name = "UUID", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(columnDefinition = "UUID DEFAULT gen_random_uuid()", updatable = false)
    private UUID id;

    @NotBlank
    @Email
    @Column(nullable = false, unique = true)
    private String email;

    @NotBlank
    @Column(nullable = false)
    private String password;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "email_verified", nullable = false)
    private Boolean emailVerified = false;

    // OTP Verification Fields
    @Column(name = "hashed_verification_otp", length = 60)
    private String hashedVerificationOtp;

    @Column(name = "otp_expiry_time")
    private LocalDateTime otpExpiryTime;

    // Account Locking Fields
    @Column(name = "failed_attempts")
    private Integer failedAttempts = 0;

    @Column(name = "account_non_locked")
    private Boolean accountNonLocked = true;

    @Column(name = "lock_time")
    private LocalDateTime lockTime;

    // Password Reset Fields
    @Column(name = "reset_token_id", columnDefinition = "UUID")
    private UUID resetTokenId;

    @Column(name = "hashed_reset_token", length = 60)
    private String hashedResetToken;

    @Column(name = "reset_token_expiry")
    private LocalDateTime resetTokenExpiry;

    // Audit Fields
    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
}
