# Published under Creative Commons Zero License (CC0 1.0 Universal)

Feature: Individuals Earning Over Thresholds But State Pension Age And Over

	Set of scenarios for individuals at or over State Pension Age

	Rule: Employees at State Pension Age that earn at least GBP 10000 per year without postponement

		Background:
			Given an employee born on 1958-05-01 currently in status 'unassessed'
			And the employee has a State Pension Age of 66
			And the following postponements are applied:
				| PostponementType | Is Applied | Period |
				| Employer         | no         |        |
				| New Joiner       | no         |        |
				| Eligibility      | no         |        |

		@no_postponement
		Scenario: Unassessed monthly paid employee at SPA earning GBP 833 should be assessed as non-eligible
			Given a monthly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 833.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'a non-eligible jobholder'

		@no_postponement
		Scenario: Unassessed weekly paid employee at SPA earning GBP 192 should be assessed as non-eligible
			Given a weekly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 192.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'a non-eligible jobholder'

	Rule: Employees just under 75 that earn at least GBP 10000 per year without postponement

		Background:
			Given an employee born on 1950-04-02 currently in status 'unassessed'
			And the employee has a State Pension Age of 66
			And the following postponements are applied:
				| PostponementType | Is Applied | Period |
				| Employer         | no         |        |
				| New Joiner       | no         |        |
				| Eligibility      | no         |        |

		@no_postponement
		Scenario: Unassessed monthly paid employee aged just 75 earning GBP 833 should be assessed as non-eligible
			Given a monthly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 833.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'a non-eligible jobholder'

		@no_postponement
		Scenario: Unassessed weekly paid employee aged just under 75 earning GBP 192 should be assessed as non-eligible
			Given a weekly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 192.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'a non-eligible jobholder'

	Rule: Employees at 75 that earn at least GBP 10000 per year without postponement

		Background:
			Given an employee born on 1950-04-01 currently in status 'unassessed'
			And the employee has a State Pension Age of 66
			And the following postponements are applied:
				| PostponementType | Is Applied | Period |
				| Employer         | no         |        |
				| New Joiner       | no         |        |
				| Eligibility      | no         |        |

		@no_postponement
		Scenario: Unassessed monthly paid employee aged 75 earning GBP 833 should be assessed as exempt
			Given a monthly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 833.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'an exempt worker'

		@no_postponement
		Scenario: Unassessed weekly paid employee aged just under SPA earning GBP 192 should be assessed as exempt
			Given a weekly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 192.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'an exempt worker'

	Rule: Employees at SPA that earn at least GBP 10000 per year during postponement

		Background:
			Given an employee born on 1958-05-01 currently in status 'unassessed'
			And the employee has a State Pension Age of 66
			And the employer has a Duties Start Date of 2025-02-01
			And the following postponements are applied:
				| Postponement Type | Is Applied | Period |
				| Employer          | yes        | 3      |
				| New Joiner        | no         |        |
				| Eligibility       | no         |        |

		@with_company_postponement
		Scenario: Unassessed monthly paid employee at SPA earning GBP 833 should be assessed as postponed during postponement
			Given a monthly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 833.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'postponed' with a deferral date of 2025-05-01

		@with_company_postponement
		Scenario: Unassessed weekly paid employee at SPA earning under GBP 192 should be assessed as postponed during postponement
			Given a weekly pay run with pay date 2025-04-07 and pay period from 2025-04-01 to 2025-04-07
			And the employee earns GBP 192.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'postponed' with a deferral date of 2025-05-01

	Rule: Employees just under age 75 that earn at least GBP 10000 per year during postponement

		Background:
			Given an employee born on 1950-04-02 currently in status 'unassessed'
			And the employee has a State Pension Age of 66
			And the employer has a Duties Start Date of 2025-02-01
			And the following postponements are applied:
				| Postponement Type | Is Applied | Period |
				| Employer          | yes        | 3      |
				| New Joiner        | no         |        |
				| Eligibility       | no         |        |

		@with_company_postponement
		Scenario: Unassessed monthly paid employee aged just under 75 earning GBP 833 should be assessed as postponed during postponement
			Given a monthly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 832.99 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'postponed' with a deferral date of 2025-05-01

		@with_company_postponement
		Scenario: Unassessed weekly paid employee aged just under 75 earning GBP 192 should be assessed as postponed during postponement
			Given a weekly pay run with pay date 2025-04-07 and pay period from 2025-04-01 to 2025-04-07
			And the employee earns GBP 192.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'postponed' with a deferral date of 2025-05-01

	Rule: Employees just under SPA before postponement that earn at least GBP 10000 per year once postponement ends

		Background:
			Given an employee born on 1958-04-02 currently in status 'postponed' with a deferral date of 2025-05-01
			And the employee has a State Pension Age of 66
			And the employer has a Duties Start Date of 2025-02-01
			And the following postponements are applied:
				| Postponement Type | Is Applied | Period |
				| Employer          | yes        | 3      |
				| New Joiner        | no         |        |
				| Eligibility       | no         |        |

		@with_company_postponement
		Scenario: Unassessed monthly paid employee aged just under SPA earning GBP 833 should be assessed as non-eligible under postponement
			Given a monthly pay run with pay date 2025-05-20 and pay period from 2025-05-01 to 2025-05-31
			And the employee earns GBP 833.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'a non-eligible jobholder'

		@with_company_postponement
		Scenario: Unassessed weekly paid employee aged just under SPA earning under GBP 192 should be assessed as non-eligible under postponement
			Given a weekly pay run with pay date 2025-05-07 and pay period from 2025-05-01 to 2025-05-07
			And the employee earns GBP 192.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'a non-eligible jobholder'

	Rule: Employees just under age 75 before postponement that earn at least GBP 10000 per year once postponement ends

		Background:
			Given an employee born on 1950-04-30 currently in status 'unassessed'
			And the employee has a State Pension Age of 66
			And the employer has a Duties Start Date of 2025-02-01
			And the following postponements are applied:
				| Postponement Type | Is Applied | Period |
				| Employer          | yes        | 3      |
				| New Joiner        | no         |        |
				| Eligibility       | no         |        |

		@with_company_postponement
		Scenario: Unassessed monthly paid employee aged 75 earning GBP 833 should be assessed as exempt once postponement ends
			Given a monthly pay run with pay date 2025-05-20 and pay period from 2025-05-01 to 2025-05-30
			And the employee earns GBP 833.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'an exempt worker'

		@with_company_postponement
		Scenario: Unassessed weekly paid employee aged 75 earning GBP 192 should be assessed as exempt during postponement
			Given a weekly pay run with pay date 2025-04-07 and pay period from 2025-04-01 to 2025-04-07
			And the employee earns GBP 192.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'an exempt worker'

