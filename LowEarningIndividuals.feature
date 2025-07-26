# Published under Creative Commons Zero License (CC0 1.0 Universal)

Feature: Low Earning Individuals

Set of scenarios for individuals earning below the relevant earnings thresholds

	Rule: Employees 22 and over that earn less than GBP 10000 per year

		Background:
			Given an employee with status 'unassessed' born on 2003-04-01
			And no employer, no new joiner and no eligibility postponement is to be applied

		@no_postponement
		Scenario: Unassessed monthly paid employee aged 22 earning just under GBP 833 should be treated as non-eligible jobholder
			Given a monthly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			When the pay run is processed
			Then the employee should be treated as a 'non-eligible jobholder'

		@no_postponement
		Scenario: Unassessed weekly paid employee aged 22 earning under GBP 520 should be treated as entitled worker
			Given a weekly pay run with pay date 2025-04-07 and pay period from 2025-04-01 to 2025-04-07
			When the pay run is processed
			Then the employee should be treated as a 'entitled worker'

#	Rule: Employees 22 and over that earn less than GBP 6240 per year
#
#		Background:
#			Given a monthly paid employee born on 1990-01-02 earning GBP 999 per year
#			And a pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
#
#		@no_postponement
#		Scenario: Add two numbers 3
#			Given the first number is 50
#			And the second number is 70
#			When the two numbers are added
#			Then the result should be 120
#
#		@no_postponement
#		Scenario: Add two numbers again 4
#			Given the first number is 50
#			And the second number is 70
#			When the two numbers are added
#			Then the result should be 120