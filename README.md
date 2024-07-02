# Points Transaction API

This is a Ruby on Rails API application that processes point transactions from external API vendors. The application includes endpoints for storing single-point transactions and bulk-storing points transactions.

## Prerequisites

- Docker
- Docker Compose

## Setup

To set up the application, run the following command:

`make setup`

This command will create the database and run the migrations.

## Running the Application

To start the application, run:

`make start`

The application will be available at `http://localhost:3000`.

## Database Migrations

To run database migrations, use:

`make migrate`

## Running Tests

To run the test suite, use:

`make rspec`

This command will execute the RSpec test suite and generate the code coverage report.

## Shutting Down

To stop the application and remove the containers, use:

`make down`