CREATE TABLE members (
                         id VARCHAR(255) UNIQUE,
                         pw VARCHAR(255) NOT NULL,
                         name VARCHAR(100) NOT NULL,
                         email VARCHAR(100) NOT NULL,
                         mobile VARCHAR(20) NOT NULL
);

CREATE TABLE verification(
    id int AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    code VARCHAR(10) NOT NULL
);