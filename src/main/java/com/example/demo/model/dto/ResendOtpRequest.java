package com.example.demo.model.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class ResendOtpRequest {
    @NotBlank
    @Email
    private String email;
}
