package com.example.demo.security;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import lombok.RequiredArgsConstructor;

import com.example.demo.service.UserService;

@Component
@RequiredArgsConstructor
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

    private final UserService userService;

    /**
     * Handles authentication failure by incrementing the failed attempts for the user.
     *
     * @param request  the HttpServletRequest
     * @param response the HttpServletResponse
     * @param exception the AuthenticationException
     * @throws IOException      if an I/O error occurs
     * @throws ServletException if a servlet error occurs
     */
    @Override
    public void onAuthenticationFailure(HttpServletRequest request,
                                        HttpServletResponse response,
                                        AuthenticationException exception) throws IOException, ServletException {
        String email = request.getParameter("username");
        if (email != null && !email.isBlank()) {
            userService.incrementFailedAttempts(email);
        }
        response.sendRedirect("/login?error");
    }
}
