CREATE PROCEDURE InsertOrUpdateEmployee
  @EmployeeID int,
  @FirstName varchar(50),
  @LastName varchar(50),
  @Title varchar(50),
  @Address varchar(50),
  @City varchar(50),
  @Region varchar(50),
  @PostalCode varchar(50),
  @Country varchar(50)
AS
BEGIN
  IF EXISTS(SELECT * FROM Employees WHERE EmployeeID = @EmployeeID)
  BEGIN
    UPDATE Employees
    SET FirstName = @FirstName,
        LastName = @LastName,
        Title = @Title,
        Address = @Address,
        City = @City,
        Region = @Region,
        PostalCode = @PostalCode,
        Country = @Country
    WHERE EmployeeID = @EmployeeID
  END
  ELSE
  BEGIN
    INSERT INTO Employees(EmployeeID, FirstName, LastName, Title, Address, City, Region, PostalCode, Country)
    VALUES(@EmployeeID, @FirstName, @LastName, @Title, @Address, @City, @Region, @PostalCode, @Country)
  END
END


CREATE TABLE Employees (
  EmployeeID int PRIMARY KEY,
  FirstName varchar(50),
  LastName varchar(50),
  Title varchar(50),
  Address varchar(50),
  City varchar(50),
  Region varchar(50),
  PostalCode varchar(50),
  Country varchar(50)
);

INSERT INTO Employees(EmployeeID, FirstName, LastName, Title, Address, City, Region, PostalCode, Country)
VALUES(1, 'John', 'Doe', 'Manager', '123 Main St', 'Anytown', 'CA', '12345', 'USA');


EXEC InsertOrUpdateEmployee 1, 'John', 'Doe', 'Manager', '123 Main St', 'Anytown', 'CA', '12345', 'USA'
