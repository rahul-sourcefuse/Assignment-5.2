CREATE DATABASE userdatabase;

CREATE TYPE roleType AS ENUM('SuperAdmin','Admin','Subscriber');

CREATE TABLE userstable(
    id SERIAL PRIMARY KEY,
    firstName VARCHAR(150) NOT NULL, 
    middleName VARCHAR(150),
    lastName VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    phoneNumber  VARCHAR(20) NOT NULL,
    Role roleType NOT NULL,
    Address  VARCHAR(200) NOT NULL,
    Doj VARCHAR(250)
);


INSERT INTO userstable(firstName,middleName,lastName,email,phoneNumber,Role,Address,Doj) VALUES ('A','B','C','a@gmail',1234567890,'Admin','123 abc nagar xyz city', '12 jan 2022 14 hour 56min');



CREATE TABLE customerstable(
    customer_name VARCHAR(255),
    website VARCHAR(255),
    customer_address VARCHAR(255),
    user_id INT REFERENCES userstable(id)
);

INSERT INTO customerstable(customer_name,website,customer_address,user_id) VALUES ('cust1','web.com','abc city',33);
INSERT INTO customerstable(customer_name,website,customer_address,user_id) VALUES ('cust2','web2.com','abced city',36);
INSERT INTO customerstable(customer_name,website,customer_address,user_id) VALUES ('cust2','web3.com','xyz city',37);

SELECT id, firstname, middlename , lastname , email, phonenumber, role, address,
    doj, customer_name FROM  userstable LEFT JOIN customerstable on id=user_id; 

