CREATE DATABASE sole;

CREATE TABLE customer
	(customerID INT PRIMARY KEY,
	firstName VARCHAR(50) NOT NULL,
	lastName VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL,
	contactNum VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL,
	country VARCHAR(50) NOT NULL,
	zipcode VARCHAR(20) NOT NULL);
	
CREATE TABLE shipment
	(shipmentID INT PRIMARY KEY,
	shipmentDate DATE NOT NULL,
	courier VARCHAR(100) NOT NULL,
	customerID INT NOT NULL,
	CONSTRAINT fk_shipment FOREIGN KEY (customerID) REFERENCES customer(customerID));
	
CREATE TABLE payment
	(paymentID INT PRIMARY KEY,
	paymentMethod VARCHAR(50) NOT NULL,
	amount DECIMAL(10,2) NOT NULL,
	customerID INT NOT NULL,
	CONSTRAINT fk_payment FOREIGN KEY (customerID) REFERENCES customer(customerID));

CREATE TABLE voucher
	(voucherCode INT PRIMARY KEY,
	value DECIMAL(10,2) NOT NULL);
	
CREATE TABLE category
	(categoryID INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL);
	
CREATE TABLE product
	(productID INT PRIMARY KEY,
	SKU VARCHAR(20) NOT NULL,
	description VARCHAR(100) NOT NULL,
	price DECIMAL(10,2) NOT NULL,
	stock INT(3),
	categoryID INT NOT NULL,
	CONSTRAINT fk_product FOREIGN KEY (categoryID) REFERENCES category(categoryID));
	
CREATE TABLE orders 
	(orderID INT PRIMARY KEY,
    orderDate DATE NOT NULL,
    totalPrice DECIMAL(10,2) NOT NULL,
    customerID INT NOT NULL,
    paymentID INT NOT NULL,
    shipmentID INT NOT NULL,
    voucherCode INT NOT NULL,
    CONSTRAINT fk_customer FOREIGN KEY (customerID) REFERENCES customer(customerID),
    CONSTRAINT fk_pay FOREIGN KEY (paymentID) REFERENCES payment(paymentID),
    CONSTRAINT fk_ship FOREIGN KEY (shipmentID) REFERENCES shipment(shipmentID),
    CONSTRAINT fk_voucher FOREIGN KEY (voucherCode) REFERENCES voucher(voucherCode));

	
CREATE TABLE order_item
	(orderitemID INT PRIMARY KEY,
	quantity INT(3) NOT NULL,
	price DECIMAL(10,2) NOT NULL,
	productID INT NOT NULL,
	orderID INT NOT NULL,
	CONSTRAINT fk_order FOREIGN KEY (productID) REFERENCES product(productID),
	CONSTRAINT fk_order2 FOREIGN KEY (orderID) REFERENCES orders(orderID));
	
CREATE TABLE cart
	(cartID INT PRIMARY KEY,
	quantity INT(3) NOT NULL,
	customerID INT NOT NULL,
	productID INT NOT NULL,
	CONSTRAINT fk_cust FOREIGN KEY (customerID) REFERENCES customer(customerID),
	CONSTRAINT fk_prod FOREIGN KEY (productID) REFERENCES product(productID));
	
INSERT INTO customer(customerID, firstName, lastName, email, contactNum, address, city, country, zipcode)
	VALUES (001, 'Roland Jay', 'Pada', 'padaroland@gmail.com', '+63 935 4867 666', 'Catalina', 'Zamboanga', 'Phil', 7000);
	
INSERT INTO customer(customerID, firstName, lastName, email, contactNum, address, city, country, zipcode)
	VALUES (002, 'Khalil', 'Isahac', 'isahackhalil@gmail.com', '+63 987 678 345', 'Putik', 'Zamboanga', 'Phil', 7000);
	
INSERT INTO customer(customerID, firstName, lastName, email, contactNum, address, city, country, zipcode)
	VALUES (003, 'Jenny An', 'Haming', 'hamingjenny@gmail.com', '+63 996 4868 919', 'Southcom', 'Zamboanga', 'Phil', 7000);
	
 INSERT INTO customer(customerID, firstName, lastName, email, contactNum, address, city, country, zipcode)
    VALUES (004, 'Fatima', 'Ismail', 'ismailfatima@gmail.com', '+63 987 6765 432', 'Katatagan', 'Zamboanga', 'Phil', 7000);
	
