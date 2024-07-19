# Oscar Database Modeling and Development Project

## Overview
This project involves modeling a database to manage information associated with the Oscars. The database adheres to specific business rules and is designed using various data modeling techniques. The implementation is done using Microsoft SQL Server.

## Business Rules
The database project must adhere to the following business rules:
1. The database must manage all information related to the Oscars.
2. The possible Oscar awards (to simplify) are: Best Picture, Best Director, Best Actor, and Best Actress. Each award has an identification code.
3. It should be possible to register a limited quantity of Movies, Directors, Actors, and Actresses in the database.
4. The registered Movies, Directors, Actors, and Actresses do not necessarily have to be the winners. However, since it is an Oscar database, the stored Movies, Directors, Actors, and Actresses must necessarily be those who were nominated for one of the 4 awards.
5. Each actor can participate in one or more movies.
6. Despite an actor being able to be a director as well, they should be registered separately as an actor and as a director.
7. It should be easy to identify, for each movie, its respective director.
8. Each actor/actress and director has an identification code, full name, nationality (city and country). In the case of actors/actresses, their gender should also be recorded.
9. Each movie can win one of the 4 awards defined earlier in a particular year of the ceremony. The same movie cannot win the same award in more than one year.
10. Each movie can be directed by only one director.

## Project Phases

### 1. Conceptual Data Model
- Problem Understanding
- Requirements Gathering
- Identification of Entities and Relationships
- ER Diagram: Cardinalities

### 2. Logical Data Model
- Definition of Tables and Integrity Constraints
- Normalization
- Adjustments to the Logical Model and Data Dictionary

### 3. Physical Data Model
- Implementation of the Physical Model
- Basic Testing on the DBMS

## Entities and Attributes

### Movie
| Attribute | Description |
|-----------|-------------|
| Movie_ID  | Unique identifier for the movie |
| Title     | Title of the movie |
| Director_ID | ID of the director |

### Actor
| Attribute | Description |
|-----------|-------------|
| Actor_ID  | Unique identifier for the actor |
| Name      | Full name of the actor |
| City      | City of the actor |
| Country   | Country of the actor |
| Gender    | Gender of the actor |

### Director
| Attribute | Description |
|-----------|-------------|
| Director_ID | Unique identifier for the director |
| Name        | Full name of the director |
| City        | City of the director |
| Country     | Country of the director |

### Award
| Attribute         | Description |
|-------------------|-------------|
| Award_ID          | Unique identifier for the award |
| Award_Description | Description of the award |

## Relationships
- Actor participates in a Movie
- Movie wins an Award
- Director directs a Movie

## Summary: Entities, Attributes, and Relationships
It is necessary to create the ERD (Entity Relationship Diagram) and define the cardinalities involved for the project in the conceptual model.

### Conceptual ER Diagram
The conceptual ER Diagram is shown below, outlining the relationships and cardinalities between entities.

![Conceptual ER Diagram](https://scontent-lga3-2.xx.fbcdn.net/v/t39.30808-6/356232219_2955922324540691_108196361103214000_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=127cfc&_nc_ohc=XbfYSldOYTgQ7kNvgGn8gLh&_nc_ht=scontent-lga3-2.xx&cb_e2o_trans=t&oh=00_AYCbYEUXfKZeGFMJob_rkQLseG3PjwnOGWg7bzLh3FSQ9Q&oe=66A05D69)

### Adjusted ER Diagram
Now that the cardinalities have been defined, it is necessary to adjust those that generate a many-to-many relationship. In the case of this project, we have two relationships that generate this type of cardinality. They are:
- Movie and Actor
- Movie and Award

The adjusted ER Diagram, which resolves many-to-many relationships, is shown below.

![Adjusted ER Diagram](https://scontent-lga3-1.xx.fbcdn.net/v/t39.30808-6/356650846_2958744327591824_350077139536085951_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=127cfc&_nc_ohc=IDUHXlzPHssQ7kNvgHi0jY0&_nc_ht=scontent-lga3-1.xx&cb_e2o_trans=t&oh=00_AYB4wRvQmSp64-L9bx4V9xAH5_Lpc84CFUwMEzmGN7wdoA&oe=66A07A7A)

As you can see at the Award Ceremony table, while the columns Movie_ID and Award_ID are foreign keys referring to the tables Movie and Award, respectively, both of them together form the composite primary key of the Award Ceremony table.

Similarly, in the Participation table, the columns Actor_ID and Movie_ID are foreign keys referring to the Actor and Movie tables, respectively. Together, they form the composite primary key of the Participation table.

Here is the formal description of our entities, relationships, and attributes:
- Movie (Movie_ID, Title, Director_ID)
- Actor (Actor_ID, Actor_Name, Actor_City, Actor_Country, Actor_Gender)
- Director (Director_ID, Director_Name, Director_City, Director_Country)
- Award (Award_ID, Award_Description)
- Participation (P_Actor_ID, P_Movie_ID)
- Award_Ceremony (Movie_ID, Award_ID, Year)

### Final ER Diagram
The final ER Diagram implemented in Microsoft SQL Server is shown below.

![Final ER Diagram](https://scontent-lga3-1.xx.fbcdn.net/v/t39.30808-6/353449671_2955977304535193_6713250933068755998_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=127cfc&_nc_ohc=fn3Qu1qfF88Q7kNvgHvvT3a&_nc_ht=scontent-lga3-1.xx&cb_e2o_trans=t&oh=00_AYAs2D69341zhYqBull79JXeA-h8Dk6WFAlt1CaoF1aGXQ&oe=66A071A7)

## Usage
To use the database, you can run the following SQL queries to retrieve data:

```sql
-- Example query to find all movies directed by a specific director
SELECT Title FROM Movie WHERE Director_ID = (SELECT Director_ID FROM Director WHERE Name = 'Director Name');

-- Example query to find all actors in a specific movie
SELECT Actor_Name FROM Actor 
JOIN Participation ON Actor.Actor_ID = Participation.P_Actor_ID
WHERE Participation.P_Movie_ID = (SELECT Movie_ID FROM Movie WHERE Title = 'Movie Title');
