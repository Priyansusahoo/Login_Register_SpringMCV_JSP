_Execute the below SQL before running the application:_

### `Schema.sql` :

```sql
CREATE TABLE users (
                       id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                       email VARCHAR(255) UNIQUE NOT NULL,
                       password VARCHAR(100) NOT NULL,
                       first_name VARCHAR(50),
                       email_verified BOOLEAN DEFAULT false,
                       hashed_verification_otp VARCHAR(100),
                       otp_expiry_time TIMESTAMP,
                       failed_attempts INT DEFAULT 0,
                       account_non_locked BOOLEAN DEFAULT true,
                       lock_time TIMESTAMP,
                       reset_token_id UUID,
                       hashed_reset_token VARCHAR(100),
                       reset_token_expiry TIMESTAMP,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_email ON users(email);
CREATE INDEX idx_reset_token ON users(reset_token_id);
```


### `application.properties`:


`PATH` - `src/main/resources`

#### `NOTE`:
- Configure SMTP (use the email ID and generate a `"APP-PASSWORD"` for `email` service to work.)
- Configure Database

```properties
spring.application.name=demo1

server.port=8080


# Database
spring.datasource.url=jdbc:postgresql://localhost:5432/demo
spring.datasource.username=postgres
spring.datasource.password=

# PostgreSQL UUID Support
#spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect
spring.jpa.hibernate.ddl-auto=validate

# JSP
spring.mvc.view.prefix=/WEB-INF/jsp/
spring.mvc.view.suffix=.jsp

# Security
spring.security.user.name=admin
spring.security.user.password=adminpass

# Email (SMTP)
spring.mail.host=smtp.gmail.com
spring.mail.port=587
spring.mail.username=		# email id
spring.mail.password=		# App Password - Generate one
spring.mail.properties.mail.smtp.auth=true
spring.mail.properties.mail.smtp.starttls.enable=true

#DEBUG
logging.level.org.springframework.security=DEBUG

# Session
server.servlet.session.timeout=30m
```
