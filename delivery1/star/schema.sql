DROP DATABASE IF EXISTS schema

CREATE TABLE CustomersDimension (
    CustomerID      int             NOT NULL,
    CompanyName     varchar(30)     NOT NULL,
    ContactName     varchar(30)     NOT NULL,
    ContactTitle    varchar(30)     NOT NULL,
    Address         varchar(100)    NOT NULL,
    City            varchar(10)     NOT NULL,
    Region          int             NOT NULL,
    PostalCode      int             NOT NULL,
    Country         varchar(10)     NOT NULL,
    Phone           varchar(8)      NOT NULL,
    Fax             int             NOT NULL,
    PRIMARY KEY (Customer ID)
)
