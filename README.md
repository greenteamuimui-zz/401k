# Captain401 401K Payroll System

## Description

This command-line program take two arguments:

  1. Path to Payroll CSV File
  1. Path to Census CSV File

and print the individual employee's personal contribution on the payroll, the total company match contribution and individual's portfolio.

## Installation
  1. Down and unzip the files
  2. Run `cd skipper401/`
  3. Install the required gems running the line `bundle install` in the top directory
  4. Run `ruby 401_system_command.rb [path_to_payroll_csv_file] [path_to_census_csv_file]`

### Example
`ruby 401_system_command.rb data/payroll_631fa526.csv data/census_1498456690.csv`

## How to run the tests
  1. Run `rspec spec/`
