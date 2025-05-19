CREATE TABLE users (
                       id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                       email VARCHAR(255) UNIQUE NOT NULL,
                       password VARCHAR(60) NOT NULL,
                       first_name VARCHAR(50),
                       email_verified BOOLEAN DEFAULT false,
                       hashed_verification_otp VARCHAR(60),
                       otp_expiry_time TIMESTAMP,
                       failed_attempts INT DEFAULT 0,
                       account_non_locked BOOLEAN DEFAULT true,
                       lock_time TIMESTAMP,
                       reset_token_id UUID,
                       hashed_reset_token VARCHAR(60),
                       reset_token_expiry TIMESTAMP,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_email ON users(email);
CREATE INDEX idx_reset_token ON users(reset_token_id);