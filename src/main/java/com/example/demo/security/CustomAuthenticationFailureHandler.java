package com.example.demo.security;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import lombok.RequiredArgsConstructor;

import com.example.demo.service.UserService;

@Component
@RequiredArgsConstructor
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

    private final UserService userService;

    /**
     * Handles authentication failure by incrementing the failed attempts for the user
     * and redirecting to the login page with an error message.
     *
     * @param request   the HttpServletRequest
     * @param response  the HttpServletResponse
     * @param exception the AuthenticationException
     */
    @Override
    public void onAuthenticationFailure(HttpServletRequest request,
                                        HttpServletResponse response,
                                        AuthenticationException exception) throws IOException, ServletException {
        String email = request.getParameter("username");
        if (email != null && !email.isBlank()) {
            try {
                userService.incrementFailedAttempts(email);
            } catch (RuntimeException ex) {
                // ignore
            }
        }
        String redirectUrl = "/login?error";
        if (isUsernameNotFound(exception)) {
            redirectUrl += "&noAccount=true";
        }
        response.sendRedirect(redirectUrl);
    }

    private boolean isUsernameNotFound(Throwable ex) {
        while (ex != null) {
            if (ex instanceof UsernameNotFoundException) {
                return true;
            }
            ex = ex.getCause();
        }
        return false;
    }
}
