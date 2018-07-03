CREATE TABLE Employee(
    EmployeeKey INTEGER,
    FirstName VARCHAR(10),
    LastName VARCHAR(20),
    Title VARCHAR(5),
    BirthDate DATETIME,
    HireDate DATETIME,
    Address VARCHAR(20),
    City VARCHAR(10),
    Region VARCHAR(5),
    PostalCode VARCHAR(9),
    Country VARCHAR(10),
    PRIMARY KEY (EmployeeKey)
);

CREATE TABLE Country(
    CountryKey INTEGER,
    CountryName VARCHAR(10),
    CountryCode VARCHAR(2),
    CountryCapital VARCHAR(10),
    Population INTEGER,
    PRIMARY KEY (CountryKey)
);

CREATE TABLE State (
    StateKey INTEGER,
    CountryKey INTEGER,
    StateName VARCHAR(10),
    EnglishStateName VARCHAR(10),
    StateType VARCHAR(10),
    StateCode VARCHAR(10),
    StateCapital VARCHAR(10),
    FOREIGN KEY (CountryKey) REFERENCES Country(CountryKey),
    PRIMARY KEY(StateKey)
);

CREATE TABLE City(
    CityKey INTEGER,
    StateKey INTEGER,
    CityName VARCHAR(10),
    FOREIGN KEY (StateKey) REFERENCES State(StateKey),
    PRIMARY KEY (CityKey)
);

CREATE TABLE Supplier(
    SupplierKey INTEGER,
    CityKey INTEGER,
    CompanyName VARCHAR(10),
    Address VARCHAR(100),
    PostalCode VARCHAR(9),
    FOREIGN KEY (CityKey) REFERENCES  City(CityKey),
    PRIMARY KEY (SupplierKey)
);

CREATE TABLE Customer (
    CustomerKey INTEGER,
    CityKey INTEGER,
    CustomerID VARCHAR(10),
    CompanyName VARCHAR(10),
    Address VARCHAR(100),
    PostalCode VARCHAR(9),
    FOREIGN KEY (CityKey) REFERENCES City(CityKey),
    PRIMARY KEY (CustomerKey)
);

CREATE TABLE Category(
    CategoryKey INTEGER,
    CategoryName VARCHAR(10),
    Description VARCHAR(140),
    PRIMARY KEY (CategoryKey)
);

CREATE TABLE Product(
    ProductKey INTEGER,
    CategoryKey INTEGER,
    ProductName VARCHAR(10),
    QuantityPerUnity INTEGER,
    UnitPrice FLOAT,
    Discocntinued BIT,
    FOREIGN KEY (CategoryKey) REFERENCES Category(CategoryKey),
    PRIMARY KEY (ProductKey)
);

CREATE TABLE Shipper(
    ShipperKey INTEGER,
    CompanyName VARCHAR(10),
    PRIMARY KEY (ShipperKey)
);

CREATE TABLE Time(
    TimeKey INTEGER,
    Date DATE,
    DayNbWeek VARCHAR(6),
    DayNameWeek VARCHAR(10),
    DayNbYear VARCHAR(6),
    DyNbMonth VARCHAR(10),
    WeekNbYear VARCHAR(10),
    MonthNumber INTEGER,
    MonthName VARCHAR(10),
    Quarter INTEGER,
    Semester INTEGER,
    Year INTEGER,
    PRIMARY KEY (TimeKey)
);

CREATE TABLE Sales(
    CustomerKey INTEGER,
    EmployeeKey INTEGER,
    OrderDateKey INTEGER,
    DueDateKey INTEGER,
    ShippedDateKey INTEGER,
    ShipperKey INTEGER,
    ProductKey INTEGER,
    SupplierKey INTEGER,
    OrderNo INTEGER,
    OrderLineNo INTEGER,
    UnitPrice FLOAT,
    Quantity INTEGER,
    Discount  FLOAT,
    SalesAmount FLOAT,
    Freight VARCHAR(10),
    FOREIGN KEY (SupplierKey) REFERENCES Supplier(SupplierKey),
    FOREIGN KEY (ProductKey) REFERENCES Product(ProductKey),
    FOREIGN KEY (ShipperKey) REFERENCES Shipper(ShipperKey),
    FOREIGN KEY (ShippedDateKey) REFERENCES Time(TimeKey),
    FOREIGN KEY (DueDateKey) REFERENCES Time(TimeKey),
    FOREIGN KEY (OrderDateKey) REFERENCES Time(TimeKey),
    FOREIGN KEY (EmployeeKey) REFERENCES Employee(EmployeeKey),
    FOREIGN KEY (CustomerKey) REFERENCES Customer(CustomerKey)
);