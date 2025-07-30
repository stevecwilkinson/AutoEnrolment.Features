# Published under Creative Commons Zero License (CC0 1.0 Universal)

Feature: Low Earning Individuals

	Set of scenarios for individuals earning below the relevant earnings thresholds

	Rule: Employees 22 and over that earn less than GBP 10000 per year without postponement

		Background:
			Given an employee born on 2003-04-01 currently in status 'unassessed'
			And the following postponements are applied:
				| PostponementType | Is Applied | Period |
				| Employer         | no         |        |
				| New Joiner       | no         |        |
				| Eligibility      | no         |        |

		@no_postponement
		Scenario: Unassessed monthly paid employee aged 22 earning just under GBP 833 should be assessed as non-eligible
			Given a monthly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 832.99 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'a non-eligible jobholder'

		@no_postponement
		Scenario: Unassessed weekly paid employee aged 22 earning just under GBP 192 should be assessed as non-eligible
			Given a weekly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 191.99 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'a non-eligible jobholder'

		@no_postponement
		Scenario: Unassessed monthly paid employee aged 22 earning under GBP 520 should be assessed as entitled
			Given a monthly pay run with pay date 2025-04-07 and pay period from 2025-04-01 to 2025-04-07
			And the employee earns GBP 519.99 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'an entitled worker'

		@no_postponement
		Scenario: Unassessed weekly paid employee aged 22 earning under GBP 120 should be assessed as entitled
			Given a weekly pay run with pay date 2025-04-07 and pay period from 2025-04-01 to 2025-04-07
			And the employee earns GBP 119.99 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'an entitled worker'

	Rule: Employees 22 and over that earn less than GBP 10000 per year during postponement

		Background:
			Given an employee born on 2003-04-01 currently in status 'unassessed'
			And the employer has a Duties Start Date of 2025-02-01
			And the following postponements are applied:
				| Postponement Type | Is Applied | Period |
				| Employer          | yes        | 3      |
				| New Joiner        | no         |        |
				| Eligibility       | no         |        |

		@with_company_postponement
		Scenario: Unassessed monthly paid employee aged 22 earning just under GBP 833 should be assessed as postponed during postponement
			Given a monthly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 832.99 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'postponed' with a deferral date of 2025-05-01

		@with_company_postponement
		Scenario: Unassessed weekly paid employee aged 22 earning under GBP 192 should be assessed as postponed during postponement
			Given a weekly pay run with pay date 2025-04-07 and pay period from 2025-04-01 to 2025-04-07
			And the employee earns GBP 191.99 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'postponed' with a deferral date of 2025-05-01

		@with_company_postponement
		Scenario: Unassessed monthly paid employee aged 22 earning just under GBP 520 should be assessed as postponed during postponement
			Given a monthly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 519.99 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'postponed' with a deferral date of 2025-05-01

		@with_company_postponement
		Scenario: Unassessed weekly paid employee aged 22 earning under GBP 120 should be assessed as postponed during postponement
			Given a weekly pay run with pay date 2025-04-07 and pay period from 2025-04-01 to 2025-04-07
			And the employee earns GBP 119.99 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'postponed' with a deferral date of 2025-05-01

	Rule: Employees 22 and over that earn less than GBP 10000 per year once postponement ends

		Background:
			Given an employee born on 2003-04-01 currently in status 'postponed' with a deferral date of 2025-05-01
			And the employer has a Duties Start Date of 2025-02-01
			And the following postponements are applied:
				| Postponement Type | Is Applied | Period |
				| Employer          | yes        | 3      |
				| New Joiner        | no         |        |
				| Eligibility       | no         |        |

		@with_company_postponement
		Scenario: Unassessed monthly paid employee aged 22 earning just under GBP 833 should be assessed as non-eligible under postponement
			Given a monthly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 832.99 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'a non-eligible jobholder'

		@with_company_postponement
		Scenario: Unassessed weekly paid employee aged 22 earning under GBP 192 should be assessed as non-eligible under postponement
			Given a weekly pay run with pay date 2025-04-07 and pay period from 2025-04-01 to 2025-04-07
			And the employee earns GBP 191.99 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'a non-eligible jobholder'

		@with_company_postponement
		Scenario: Unassessed monthly paid employee aged 22 earning just under GBP 520 should be assessed as entitled under postponement
			Given a monthly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 519.99 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'an entitled worker'

		@with_company_postponement
		Scenario: Unassessed weekly paid employee aged 22 earning under GBP 120 should be assessed as entitled under postponement
			Given a weekly pay run with pay date 2025-04-07 and pay period from 2025-04-01 to 2025-04-07
			And the employee earns GBP 119.99 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'an entitled worker'