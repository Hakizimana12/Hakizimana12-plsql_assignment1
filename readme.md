

# Bus Transport Management Database

## Overview

The **Bus Transport Management Database** is a SQL-based system designed to manage bus fleets, drivers, passengers, and their journeys. This system facilitates tracking bus assignments, driver schedules, and passenger bookings, ensuring efficient operations and seamless data management.

## Database Schema

The database consists of several core tables that store essential information about buses, drivers, and passengers. Additionally, junction tables are used to manage the many-to-many relationships between buses and drivers, as well as between buses and passengers for their journeys.

### Core Tables

1. **BUS**: This table stores information about the buses in the system, including the model, license plate, and the date each bus was registered. Each bus has a unique identifier (bus_id) to ensure all entries are distinct.

2. **DRIVER**: This table holds information about the drivers who operate the buses. Each driver has a unique driver_id, and their name and birth date are also recorded for tracking and scheduling purposes.

3. **PASSENGER**: This table contains details about the passengers who book journeys on the buses. Each passenger has a unique passenger_id, and additional details like name, email, and registration date are captured for communication and booking management.

![Reference](/CreatingTables.png)

### Junction Tables

1. **BUS_DRIVER**: This table establishes the many-to-many relationship between buses and drivers. A bus can be driven by multiple drivers, and a driver can operate multiple buses. The table links buses and drivers through their respective unique identifiers (bus_id and driver_id).

2. **BUS_PASSENGER**: This table tracks the journeys of passengers on the buses. It records the bus_id, passenger_id, and the travel date, allowing for efficient management of bookings and travel histories. Multiple passengers can book the same bus, and each journey is identified by a combination of these attributes.


---

## ER Diagram

The **Entity-Relationship (ER) Diagram** visually represents the relationships between the key entities in the system: **BUS**, **DRIVER**, and **PASSENGER**. The many-to-many relationships between buses and drivers, and between buses and passengers, are handled through the **BUS_DRIVER** and **BUS_PASSENGER** junction tables. These relationships are supported by foreign keys to ensure data integrity and seamless interaction between the entities. The ER diagram serves as a roadmap to understand how data flows within the bus transport management system.

![Reference](/ER.png)

---

## Key Features

### Many-to-Many Relationships

The system supports many-to-many relationships between buses and drivers, as well as between buses and passengers. This allows flexibility in assigning drivers to different buses and handling multiple passengers for different journeys. Junction tables maintain these relationships, allowing for detailed tracking of bus assignments and passenger bookings.

### Journey Management

The system records detailed information about each journey, such as which bus was used, who drove it, and which passengers booked the journey. This feature is crucial for tracking travel histories, scheduling, and generating reports.

### Data Integrity

Foreign key constraints ensure that only valid data is entered into the junction tables, maintaining referential integrity across the system. For example, a bus must exist in the **BUS** table before it can be assigned to a driver or booked by a passenger, reducing the risk of data inconsistencies.

## Demonstrated SQL Operations

The system demonstrates various SQL operations, including:

- **Inserting Data**: New buses, drivers, and passengers can be added to the system. These entities can also be linked together using the junction tables for specific journeys.
  
- **Updating Data**: Bus details or driver assignments can be updated as needed. This allows the system to remain flexible in managing bus fleets and driver schedules.

- **Deleting Records**: Journey records or old bookings can be deleted, ensuring that the database remains relevant and up-to-date.

- **Joining Data**: SQL joins are used to retrieve comprehensive data, such as which drivers have operated a specific bus or which passengers have traveled on a particular bus.

- **Subqueries**: Subqueries help to filter data, such as finding buses that are currently available or have no scheduled trips.

![Reference](/update&%20delete.png)
![Reference](/Screenshot%202024-10-03%20230504.png)


---

### Transaction Management

The system supports transaction management using SQL commands like `BEGIN` and `COMMIT`. This ensures that operations involving multiple changes, such as booking a passenger and assigning them to a bus, are processed together to maintain consistency. Transactions are rolled back if any errors occur, safeguarding the system from partial updates.



### Data Control Language (DCL)

The system allows the use of **Data Control Language (DCL)** to manage permissions, such as granting specific users read-only access to the bus details or journey schedules. This ensures that sensitive data is protected while still allowing essential functions like data retrieval.

![Reference](/tcl%20and%20DCl.png)

---

## Conclusion

The **Bus Transport Management Database** provides a comprehensive solution for managing bus fleets, drivers, and passengers. With many-to-many relationships, journey tracking, and transaction management, the system is flexible, efficient, and reliable for large-scale transport management operations.

"# Hakizimana12-plsql_assignment1" 
