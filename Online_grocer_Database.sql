create database Online_Grocer_DB;
use Online_Grocer_DB;

select * from purchase;

CREATE TABLE inventory (
    item_number INT PRIMARY KEY,
    description VARCHAR(45),
    quantity_on_hand VARCHAR(45),
    item_types VARCHAR(45),
    location VARCHAR(45),
    unit VARCHAR(45)
);

CREATE TABLE purchase (
    Transaction_ID INT PRIMARY KEY,
    item_number INT,
    quantity VARCHAR(45),
    cost VARCHAR(45),
    purchase_date VARCHAR(45),
    vendor VARCHAR(45),
    FOREIGN KEY (item_number) REFERENCES inventory(item_number)
);

CREATE TABLE sales (
    Transaction_ID INT AUTO_INCREMENT PRIMARY KEY,
    item_number INT,
    Price VARCHAR(45),
    quantity VARCHAR(45),
    date_sold VARCHAR(45),
    customer_id VARCHAR(50),
    FOREIGN KEY (item_number) REFERENCES inventory(item_number)
);

INSERT INTO purchase (Transaction_ID, item_number, quantity, cost, purchase_date, vendor) VALUES
(1, 1000, '25', '2.35', '02-01-2022', 'Bennet Farms'),
(2, 1100, '40', '0.69', '02-02-2022', 'Freshness, Inc.'),
(3, 1222, '40', '0.59', '02-10-2022', 'Freshness, Inc.'),
(4, 1223, '10', '1.75', '02-10-2022', 'Freshness, Inc.'),
(5, 1224, '30', '0.65', '02-10-2022', 'Freshness, Inc.'),
(6, 1223, '10', '1.8', '02-15-2022', 'Freshness, Inc.'),
(7, 2000, '25', '1.29', '02-12-2022', 'Ruby Redd Produce'),
(8, 2001, '20', '2.19', '02-12-2022', 'Ruby Redd Produce');

INSERT INTO inventory (item_number, description, quantity_on_hand, item_types, location, unit) VALUES
(1000, 'Bennet Farm free-range eggs', 4, 'Dairy', 'D12', 'dozen'),
(2000, 'Ruby\'s Kale', 5, 'Produce', 'p12', 'bunch'),
(1100, 'Freshness White beans', 15, 'Canned', 'a2', '12 ounce can'),
(1222, 'Freshness Green beans', 19, 'Canned', 'a3', '12 ounce can'),
(1224, 'Freshness Wax beans', 1, 'Canned', 'a3', '12 ounce can'),
(2001, 'Ruby\'s Organic Kale', 0, 'Produce', 'po2', 'bunch');


CREATE TRIGGER AfterPurchaseInsert
AFTER INSERT ON purchase
FOR EACH ROW
    CALL UpdateInventoryOnPurchase(NEW.item_number, NEW.quantity);
    
    
CREATE TRIGGER AfterSalesInsert
AFTER INSERT ON sales
FOR EACH ROW
    CALL UpdateInventoryOnSale(NEW.item_number, NEW.quantity);

INSERT INTO purchase (Transaction_ID, item_number, quantity, cost, purchase_date, vendor) VALUES
(1, 1000, '25', '2.35', '02-01-2022', 'Bennet Farms');

INSERT INTO purchase (Transaction_ID, item_number, quantity, cost, purchase_date, vendor) VALUES
(5, 1224, '30', '0.65', '02-10-2022', 'Freshness, Inc.'),
(6, 1223, '10', '1.8', '02-15-2022', 'Freshness, Inc.'),
(7, 2000, '25', '1.29', '02-12-2022', 'Ruby Redd Produce'),
(8, 2001, '20', '2.19', '02-12-2022', 'Ruby Redd Produce');

INSERT INTO inventory (item_number, description, quantity_on_hand, item_types, location, unit)
VALUES (1223, 'Freshness Green beans', '2', 'Canned', 'a7', '36 oz can');

INSERT INTO sales (Transaction_ID, item_number, Price, quantity, date_sold, customer_id)
VALUES
    (101, 1000, '5.59', '2', '02-02-2022', '198765'),
    (102, 2000, '3.99', '2', '02-02-2022', NULL),
    (103, 1100, '1.49', '2', '02-02-2022', '202900'),
    (104, 1000, '5.99', '2', '02-04-2022', '196777'),
    (105, 1100, '1.49', '8', '02-07-2022', '198765'),
    (106, 1000, '5.49', '4', '02-11-2022', '277177'),
    (107, 1100, '1.49', '4', '02-11-2022', NULL),
    (108, 1222, '1.29', '12', '02-12-2022', '111000'),
    (109, 1224, '1.55', '8', '02-12-2022', NULL),
    (110, 1223, '3.49', '5', '02-13-2022', '198765'),
    (111, 2001, '6.99', '1', '02-13-2022', '100988'),
    (112, 2001, '6.99', '12', '02-14-2022', '202900'),
    (113, 2000, '3.99', '2', '02-15-2022', '111000');