INSERT INTO customer(customerID, firstName, lastName, email, contactNum, address, city, country, zipcode)
	VALUES (005, 'Merham', 'Usman', 'usmanmerham@gmail.com', '+63 965 3194 037', 'Suterville', 'Zamboanga', 'Phil', 7000);
	
INSERT INTO customer(customerID, firstName, lastName, email, contactNum, address, city, country, zipcode)
    VALUES (006, 'Lujain', 'Muallip', 'muallipluj@gmail.com', '+63 923 7550 990', 'Jolo', 'Sulu', 'Phil', 7400);
	
INSERT INTO customer(customerID, firstName, lastName, email, contactNum, address, city, country, zipcode)
	VALUES (007, 'Mark Lorenz', 'Lidon', 'lidonlorenz@hotmail.com', '+63 887 6004 710', 'Sinunuc', 'Zamboanga', 'Phil', 7000);
	
INSERT INTO customer(customerID, firstName, lastName, email, contactNum, address, city, country, zipcode)
	VALUES (008, 'Mica Louise', 'Lim', 'micalim@outlook.com', '+63 546 7529 640', 'Catalina', 'Zamboanga', 'Phil', 7000);
	
INSERT INTO customer(customerID, firstName, lastName, email, contactNum, address, city, country, zipcode)
	VALUES (009, 'Nasra', 'Iribani', 'iribaninas@gmail.com', '+63 1029 6578 327', 'San Roque', 'Zamboanga', 'Phil', 7000);
	
INSERT INTO customer(customerID, firstName, lastName, email, contactNum, address, city, country, zipcode)
	VALUES (010, 'Landelyn', 'Robas', 'landelyn@gmail.com', '+63 347 8920 675', 'Sinunuc', 'Zamboanga', 'Phil', 7000);
	
 INSERT INTO category(categoryID, name)
	VALUES (111, 'Adidas');
	
INSERT INTO category(categoryID, name)
	VALUES (222, 'Puma');
	
INSERT INTO category(categoryID, name)
	VALUES (333, 'Nike');
	
INSERT INTO category(categoryID, name)
	VALUES (444, 'Under Armour');
	
INSERT INTO category(categoryID, name)
	VALUES (555, 'New Balance');
	
INSERT INTO category(categoryID, name)
	VALUES (666, 'Vans');
	
INSERT INTO category(categoryID, name)
	VALUES (777, 'Converse');
	
INSERT INTO category(categoryID, name)
	VALUES (888, 'Fila');
	
INSERT INTO category(categoryID, name)
	VALUES (999, 'Reebok');
	
INSERT INTO category(categoryID, name)
	VALUES (9999, 'Balenciaga');
	
INSERT INTO product(productID, SKU, description, price, stock, categoryID)
	VALUES (5001, 'NKE-37', 'NIKE Invinsible 3', 9895.00, 20, 333);
	
INSERT INTO product(productID, SKU, description, price, stock, categoryID)
	VALUES (5002, 'NBL-40', 'New Balance 2002rd', 8800.00, 5, 555);
	
INSERT INTO product(productID, SKU, description, price, stock, categoryID)
	VALUES (5003, 'VNS-39', 'Old Skool Bolt', 4100.00, 10, 666);
	
INSERT INTO product(productID, SKU, description, price, stock, categoryID)
	VALUES (5004, 'PMA-40', 'Clyde OG', 6800.00, 3, 222);
	
INSERT INTO product(productID, SKU, description, price, stock, categoryID)
	VALUES (5005, 'AUM-42', 'Curry 4 Low', 9195.00, 2, 444);
	
INSERT INTO product(productID, SKU, description, price, stock, categoryID)
	VALUES (5006, 'ADD-36', 'WMNs Grand Court Alpha Sneakers', 3900.00, 15, 111);
	
INSERT INTO product(productID, SKU, description, price, categoryID)
	VALUES (5007, 'BAL-37', 'Cargo Sneaker WMN', 74581.00, 9999);
	
INSERT INTO product(productID, SKU, description, price, stock, categoryID)
	VALUES (5008, 'CON-42', 'Chuck 70', 5163.30, 17, 777);
	
INSERT INTO product(productID, SKU, description, price, stock, categoryID)
	VALUES (5009, 'FIL-36', 'WMNs Defiant Flow', 2399.00, 7, 888);
	
INSERT INTO product(productID, SKU, description, price, stock, categoryID)
	VALUES (5010, 'REB-38', 'Classic Leather', 3995.00, 10, 999);

