#!/bin/bash

# Generate migration files for all tables

rails generate migration CreateCourses
rails generate migration CreateStudents
rails generate migration CreateMajors
rails generate migration CreateDegreePlans
rails generate migration CreateTracks
rails generate migration CreateCores
rails generate migration CreateEmphases
rails generate migration CreatePreReqs
rails generate migration CreateMyDegreePlans