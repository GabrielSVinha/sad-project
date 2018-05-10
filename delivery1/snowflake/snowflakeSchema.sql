CREATE TABLE RegionDimension (
    regionId INTEGER,
    regionDescription VARCHAR(70)
);

CREATE TABLE TerritoryDimension (
	territoryId INTEGER,
	territoryDescription VARCHAR(70),
    regionId INTEGER,
	PRIMARY KEY (territoryId),
    FOREIGN KEY(regionId) REFERENCES RegionDimension(regionId)
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
