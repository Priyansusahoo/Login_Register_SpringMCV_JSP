package com.example.demo.model.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

import lombok.Data;

@Data
public class OtpVerificationRequest {
    @NotBlank @Email
    private String email;

    @NotBlank
    @Size(min = 6, max = 6)
    private String otp;
}
