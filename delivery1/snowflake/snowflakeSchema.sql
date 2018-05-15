CREATE TABLE RegionDimension (
    regionId INTEGER,
    regionDescription VARCHAR(70),
	PRIMARY KEY (regionId)
);

CREATE TABLE TerritoryDimension (
	territoryId INTEGER,
	territoryDescription VARCHAR(70),
    regionId INTEGER,
	PRIMARY KEY (territoryId),
    FOREIGN KEY(regionId) REFERENCES RegionDimension(regionId)
);

CREATE TABLE EmployeeDimension (
	employeeId INTEGER,
	territoryId INTEGER,
	firstName VARCHAR(70),
	lastName VARCHAR(70),
	title VARCHAR(70),
	titleOfCourtesy VARCHAR(70),
	birthDate DATE,
	hireDate DATE,
	homePhone VARCHAR(10),
	extension VARCHAR(70),
	PRIMARY KEY (employeeId),
	FOREIGN KEY (territoryId) REFERENCES TerritoryDimension(territoryId)
);

CREATE TABLE CustomerDimension(
	customerId INTEGER,
	companyName VARCHAR(70),
	PRIMARY KEY (customerId),
);

CREATE TABLE ContactDimension (
    contactId INTEGER,
    customerId INTEGER,
    contactName VARCHAR(70),
	contactTitle VARCHAR(70),
    PRIMARY KEY (contactId),
    FOREIGN KEY (customerId) REFERENCES CustomerDimension(customerId)
);

CREATE TABLE ShipperDimension (
	shipperId INTEGER,
	companyName VARCHAR(40),
	PRIMARY KEY (shipperId)
);

CREATE TABLE ProductDetailsDimension (
	productDetailId INTEGER,
	productName VARCHAR(20),
	quantityPerUnit INTEGER,
	unitPrice INTEGER,
	unitsInStock INTEGER,
	unitsInOrder INTEGER,
	reorderLevel INTEGER,
	discontinued BIT,
	PRIMARY KEY (productDetailId)
);

CREATE TABLE CategoryDimension (
	categoryId INTEGER,
	categoryName VARCHAR(10),
	categoryDescription VARCHAR(200),
	PRIMARY KEY (categoryId)
);

CREATE TABLE SupplierContactDimension (
    supplierContactId INTEGER,
    supplierContactName VARCHAR(70),
	supplierContactTitle VARCHAR(70),
    PRIMARY KEY (contactId),
);

CREATE TABLE SupplierDimension (
	supplierId INTEGER,
	companyName VARCHAR(20),
	supplierContactId INTEGER,
	PRIMARY KEY (supplierId),
	FOREIGN KEY (supplierContactId) REFERENCES SupplierContactDimension(supplierContactId)
);

CREATE TABLE ProductDimension (
	productId INTEGER,
	productDetailId INTEGER,
	supplierId INTEGER,
	categoryId INTEGER,
	PRIMARY KEY (productId),
	FOREIGN KEY (productDetailId) REFERENCES ProductDetailsDimension(productDetailId),
	FOREIGN KEY (supplierId) REFERENCES SupplierDimension(supplierId),
	FOREIGN KEY (categoryId) REFERENCES CategoryDimension(categoryId)
);

CREATE TABLE OrderFact (
	orderId INTEGER,
	customerId INTEGER,
	employeeId INTEGER,
	shipperId INTEGER,
	productId INTEGER,
	PRIMARY KEY (orderId),
	FOREIGN KEY (customerId) REFERENCES CustomerDimension(customerId),
	FOREIGN KEY (employeeId) REFERENCES EmployeeDimension(employeeId),
	FOREIGN KEY (shipperId) REFERENCES ShipperDimension(shipperId),
	FOREIGN KEY (productId) REFERENCES ProductDimension(productId)
);
