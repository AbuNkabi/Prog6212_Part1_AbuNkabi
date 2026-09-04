# Prog6212_Part1_AbuNkabi
RaceDay Event Management System

PROG6212 Programming 2B
PoE Part 1 – System planning and database


Project Description
RaceDay is a web based event management system for all road running/walking/cycling events in South Africa.
Part 1 focuses on the RaceDay system as you are planning it prior to development. The primary goal of this component is to create the database, plan the RESTful API, build the SQL script and manage the project via GitHub.

Part 1 Deliverables

In Part 1 of this contract, the following deliverables are 'co-part of' the overall contract obligation:

Create, read, update, and delete data at any point.“Get access to the data, anytime, anywhere”

API Endpoint Plan
SQL Database Script
GitHub Repository
GitHub Actions CI/CD
README File
Video Presentation


Section A: Entity Relationship Diagram

The RaceDay ERD has 6 entities:

User
Event
EventType
Category
Enrolment
Result

The ERD shows the attributes, primary keys, foreign keys, relationships and cardinality for the RaceDay system.

The primary relationships are:

The number of Events created by one Organiser is many.

Many Events can be attached to one EventType.

There can be multiple Categories for one Event.

Enrolments can be many to a Participant.

There can be many Enrolments assigned to one Event.

There may be many Enrolments in one Category.

One Enrolment can have zero or one Result.

The Enrolment entity is used to link Participants to Events (and is many to many).

The ERD is kept in:

docs/ERD.pdf

Section B: API Endpoint Plan

The API Endpoint Plan outlines a RESTful approach to developing the API in another phase of the project.

This endpoint plan consists of the following six columns:

HTTP Method
Route
Description
Role Required
Request Body
Expected Response

The planned API functionality includes:

Authentication

Registration and login of users:

User Profile

Access to and editing their own account.

Events

Viewing, creating, updating and deleting events.

Categories

Accessing and controlling categories of events.

Event Enrolments

Enabling Participants to register for events and Organisers to see which Participants are registered for their events.

Results

Provide Organisers with the ability to take photos of the finish line to record finishing times and positions; and provide Participants with a view of their own performance.

The API Endpoint Plan is stored in:

docs/API.pdf

This section contains the SQL Database Scripts.SQL Database Scripts included in Section C.

The RaceDay database can be tested by running SQL Server Management Studio (SSMS) and supports SQL Server.

The SQL script has:

CREATE TABLE statements.

Primary keys.

Foreign keys.

WHERE necessary, add NOT NULL constraints.

Include UNIQUE constraints if they are applicable.

Use default values – where appropriate.

Realistic sample data.

The database includes sample data on the following:

2 Organisers.

2 Participants.

3 Events.

There are several categories for Events:

Sample Enrolments.

The following SQL Database Script is stored in:
Pictures folder
docs/RaceDay.Database.sql

GitHub Repository

The RaceDay Part 1 project is stored in GitHub and managed.

Repository includes all the necessary files of Part 1 and shows the development process, along with useful commits.

Repository Structure

docs
pictures.pdf
ReadMe.md
RaceDay.Database.sql

