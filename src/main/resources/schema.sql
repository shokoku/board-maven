CREATE TABLE members (
                         member_id VARCHAR(255) UNIQUE,
                         member_pw VARCHAR(255) NOT NULL,
                         member_name VARCHAR(100) NOT NULL,
                         member_email VARCHAR(100) NOT NULL,
                         member_mobile VARCHAR(20) NOT NULL
);
