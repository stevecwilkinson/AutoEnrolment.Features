Feature: Low Earning Individuals

Set of scenarios for individuals earning below the relevant earnings thresholds

# # This feature file contains scenarios for individuals earning below certain thresholds.
Rule: Employees that earn less than GBP 10000 per year
############################################################

Background:
	Given a monthly paid employee born on 1990-01-01 earning GBP 9999 per year
	And a pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30

@no_postponement
Scenario: Add two numbers
	Given the first number is 50
	And the second number is 70
	When the two numbers are added
	Then the result should be 120

@no_postponement
Scenario: Add two numbers again
	Given the first number is 50
	And the second number is 70
	When the two numbers are added
	Then the result should be 120

Rule: Employees that earn less than GBP 5000 per year

Background:
	Given an employee

@no_postponement
Scenario: Add two numbers 3
	Given the first number is 50
	And the second number is 70
	When the two numbers are added
	Then the result should be 120

@no_postponement
Scenario: Add two numbers again 4
	Given the first number is 50
	And the second number is 70
	When the two numbers are added
	Then the result should be 120