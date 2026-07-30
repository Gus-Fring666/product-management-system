-- Refined schema for product_management_system
-- Based on analysis of JSP insertion and retrieval logic.

CREATE DATABASE IF NOT EXISTS product_management_system;
USE product_management_system;

-- used by login2.jsp (admin login)
CREATE TABLE IF NOT EXISTS admin (
    username     VARCHAR(50)  PRIMARY KEY,
    userpassword VARCHAR(50)  NOT NULL
);
INSERT INTO admin (username, userpassword) VALUES ('admin', 'admin');

-- used by addproduct2.jsp / viewproduct.jsp / edit.jsp / searchproduct*.jsp
CREATE TABLE IF NOT EXISTS products (
    id          VARCHAR(50)   PRIMARY KEY,
    pname       VARCHAR(100)  NOT NULL,
    catagory    VARCHAR(100)  NOT NULL,
    quantity    INT           NOT NULL,
    cost_price  INT           NOT NULL,
    pstatus     VARCHAR(50)
);

-- used by add_distributer2.jsp / login4.jsp / Distributor_status.jsp
-- Column order from add_distributer2.jsp: txt1, txt2, txt3, txt4, txt5
-- Semantic meaning from add_distrubuter.jsp: Name, Password, Phone, Email, Address
CREATE TABLE IF NOT EXISTS distributer2 (
    dname     VARCHAR(100), -- txt1: Name
    uname     VARCHAR(50),  -- txt2: Password (used as uname in login4.jsp!)
    dcontact  INT,          -- txt3: Phone
    daddress  VARCHAR(200), -- txt4: Email
    upassword VARCHAR(50)   -- txt5: Address
);
-- Note: The app's logic seems to use 'uname' for password and 'upassword' for address 
-- based on the registration form labels vs the insert statement. 
-- However, login4.jsp uses 'uname' and 'upassword' for credentials.
-- To maintain app functionality, we keep the column names but note the semantic mismatch.

-- used by order2.jsp / view.jsp / Distributor_status.jsp
-- Column order from order2.jsp: txt1, txt2, txt3, txt4, txt5, txt6, txt9
-- Semantic meaning from order1.jsp/view.jsp: Dist ID, Dist Name, Address, Order Date, Prod Name, Quantity, Amount
CREATE TABLE IF NOT EXISTS order1 (
    dist_id   VARCHAR(50),
    dname     VARCHAR(100),
    address   VARCHAR(200),
    odate     VARCHAR(50),
    pname     VARCHAR(100),
    quantity  INT,
    amount    INT
);

-- used by contact2.jsp
CREATE TABLE IF NOT EXISTS feedback (
    name    VARCHAR(100),
    email   VARCHAR(100),
    message VARCHAR(1000)
);
