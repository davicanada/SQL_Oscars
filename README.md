# Database Modeling and Development Project
## SQL project using the Oscars database

The practical project consists of modeling a database capable of managing information associated with the Oscars.
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
10. Each movie can be directed by only 1 director.

## Project Phases
<h4>1. Conceptual Data Model</h4>
&nbsp;&nbsp;&nbsp;&nbsp;- Problem Understanding.<br>
&nbsp;&nbsp;&nbsp;&nbsp;- Requirements Gathering.<br>
&nbsp;&nbsp;&nbsp;&nbsp;- Identification of Entities and Relationships.<br>
&nbsp;&nbsp;&nbsp;&nbsp;- ER Diagram: Cardinalities.<br>
 <h4>2. Logical Data Model</h4>
&nbsp;&nbsp;&nbsp;&nbsp;- Definition of Tables and Integrity Constraints.<br>
&nbsp;&nbsp;&nbsp;&nbsp;- Normalization.<br>
&nbsp;&nbsp;&nbsp;&nbsp;- Adjustments to the Logical Model and Data Dictionary.<br>
 <h4>3. Physical Data Model</h4>
&nbsp;&nbsp;&nbsp;&nbsp;- Implementation of the Physical Model.<br>
&nbsp;&nbsp;&nbsp;&nbsp;- Basic Testing on the DBMS.

## Entities
To identify the entities, we look for elements that can have multiple occurrences. In the case of the project:
1. Movie
2. Actor
3. Director
4. Award

## Relationships
We look for action verbs that associate entities:
1. Actor participates in Movie
2. Movie wins Award

## Attributes
We look for possible characteristics of the entities:
### Movie
1. ID
2. Title
3. Director
### Actor
1. ID
2. Name
3. City
4. Country
5. Gender
### Director
1. ID
2. Name
3. City
4. Country
### Award
1. ID
2. Description

## Summary: Entities, Attributes and Relationships
The model below show relationships many-to-many. The goal is to substitute them to other type of relationship. To do this, we need to create two auxiliary tables.. 
<img width='900' height='500' src="https://scontent-lga3-2.xx.fbcdn.net/v/t39.30808-6/356232219_2955922324540691_108196361103214000_n.jpg?_nc_cat=101&cb=99be929b-3346023f&ccb=1-7&_nc_sid=730e14&_nc_ohc=LtEfvkuBmzUAX8NpcCX&_nc_ht=scontent-lga3-2.xx&oh=00_AfDM-bkzH4pNZJot21hLnGqhJWdGpa7l3QEomUeBfIYQTA&oe=649B9169" />

Here is the formal description of our entities, relationships, and attributes:
- Movie (Movie_ID, Title, Director_ID)
- Actor (Actor_ID, Actor_Name, City, Country, Gender)
- Director (Director_ID, Director_Name, City, Country)
- Award (Award_ID, Award_Description)
- Participation (P_Actor_ID, P_Movie_ID)
- Award_Ceremony (Movie_ID, Award_ID, Year)

## The final ER Diagram using Microsoft SQL Server
<img width='900' height='600' src="https://scontent-lga3-1.xx.fbcdn.net/v/t39.30808-6/353449671_2955977304535193_6713250933068755998_n.jpg?_nc_cat=110&cb=99be929b-3346023f&ccb=1-7&_nc_sid=730e14&_nc_ohc=rajrWFR8S0IAX_ZrSmC&_nc_ht=scontent-lga3-1.xx&oh=00_AfDDfIk4DXA76hq1iAtfi6yk36lOags2PR_edU9xMKXS6Q&oe=649C86A7" />