INSERT INTO cart(cartID, quantity, customerID, productID)
	VALUES (1121, 1, 001, 5008);
	
INSERT INTO cart(cartID, quantity, customerID, productID)
	VALUES (1122, 2, 002, 5002);
	
INSERT INTO cart(cartID, quantity, customerID, productID)
	VALUES (1123, 1, 003, 5003);
	
INSERT INTO cart(cartID, quantity, customerID, productID)
	VALUES (1124, 1, 004, 5010);
	
INSERT INTO cart(cartID, quantity, customerID, productID)
	VALUES (1125, 1, 005, 5001);
	
INSERT INTO cart(cartID, quantity, customerID, productID)
	VALUES (1126, 1, 006, 5006);
	
INSERT INTO cart(cartID, quantity, customerID, productID)
	VALUES (1127, 1, 007, 5005);
	
INSERT INTO cart(cartID, quantity, customerID, productID)
	VALUES (1128, 1, 008, 5007);
	
INSERT INTO cart(cartID, quantity, customerID, productID)
	VALUES (1129, 2, 009, 5004);
	
INSERT INTO cart(cartID, quantity, customerID, productID)
	VALUES (1130, 1, 010, 5009);
	
INSERT INTO voucher(voucherCode, value)
	VALUES (56748943, 50.00);
	
INSERT INTO voucher(voucherCode, value)
	VALUES (23418119, 70.00);
	
INSERT INTO voucher(voucherCode, value)
	VALUES (67239812, 100.00);
	
INSERT INTO voucher(voucherCode, value)
	VALUES (45329815, 20.00);
	
INSERT INTO voucher(voucherCode, value)
	VALUES (50228973, 30.00);
	
INSERT INTO voucher(voucherCode, value)
	VALUES (66497829, 99.00);
	
INSERT INTO voucher(voucherCode, value)
	VALUES (89205610, 90.00);

INSERT INTO voucher(voucherCode, value)
	VALUES (57290371, 80.00);
	
INSERT INTO voucher(voucherCode, value)
	VALUES (89457201, 60.00);
	
INSERT INTO voucher(voucherCode, value)
	VALUES (67503156, 40.00);
	
INSERT INTO shipment(shipmentID, shipmentDate, courier, customerID)
	VALUES (4001, '2024-05-10', 'NINJAVAN', 001);
	
INSERT INTO shipment(shipmentID, shipmentDate, courier, customerID)
	VALUES (4002, '2024-05-20', 'J&T', 002);
	
INSERT INTO shipment(shipmentID, shipmentDate, courier, customerID)
	VALUES (4003, '2024-06-01', 'NINJAVAN', 003);
	
INSERT INTO shipment(shipmentID, shipmentDate, courier, customerID)
	VALUES (4004, '2024-05-25', 'J&T', 004);
	
INSERT INTO shipment(shipmentID, shipmentDate, courier, customerID)
	VALUES (4005, '2024-05-22', 'LBC Express', 005);
	
INSERT INTO shipment(shipmentID, shipmentDate, courier, customerID)
	VALUES (4006, '2024-06-05', 'GoGo Express', 006);
	
INSERT INTO shipment(shipmentID, shipmentDate, courier, customerID)
	VALUES (4007, '2024-06-02', 'JRS Express', 007);
	
INSERT INTO shipment(shipmentID, shipmentDate, courier, customerID)
	VALUES (4008, '2024-05-10', 'LBC Express', 008);
	
INSERT INTO shipment(shipmentID, shipmentDate, courier, customerID)
	VALUES (4009, '2024-06-01', 'NINJAVAN', 009);
	
INSERT INTO shipment(shipmentID, shipmentDate, courier, customerID)
	VALUES (4010, '2024-05-15', 'JRS Express', 010);
	
INSERT INTO payment(paymentID, paymentMethod, amount, customerID)
	VALUES (1001, 'COD', 5203.30, 001);
	
INSERT INTO payment(paymentID, paymentMethod, amount, customerID)
	VALUES (1002, 'COD', 17610.00, 002);
	
INSERT INTO payment(paymentID, paymentMethod, amount, customerID)
	VALUES (1003, 'COD', 4150.00, 003);
	
INSERT INTO payment(paymentID, paymentMethod, amount, customerID)
	VALUES (1004, 'COD', 4055.00, 004);
	
INSERT INTO payment(paymentID, paymentMethod, amount, customerID)
	VALUES (1005, 'COD', 9915.00, 005);

