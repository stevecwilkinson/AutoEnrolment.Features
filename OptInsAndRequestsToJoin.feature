# Published under Creative Commons Zero License (CC0 1.0 Universal)

Feature: Opt-in And Request To Join Tests

	Set of scenarios covering opt-ins and requests to join

    # WIP

	Rule: Employees aged 22 that earn at least GBP 10000 per year without postponement

		Background:
			Given an employee born on 2003-04-01 currently in status 'postponed'

		@no_postponement
		Scenario: Postponed monthly paid employee aged 22 earning GBP 833 should be assessed as eligible
			Given a monthly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 833.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'an eligible jobholder'

		@no_postponement
		Scenario: Unassessed weekly paid employee aged 22 earning GBP 192 should be assessed as eligible
			Given a weekly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 192.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'an eligible jobholder'

	Rule: Employees just under SPA that earn at least GBP 10000 per year without postponement

		Background:
			Given an employee born on 1958-04-02 currently in status 'unassessed'
			And the employee has a State Pension Age of 66
			And the following postponements are applied:
				| PostponementType | Is Applied | Period |
				| Employer         | no         |        |
				| New Joiner       | no         |        |
				| Eligibility      | no         |        |

		@no_postponement
		Scenario: Unassessed monthly paid employee aged just under SPA earning GBP 833 should be assessed as eligible
			Given a monthly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 833.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'an eligible jobholder'

		@no_postponement
		Scenario: Unassessed weekly paid employee aged just under SPA earning GBP 192 should be assessed as eligible
			Given a weekly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 192.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'an eligible jobholder'

	Rule: Employees aged 22 that earn at least GBP 10000 per year during postponement

		Background:
			Given an employee born on 2003-04-01 currently in status 'unassessed'
			And the employer has a Duties Start Date of 2025-02-01
			And the following postponements are applied:
				| Postponement Type | Is Applied | Period |
				| Employer          | yes        | 3      |
				| New Joiner        | no         |        |
				| Eligibility       | no         |        |

		@with_company_postponement
		Scenario: Unassessed monthly paid employee aged 22 earning GBP 833 should be assessed as postponed during postponement
			Given a monthly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 833.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'postponed' with a deferral date of 2025-05-01

		@with_company_postponement
		Scenario: Unassessed weekly paid employee aged 22 earning under GBP 192 should be assessed as postponed during postponement
			Given a weekly pay run with pay date 2025-04-07 and pay period from 2025-04-01 to 2025-04-07
			And the employee earns GBP 192.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'postponed' with a deferral date of 2025-05-01

	Rule: Employees just under SPA that earn at least GBP 10000 per year during postponement

		Background:
			Given an employee born on 1958-04-02 currently in status 'unassessed'
			And the employee has a State Pension Age of 66
			And the employer has a Duties Start Date of 2025-02-01
			And the following postponements are applied:
				| Postponement Type | Is Applied | Period |
				| Employer          | yes        | 3      |
				| New Joiner        | no         |        |
				| Eligibility       | no         |        |

		@with_company_postponement
		Scenario: Unassessed monthly paid employee aged just under SPA earning GBP 833 should be assessed as postponed during postponement
			Given a monthly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 832.99 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'postponed' with a deferral date of 2025-05-01

		@with_company_postponement
		Scenario: Unassessed weekly paid employee aged just under SPA earning GBP 192 should be assessed as postponed during postponement
			Given a weekly pay run with pay date 2025-04-07 and pay period from 2025-04-01 to 2025-04-07
			And the employee earns GBP 192.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'postponed' with a deferral date of 2025-05-01

	Rule: Employees aged 22 that earn at least GBP 10000 per year once postponement ends

		Background:
			Given an employee born on 2003-04-01 currently in status 'postponed' with a deferral date of 2025-05-01
			And the employer has a Duties Start Date of 2025-02-01
			And the following postponements are applied:
				| Postponement Type | Is Applied | Period |
				| Employer          | yes        | 3      |
				| New Joiner        | no         |        |
				| Eligibility       | no         |        |

		@with_company_postponement
		Scenario: Unassessed monthly paid employee aged 22 earning GBP 833 should be assessed as eligible under postponement
			Given a monthly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 833.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'an eligible jobholder'

		@with_company_postponement
		Scenario: Unassessed weekly paid employee aged 22 earning GBP 192 should be assessed as eligible under postponement
			Given a weekly pay run with pay date 2025-04-07 and pay period from 2025-04-01 to 2025-04-07
			And the employee earns GBP 192.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'an eligible jobholder'

	Rule: Employees just under SPA that earn at least GBP 10000 per year once postponement ends

		Background:
			Given an employee born on 1958-05-02 currently in status 'postponed' with a deferral date of 2025-05-01
			And the employer has a Duties Start Date of 2025-02-01
			And the following postponements are applied:
				| Postponement Type | Is Applied | Period |
				| Employer          | yes        | 3      |
				| New Joiner        | no         |        |
				| Eligibility       | no         |        |

		@with_company_postponement
		Scenario: Unassessed monthly paid employee aged just under SPA earning GBP 833 should be assessed as eligible under postponement
			Given a monthly pay run with pay date 2025-04-20 and pay period from 2025-04-01 to 2025-04-30
			And the employee earns GBP 833.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'an eligible jobholder'

		@with_company_postponement
		Scenario: Unassessed weekly paid employee aged just under SPA earning under GBP 192 should be assessed as eligible under postponement
			Given a weekly pay run with pay date 2025-04-07 and pay period from 2025-04-01 to 2025-04-07
			And the employee earns GBP 192.00 in the pay period
			When the pay run is processed
			Then the employee should be assessed as 'an eligible jobholder'			