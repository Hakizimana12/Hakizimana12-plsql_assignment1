-- BUS table: Stores information about buses
CREATE TABLE BUS (
    bus_id INT PRIMARY KEY,
    model VARCHAR(255) NOT NULL,
    license_plate VARCHAR(13) UNIQUE,
    registration_date DATE
);

-- DRIVER table: Stores information about bus drivers
CREATE TABLE DRIVER (
    driver_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_date DATE
);

-- PASSENGER table: Stores information about passengers
CREATE TABLE PASSENGER (
    passenger_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    registration_date DATE
);

CREATE TABLE BUS_DRIVER (
    bus_id INT,
    driver_id INT,
    PRIMARY KEY (bus_id, driver_id),
    FOREIGN KEY (bus_id) REFERENCES BUS(bus_id),
    FOREIGN KEY (driver_id) REFERENCES DRIVER(driver_id)
);


-- BUS_PASSENGER table: Junction table for many-to-many relationship between BUS and PASSENGER
-- This tracks which passengers travel on which buses and when
CREATE TABLE BUS_PASSENGER (
    bus_id INT,
    passenger_id INT,
    travel_date DATE,
    PRIMARY KEY (bus_id, passenger_id, travel_date),
    FOREIGN KEY (bus_id) REFERENCES BUS(bus_id),
    FOREIGN KEY (passenger_id) REFERENCES PASSENGER(passenger_id)
);



-- Inserting into the BUS table
INSERT INTO BUS (bus_id, model, license_plate, registration_date) 
VALUES (1, 'Mercedes Sprinter', 'BUS1234567890', TO_DATE('2023-01-01', 'YYYY-MM-DD'));

INSERT INTO BUS (bus_id, model, license_plate, registration_date) 
VALUES (2, 'Ford Transit', 'BUS0987654321', TO_DATE('2023-02-15', 'YYYY-MM-DD'));



-- Inserting into the DRIVER table
INSERT INTO DRIVER (driver_id, name, birth_date) 
VALUES (1, 'Alice Johnson', TO_DATE('1980-05-20', 'YYYY-MM-DD'));

INSERT INTO DRIVER (driver_id, name, birth_date) 
VALUES (2, 'Bob Williams', TO_DATE('1975-11-03', 'YYYY-MM-DD'));

-- Inserting into the PASSENGER table
INSERT INTO PASSENGER (passenger_id, name, email, registration_date) 
VALUES (1, 'John Doe', 'john.doe@email.com', TO_DATE('2023-03-01', 'YYYY-MM-DD'));

INSERT INTO PASSENGER (passenger_id, name, email, registration_date) 
VALUES (2, 'Jane Smith', 'jane.smith@email.com', TO_DATE('2023-04-10', 'YYYY-MM-DD'));


-- Inserting into the BUS_DRIVER table
INSERT INTO BUS_DRIVER (bus_id, driver_id) 
VALUES (1, 1);  -- Mercedes Sprinter operated by Alice Johnson

INSERT INTO BUS_DRIVER (bus_id, driver_id) 
VALUES (2, 2);  -- Ford Transit operated by Bob Williams

-- Inserting into the BUS_PASSENGER table
INSERT INTO BUS_PASSENGER (bus_id, passenger_id, travel_date) 
VALUES (1, 1, TO_DATE('2023-03-15', 'YYYY-MM-DD'));  -- John Doe traveled on Mercedes Sprinter


INSERT INTO BUS_PASSENGER (bus_id, passenger_id, travel_date) 
VALUES (2, 2, TO_DATE('2023-04-20', 'YYYY-MM-DD'));  -- Jane Smith traveled on Ford Transit



-- Update data
-- Modifying the model of a bus
UPDATE BUS SET model = 'Mercedes Sprinter (Upgraded)' WHERE bus_id = 1;


-- Delete data
-- Removing a passenger travel record
DELETE FROM BUS_PASSENGER WHERE bus_id = 1 AND passenger_id = 1;


-- Select data with join
-- This query retrieves bus models, driver names, passenger names, and travel dates
SELECT b.model, d.name AS driver_name, p.name AS passenger_name, bp.travel_date
FROM BUS b
JOIN BUS_DRIVER bd ON b.bus_id = bd.bus_id
JOIN DRIVER d ON bd.driver_id = d.driver_id
LEFT JOIN BUS_PASSENGER bp ON b.bus_id = bp.bus_id
LEFT JOIN PASSENGER p ON bp.passenger_id = p.passenger_id;


-- Subquery example
-- This query finds all buses that are currently available (not yet used by passengers)
SELECT model
FROM BUS
WHERE bus_id NOT IN (
    SELECT bus_id
    FROM BUS_PASSENGER
);


-- DCL: Grant select permission on BUS table to a user
GRANT SELECT ON BUS TO C##MC;

-- TCL: Start a transaction, insert a new bus, and commit

-- Inserting into the BUS table
INSERT INTO BUS (bus_id, model, license_plate, registration_date) 
VALUES (3, 'Volvo Coach', 'BUS1122334455', TO_DATE('2023-05-05', 'YYYY-MM-DD'));

-- Commit the transaction
COMMIT;