INSERT INTO payment(paymentID, paymentMethod, amount, customerID)
	VALUES (1006, 'COD', 3970.00, 006);
	
INSERT INTO payment(paymentID, paymentMethod, amount, customerID)
	VALUES (1007, 'COD', 9275.00, 007);
	
INSERT INTO payment(paymentID, paymentMethod, amount, customerID)
	VALUES (1008, 'COD', 74581.00, 008);
	
INSERT INTO payment(paymentID, paymentMethod, amount, customerID)
	VALUES (1009, 'COD', 13501.00, 009);
	
INSERT INTO payment(paymentID, paymentMethod, amount, customerID)
	VALUES (1010, 'COD', 2479.00, 010);
	
INSERT INTO orders(orderID, orderDate, totalPrice, customerID, paymentID, shipmentID, voucherCode)
	VALUES (8801, '2024-05-05', 5203.30, 001, 1001, 4001, 89457201);
	
INSERT INTO orders(orderID, orderDate, totalPrice, customerID, paymentID, shipmentID, voucherCode)
	VALUES (8802, '2024-04-15', 17610.00, 002, 1002, 4002, 89205610);
	
INSERT INTO orders(orderID, orderDate, totalPrice, customerID, paymentID, shipmentID, voucherCode)
	VALUES (8803, '2024-05-25', 4150.00, 003, 1003, 4003, 56748943);
	
INSERT INTO orders(orderID, orderDate, totalPrice, customerID, paymentID, shipmentID, voucherCode)
	VALUES (8804, '2024-05-20', 4055.00, 004, 1004, 4004, 67503156);
	
INSERT INTO orders(orderID, orderDate, totalPrice, customerID, paymentID, shipmentID, voucherCode)
	VALUES (8805, '2024-05-17', 9915.00, 005, 1005, 4005, 57290371);
	
INSERT INTO orders(orderID, orderDate, totalPrice, customerID, paymentID, shipmentID, voucherCode)
	VALUES (8806, '2024-05-30', 3970.00, 006, 1006, 4006, 50228973);
	
INSERT INTO orders(orderID, orderDate, totalPrice, customerID, paymentID, shipmentID, voucherCode)
	VALUES (8807, '2024-05-27', 9275.00, 007, 1007, 4007, 23418119);
	
INSERT INTO orders(orderID, orderDate, totalPrice, customerID, paymentID, shipmentID, voucherCode)
	VALUES (8808, '2024-05-05', 74581.00, 008, 1008, 4008, 67239812);
	
INSERT INTO orders(orderID, orderDate, totalPrice, customerID, paymentID, shipmentID, voucherCode)
	VALUES (8809, '2024-05-24', 13501.00, 009, 1009, 4009, 66497829);
	
INSERT INTO orders(orderID, orderDate, totalPrice, customerID, paymentID, shipmentID, voucherCode)
	VALUES (8810, '2024-05-10', 2479.00, 010, 1010, 4010, 45329815);
	
INSERT INTO order_item(orderitemID, quantity, price, orderID, productID)
	VALUES (9901, 1, 5163.30, 8801, 5001);
	
INSERT INTO order_item(orderitemID, quantity, price, orderID, productID)
	VALUES (9902, 2, 17600.00, 8802, 5002);
	
INSERT INTO order_item(orderitemID, quantity, price, orderID, productID)
	VALUES (9903, 1, 4100.00, 8803, 5003);
	
INSERT INTO order_item(orderitemID, quantity, price, orderID, productID)
	VALUES (9904, 1, 3995.00, 8804, 5004);
	
INSERT INTO order_item(orderitemID, quantity, price, orderID, productID)
	VALUES (9905, 1, 9895.00, 8805, 5005);
	
INSERT INTO order_item(orderitemID, quantity, price, orderID, productID)
	VALUES (9906, 1, 3900.00, 8806, 5006);
	
INSERT INTO order_item(orderitemID, quantity, price, orderID, productID)
	VALUES (9907, 1, 9195.00, 8807, 5007);
	
INSERT INTO order_item(orderitemID, quantity, price, orderID, productID)
	VALUES (9908, 1, 74581.00, 8808, 5008);
	
INSERT INTO order_item(orderitemID, quantity, price, orderID, productID)
	VALUES (9909, 2, 13600.00, 8809, 5009);
	
INSERT INTO order_item(orderitemID, quantity, price, orderID, productID)
	VALUES (9910, 1, 2399.00, 8810, 5010);
	
	

