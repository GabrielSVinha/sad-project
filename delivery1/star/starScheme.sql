CREATE TABLE AddressDimension (
	addressId INTEGER,
	address VARCHAR(70),
	city VARCHAR(70),
	region VARCHAR(70),
	postalCode VARCHAR(70),
	country VARCHAR(70),
	PRIMARY KEY (addressId)
);

CREATE TABLE DateDimension (
	dateId INTEGER,
	orderDate DATE,
	requiredDate DATE,
	shippedDate DATE,
	PRIMARY KEY (dateId)
);

CREATE TABLE TerritoryDimension (
	territoryId INTEGER,
	territoryDescription VARCHAR(70),
	regionDescription VARCHAR(70),
	PRIMARY KEY (dateId)
);

CREATE TABLE ShipperDimension (
	shipperId INTEGER,
	companyName VARCHAR(70),
	phone VARCHAR(10),
	PRIMARY KEY (shipperId)
);

CREATE TABLE SupplierDimension (
	supplierId INTEGER,
	addressId INTEGER, 
	companyName VARCHAR(70),
	contactName VARCHAR(70),
	contactTitle VARCHAR(70),
	phone VARCHAR(10),
	fax VARCHAR(10),
	homePage VARCHAR(70),
	PRIMARY KEY (supplierId),
	FOREIGN KEY addressId REFERENCES AddressDimension(addressId)
);



CREATE TABLE ProductDimension (
	productId INTEGER,
	productName VARCHAR(70),
	quantityPerUnit INTEGER,
	unitPrice DECIMAL,
	unitsInStock INTEGER,
	unitsOnOrder INTEGER,
	reorderLever INTEGER,
	discontinued BIT,
	supplierId INTEGER,
	categoryName VARCHAR(70),
	description VARCHAR(70),
	PRIMARY KEY (productId),
	FOREIGN KEY (supplierId) REFERENCES SupplierDimension(supplierId)
);

CREATE TABLE EmployeeDimension (
	emplyeeId INTEGER,
	territoryId INTEGER,
	firstName VARCHAR(70),
	lastName VARCHAR(70),
	title VARCHAR(70),
	titleOfCourtesy VARCHAR(70),
	birthDate DATE,
	hireDate DATE,
	homePhone VARCHAR(10),
	extension VARCHAR(70),
	PRIMARY KEY (employeeId)
	FOREIGN KEY territoryId REFERENCES TerritoryDimension(territoryId)
);

CREATE TABLE CustomerDimension(
	customerId INTEGER,
	addressId INTEGER,
	companyName VARCHAR(70),
	contactName VARCHAR(70),
	contactTitle VARCHAR(70),
	PRIMARY KEY (customerId),
	FOREIGN KEY addressId REFERENCES AddressDimension(addressId)
);

CREATE TABLE OrderFact (
	orderId INTEGER,
	dateId INTEGER,
	employeeId INTEGER,
	supplierId INTEGER,
	addressId INTEGER,
	customerId INTEGER,
	shipperId INTEGER,
	productId INTEGER,
	freight VARCHAR(70),
	shipName VARCHAR(70),
	shipAddress VARCHAR(70),
	shipCity VARCHAR(70),
	shipRegion VARCHAR(70), --2
	shipPostalCode VARCHAR(10), --2
	shipCountry VARCHAR(70),
	PRIMARY KEY (orderId),
	FOREIGN KEY dateId REFERENCES DateDimension(dateId),
	FOREIGN KEY employeeId REFERENCES EmployeeDimension(employeeId),
	FOREIGN KEY supplierId REFERENCES SupplierDimension(supplierId),
	FOREIGN KEY addressId REFERENCES AddressDimension(addressId),
	FOREIGN KEY customerId REFERENCES CustomerDimension(customerId),
	FOREIGN KEY shipperId REFERENCES SupplierDimension(shipperId),
	FOREIGN KEY productId REFERENCES ProductDimension(productId)
);

