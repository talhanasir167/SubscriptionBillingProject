# Project Name

A brief description of your project.

## Table of Contents

- [Ruby Version](#ruby-version)
- [Rails Version](#rails-version)
- [Postgres Version](#postgres-version)
- [Getting Started](#getting-started)
- [Code Overview](#code-overview)
  - [Dependencies](#dependencies)
  - [Folders](#folders)
- [How It Works](#how-it-works)

## Ruby Version

- Ruby Version: 2.7.2

## Rails Version

- Rails Version: 6.0.4.7

## Postgres Version

- Postgres Version: 14.2

## Getting Started

To get the Rails server running locally:

1. Clone this repo
2. Run `bundle install` to install all required dependencies
3. Run `rails db:migrate` to apply database migrations
4. Run `rails s` to start the local server

## Code Overview

### Dependencies

This project relies on several dependencies:

- **Postgresql:** Used for the database.
- **acts_as_paranoid:** Enables soft deletion (used to halt subscriptions).
- **Stripe:** Implements payment functionality.
- **Devise:** Provides authentication.
- **Cloudinary:** Facilitates media uploads to the cloud.
- **Bootstrap:** Enhances the user interface.
- **Pundit:** Enables policy enforcement.

### Folders

- `app/models`: Contains database models with methods, validations, queries, and relations.
- `app/views`: Contains templates for generating views.
- `app/controllers`: Houses controllers that handle requests, manipulate models, and render views.
- `config`: Contains configuration files for the Rails application and the database, including initializers.
- `db`: Contains migrations to create the database schema.

## How It Works

Here's an overview of how the project works:

1. Users sign up by providing their name and email. Verification is done through email.
2. Authenticated users can purchase subscription plans and activate them through Stripe payment.
3. Users can edit their feature usage, and they will be charged at the end of their subscription period. Payments are processed via the Stripe API.
4. Users receive notifications when they are charged.
5. Users can view and update their billing details when editing their subscription or feature usage.
6. Users can access their profile data, including subscription details.
7. Users can edit their profiles and change their passwords.
8. Users receive monthly emails to update their subscriptions. Failure to update results in subscription suspension until renewal.

Devise requires only an email and password for registration. To allow additional parameters on sign-up, we use [application_controller#configure_permitted_parameters](https://github.com/gothinkster/rails-realworld-example-app/blob/master/app/controllers/application_controller.rb#L14) to permit additional parameters during registration.

Feel free to modify this README template to include specific details about your project and its usage.