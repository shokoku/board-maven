CREATE TABLE members (
                         id VARCHAR(255) UNIQUE,
                         pw VARCHAR(255) NOT NULL,
                         name VARCHAR(100) NOT NULL,
                         email VARCHAR(100) NOT NULL,
                         mobile VARCHAR(20) NOT NULL
);